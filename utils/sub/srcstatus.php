<?php
	include( dirname(__FILE__) . '/_functions.php');

	date_default_timezone_set("Europe/Paris");
	define("NB_TAGS",5);

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

	$srcdir = str_replace("\\","/",$_ENV["PATH_SRC"])."/";
	echo "> ".$srcdir.PHP_EOL;

	$srccreate = file_get_contents(dirname(__FILE__) . '/srccreate.bat.in');
	file_put_contents($argv[1],'"name";"scm";"upstream";"head";"status";"branch";"log tags";"diff"'.PHP_EOL,FILE_APPEND);
	echo "*************************".PHP_EOL;
	foreach(scandir($srcdir) as $ele){
		if(is_dir($repo = $srcdir.$ele) &&  $ele != "." && $ele != ".."){
			$name = basename($repo);
			$type = "man";
			if(is_dir($repo."/.git")){
				// echo passthru("mklink /H C:\\sdk\\batch\\config\\scm\\git.".$name .".conf ".str_replace("/","\\",$repo)."\\.git\\config");
				$type = "git";
				$upstream = execnono("git config --get remote.origin.url",NULL,$repo,NULL);

				$head = explode("^",execnono("git name-rev --name-only HEAD",NULL,$repo,NULL))[0];//execnono("git describe --tags",NULL,$repo,NULL);
				preg_match("/^\* \(HEAD detached at ([^\)]+)\)/",execnono("git branch -a",NULL,$repo,NULL),$matches);
				if(is_int(strpos($matches[1],"/")))
					$head = $matches[1];
				$srccreate .= "git clone ".$upstream." ".$ele.PHP_EOL."cd /D ".$ele.PHP_EOL."git checkout ".$head.PHP_EOL."cd /D ..".PHP_EOL;
				$gitclean = execnono("git clean -fdx",NULL,$repo,NULL);
				if(REPO_FETCH){
					$gitfecthtag = execnono("git fetch",NULL,$repo,NULL);
					$gitfecthtag .= execnono("git fetch --tag",NULL,$repo,NULL);
				}
				preg_match("/^\* (.*)\n/",execnono("git branch -a",NULL,$repo,NULL),$matches);
				$branch = $matches[1];				
				$status = explode("\t",execnono("git rev-list --left-right --count ".$branch."...HEAD",NULL,$repo,NULL)) [0];
				if($status && $status != "0"){
					$status = $status." commit(s) behind";
					$diff= "git diff ".$head."..".$branch;
				} else {
					$diff= "";
					$status = "up to date";
				}
				$logtags = execnono('git log --tags --simplify-by-decoration --pretty="format:%ai %d" | head -n '.NB_TAGS,NULL,$repo,NULL);
				if(GIT_GC){
					echo execnono("git reflog expire --all --expire=now",NULL,$repo,NULL);
					echo execnono("git gc --prune=now --aggressive",NULL,$repo,NULL);
				}

			} elseif(is_dir($repo."/.svn")){
				$type = "svn";
				if(REPO_FETCH)
					$gitfecthtag = execnono("svn update",NULL,$repo,NULL);
				$svninfo = execnono("svn info",NULL,$repo,NULL);
				preg_match("/Repository Root: ?(.*)\n/",$svninfo,$matches);
				$upstream = trim($matches[1]);
				preg_match("/Relative URL: \^\/(.*)\n/",$svninfo,$matches);
				$branch = trim($matches[1]);
				preg_match("/Revision: (.*)\n/",$svninfo,$matches);
				$head = trim($matches[1]);
				$srccreate .= "svn co ".$upstream."/".$branch." ".$ele.PHP_EOL."cd /D ".$ele.PHP_EOL."svn update -r ".$head.PHP_EOL."cd /D ..".PHP_EOL;
				
				$svninfo = execnono("svn log -l ".NB_TAGS,NULL,$repo,NULL);
				$gitlasttags = "";
				foreach(explode("\n",$svninfo) as $line){
					preg_match("/r([0-9]+) .* ([0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2} [+-][0-9]{2}00)/",$line,$matches);
					if($matches[1] && $matches[2]){
						$had = "";
						if($gitlasttags == "")
							$gitlasttags = $matches[1];
						if($head == $matches[1])
							$had = "HEAD, ";
						$logtags .= $matches[2]." (".$had.$matches[1].")".PHP_EOL;
					}
				}
				if($gitlasttags != $head){
					$status = $gitlasttags;
				} else {
					$status = "up to date";
				}
			}
			echo str_pad($type,4).str_pad($name,20).str_pad($head,25).str_pad($status,26," ",STR_PAD_LEFT)."  ".str_pad($branch,20).PHP_EOL;
			file_put_contents($argv[1],'"'.$name.'";"'.$type.'";"'.$upstream.'";"'.$head.'";"'.$status.'";"'.$branch.'";"'.$logtags.'";"'.$diff.'"'.PHP_EOL,FILE_APPEND);
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