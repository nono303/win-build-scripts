<?php
	include( dirname(__FILE__) . '/_functions.php');

	date_default_timezone_set("Europe/Paris");
	define("NB_TAGS",5);
	static $notags = [
		// "dependencies", 
		"apr",
		"apr-util",
		"libyuv",
		"mod_h264_streaming", 
		"nssm", 
		"pecl-memcache", 
		"pecl-text-xdiff", 
		"php-cgi-spawner", 
		"php-geos", 
		"php-sdk", 
		"serf", 
		"verpatch"
	];

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

	$srccreate = file_get_contents(dirname(__FILE__) . '/srccreate.bat.in');
	file_put_contents($argv[1],'"name";"scm";"upstream";"head";"status";"branch";"log tags";"last tag";"diff"'.PHP_EOL,FILE_APPEND);
	echo "*************************".PHP_EOL;
	foreach(scandir($srcdir) as $ele){
	// foreach(["libyuv"] as $ele){
		if(is_dir($repo = $srcdir.$ele) &&  $ele != "." && $ele != ".."){
			$name = basename($repo);
			$type = "man";
			if(is_dir($repo."/.git")){
				// echo passthru("mklink /H C:\\sdk\\batch\\config\\scm\\git.".$name .".conf ".str_replace("/","\\",$repo)."\\.git\\config");
				$type = "git";
				if(VERBOSE) echo $repo.PHP_EOL;
				$upstream = execnono($cmd = "git config --get remote.origin.url",NULL,$repo,NULL);
				if(VERBOSE) echo $cmd.PHP_EOL;

				$head = explode("^",execnono($cmd = "git name-rev --name-only HEAD",NULL,$repo,NULL))[0];//execnono($cmd = "git describe --tags",NULL,$repo,NULL);
				if(VERBOSE) echo $cmd.PHP_EOL;
				preg_match("/^\* \(HEAD detached at ([^\)]+)\)/",execnono($cmd = "git branch -a",NULL,$repo,NULL),$matches);
				if(VERBOSE) echo $cmd.PHP_EOL;
				if(is_int(strpos($matches[1],"/")))
					$head = $matches[1];
				$srccreate .= "git clone ".$upstream." ".$ele.PHP_EOL."cd /D ".$ele.PHP_EOL."git checkout ".$head.PHP_EOL."cd /D ..".PHP_EOL;
				$gitclean = execnono($cmd = "git clean -fdx",NULL,$repo,NULL);
				if(VERBOSE) echo $cmd.PHP_EOL;
				if(REPO_FETCH){
					execnono($cmd = "git fetch",NULL,$repo,NULL);
					if(VERBOSE) echo $cmd.PHP_EOL;
					execnono($cmd = "git fetch --tag",NULL,$repo,NULL);
					if(VERBOSE) echo $cmd.PHP_EOL;
				}
				preg_match("/^\* (.*)\n/m",$res = execnono($cmd = "git branch -a",NULL,$repo,NULL),$matches);
				if(VERBOSE) echo $cmd.PHP_EOL;
				$branch = $matches[1];
				if(in_array($ele,$notags)){
					$reset = execnono($cmd = "git reset --hard",NULL,$repo,NULL);
					$pullres = execnono($cmd = "git pull",NULL,$repo,NULL);
					if(VERBOSE) echo $cmd.PHP_EOL.$pullres.PHP_EOL;
					$logtags = execnono($cmd = "git rev-parse --short HEAD",NULL,$repo,NULL);
					$ltd = "/";
					if ($ele == "libyuv"){
						preg_match("/ LIBYUV_VERSION ([0-9]+)/",file_get_contents($srcdir."/libyuv/include/libyuv/version.h"),$matches);
						$logtags .= " (".$matches[1].")";
					}
				} else {
					$logtags = execnono($cmd = 'git log --tags --simplify-by-decoration --pretty="format:%ai %d" | head -n '.NB_TAGS,NULL,$repo,NULL);
					$ltd = secondsToTime(time() - ($strtime = strtotime(explode(" (",$logtags)[0])));
				}
				$status = explode("\t",execnono($cmd = "git rev-list --left-right --count ".$branch."...HEAD",NULL,$repo,NULL)) [0];
				if(VERBOSE) echo $cmd.PHP_EOL;
				if($status && $status != "0"){
					$status = $status." commit(s) behind";
					$diff= "git diff ".$head."..".$branch;
				} else {
					$diff= "";
					$status = "up to date";
				}
				
				
				if(VERBOSE) echo $cmd.PHP_EOL;
				if(GIT_GC){
					echo execnono($cmd = "git reflog expire --all --expire=now",NULL,$repo,NULL);
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
						$ltd = secondsToTime(time() - strtotime($matches[2]));
						$logtags .= $matches[2]." (".$had.$matches[1].")".PHP_EOL;
					}
				}
				if($gitlasttags != $head){
					$status = $gitlasttags;
				} else {
					$status = "up to date";
				}
			}
			echo str_pad($type,4).str_pad($name,20).str_pad($head,26).str_pad($status,26," ",STR_PAD_LEFT)."  ".str_pad($branch,20).PHP_EOL;
			file_put_contents($argv[1],'"'.$name.'";"'.$type.'";"'.$upstream.'";"'.$head.'";"'.$status.'";"'.$branch.'";"'.$logtags.'";"'.$ltd.'";"'.$diff.'"'.PHP_EOL,FILE_APPEND);
			$name = "";
			$upstream = "";
			$branch = "";
			$status = "";
			$head = "";
			$logtags = "";
		}
	}
	file_put_contents(dirname(__FILE__) . "/../srccreate.bat",$srccreate);
?>