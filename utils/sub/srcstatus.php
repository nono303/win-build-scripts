<?php
	include( dirname(__FILE__) . '/_functions.php');

	date_default_timezone_set("Europe/Paris");
	define("NB_TAGS",8);

	if(in_array("gitcg", $argv)){
		define("GIT_GC",true);
		echo "gitcg: ON".PHP_EOL;
	} else {
		define("GIT_GC",false);
		echo "gitcg: OFF".PHP_EOL;
	}

	if(in_array("nofetch", $argv)){
		define("REPO_FETCH",false);
		echo "nofetch: ON".PHP_EOL;
	} else {
		define("REPO_FETCH",true);
		echo "nofetch: OFF".PHP_EOL;
	}
	if(in_array("verbose", $argv)){
		define("VERBOSE",true);
		echo "verbose: ON".PHP_EOL;
	} else {
		define("VERBOSE",false);
		echo "verbose: OFF".PHP_EOL;
	}

	$srcdir = str_replace("\\","/",$_ENV["PATH_SRC"])."/";
	echo "> ".$srcdir.PHP_EOL;
	
	$listdir = scandir($srcdir);
	$listdir[] = "libiconv\libiconv";
	unset($listdir[0]); // .
	unset($listdir[1]); // ..
	sort($listdir);

	$srccreate = file_get_contents(dirname(__FILE__) . '/srccreate.bat.in');
	file_put_contents($argv[1],'"name";"scm";"origin";"head";"status";"branch";"log tags";"last tag"'.PHP_EOL,FILE_APPEND);
	echo "*************************".PHP_EOL;
	foreach($listdir as $ele){
		$repo = $srcdir.$ele;
		$type = "man";
		if(is_dir($repo."/.git")){
			$type = "git";
			if(VERBOSE) echo $repo.PHP_EOL;
			$upstream = execnono($cmd = "git config --get remote.origin.url",NULL,$repo,NULL);
			if(VERBOSE) echo $cmd.PHP_EOL;
			$head = explode("^",execnono($cmd = "git name-rev --name-only HEAD",NULL,$repo,NULL))[0]; //execnono($cmd = "git describe --tags",NULL,$repo,NULL);
			if(VERBOSE) echo $cmd.PHP_EOL;
			preg_match("/^\* \(HEAD detached at ([^\)]+)\)/",execnono($cmd = "git branch -a",NULL,$repo,NULL),$matches);
			if(VERBOSE) echo $cmd.PHP_EOL;
			if($matches[1] && is_int(strpos($matches[1],"/")))
				$head = $matches[1];
			$srccreate .= "git clone ".$upstream." ".$ele.PHP_EOL."cd /D ".$ele.PHP_EOL."git checkout ".$head.PHP_EOL."cd /D ..".PHP_EOL;
			$gitclean = execnono($cmd = "git clean -fdx",NULL,$repo,NULL);
			if(VERBOSE) echo $cmd.PHP_EOL;
			if(REPO_FETCH){
				execnono($cmd = "git fetch 2>&1",NULL,$repo,NULL);
				if(VERBOSE) echo $cmd.PHP_EOL;
				// https://stackoverflow.com/a/58438257
				execnono($cmd = "git fetch --tags --force",NULL,$repo,NULL);
				if(VERBOSE) echo $cmd.PHP_EOL;
			}
			$commit = trim(execnono($cmd = "git rev-parse --short HEAD",NULL,$repo,NULL));
			preg_match("/HEAD ->(.*)\n/m",$res = execnono($cmd = "git branch -a --contains ".$commit." | grep -v detached",NULL,$repo,NULL),$matches);
			if($matches[1]) {
				$branch = $matches[1];
			} else {
				preg_match("/\* (.*)\n/m",$res,$matches);
				if($matches[1]) {
					$branch = $matches[1];
				} else {
					$allb = array_filter(explode("\n",$res));
					if(sizeof($allb) == 0){
						$branch = $allb[0];
					} elseif(sizeof($allb) == 1){
						$branch = $allb[0];
					} else {
						// print_r($allb);
						// arbitraire
						$branch = end($allb);
					}
				}
			}
			$branch ?
				$branch = end(explode("/",$branch)) :
				$branch = "";
			if(is_int(strpos($branch,"no branch")))
				$branch = "";
			// head is branch
			if(!is_int(strpos($head,"/"))){
				$branch = $head;
				$reset = execnono($cmd = "git reset --hard",NULL,$repo,NULL);
				$pullres = execnono($cmd = "git pull",NULL,$repo,NULL);
				if(VERBOSE) echo $cmd.PHP_EOL.$pullres.PHP_EOL;
				$tmp = explode(" ",$res = execnono($cmd = 'git log --no-walk --pretty="format:%h %ad" --date=iso-strict HEAD',NULL,$repo,NULL));
				$ltd = secondsToNbDay(time() - ($strtime = strtotime($tmp[1])));
				$logtags = date("Y-m-d H:i:s O",$strtime) ." (HEAD, commit: ".$tmp[0];
				$head = "branch/".$head;
				if ($ele == "libyuv"){
					preg_match("/ LIBYUV_VERSION ([0-9]+)/",file_get_contents($srcdir."/libyuv/include/libyuv/version.h"),$matches);
					$logtags .= ", ".$matches[1].")";
				} else {
					$logtags .= ", ".$head.")";
				}
			// head is tag
			} else {
				$logtags = execnono($cmd = 'git log --tags --simplify-by-decoration --author-date-order --pretty="format:%ai %d" | head -n '.NB_TAGS,NULL,$repo,NULL);
				$ltd = secondsToNbDay(time() - ($strtime = strtotime(explode(" (",$logtags)[0])));
			}
			$status = explode("\t",execnono($cmd = "git rev-list --left-right --count ".$commit."...HEAD",NULL,$repo,NULL)) [0];
			if(VERBOSE) echo $cmd.PHP_EOL;
			if($status && $status != "0"){
				$status = $status." commit(s) behind";
			} else {
				$status = "up to date";
			}
			if(GIT_GC){
				echo execnono($cmd = "git reflog expire --all --expire=now --expire-unreachable=now",NULL,$repo,NULL);
				if(VERBOSE) echo $cmd.PHP_EOL;
				echo execnono($cmd = "git gc --prune=now --aggressive",NULL,$repo,NULL);
				if(VERBOSE) echo $cmd.PHP_EOL;
			}
		} elseif(is_dir($repo."/.svn")){
			$type = "svn";
			if(REPO_FETCH){
				execnono($cmd = "svn update",NULL,$repo,NULL);
				if(VERBOSE) echo $cmd.PHP_EOL;
			}
			$svninfo = execnono($cmd = "svn info",NULL,$repo,NULL);
			if(VERBOSE) echo $cmd.PHP_EOL;
			preg_match("/Repository Root: ?(.*)\n/",$svninfo,$matches);
			$upstream = trim($matches[1]);
			preg_match("/Relative URL: \^\/(.*)\n/",$svninfo,$matches);
			$branch = trim($matches[1]);
			preg_match("/Revision: (.*)\n/",$svninfo,$matches);
			$head = trim($matches[1]);
			$srccreate .= "svn co ".$upstream."/".$branch." ".$ele.PHP_EOL."cd /D ".$ele.PHP_EOL."svn update -r ".$head.PHP_EOL."cd /D ..".PHP_EOL;
			$svninfo = execnono($cmd = "svn log -l ".NB_TAGS,NULL,$repo,NULL);
			if(VERBOSE) echo $cmd.PHP_EOL;
			$gitlasttags = "";
			foreach(explode("\n",$svninfo) as $line){
				preg_match("/r([0-9]+) .* ([0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2} [+-][0-9]{2}00)/",$line,$matches);
				if($matches[1] && $matches[2]){
					$had = "";
					if($gitlasttags == "")
						$gitlasttags = $matches[1];
					if($head == $matches[1])
						$had = "HEAD, ";
					$ltd = secondsToNbDay(time() - strtotime($matches[2]));
					$logtags .= $matches[2]." (".$had.$matches[1].")".PHP_EOL;
				}
			}
			if($gitlasttags != $head){
				$status = $gitlasttags;
			} else {
				$status = "up to date";
			}
			$head = "revision/".$head;
		}
		echo str_pad($type,4).str_pad($ele,26).str_pad($head,26).str_pad($status,10," ")."  ".str_pad($branch,20).PHP_EOL;
		file_put_contents($argv[1],'"'.$ele.'";"'.$type.'";"'.$upstream.'";"'.$head.'";"'.$status.'";"'.$branch.'";"'.$logtags.'";"'.$ltd.'"'.PHP_EOL,FILE_APPEND);
		$ele = "";
		$upstream = "";
		$branch = "";
		$status = "";
		$head = "";
		$logtags = "";
	}
	file_put_contents(dirname(__FILE__) . "/../srccreate.bat",$srccreate);
?>
