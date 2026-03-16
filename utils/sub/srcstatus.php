<?php
	include( dirname(__FILE__) . '/_functions-version.php');

	// tag history to show in csv
	const NB_TAGS = 8;

	// arg to const
	foreach([
		"GITGC"		=> "gitgc",
		"NOFETCH"	=> "nofetch",
		"DEBUG"			=> "verbose",
	] as $def => $argin) {
		define($def, in_array($argin, $argv) ? true : false);
		echo str_pad($def.": ",12).(constant($def) ? "ON" : "OFF").PHP_EOL;
	}

	echo "> ".PATH_SRC.PHP_EOL;
	$srccreate = file_get_contents(dirname(__FILE__) . '/srccreate.bat.in');
	file_put_contents($argv[1],'"name";"scm";"origin";"head";"branch";"log tags";"last tag"'.PHP_EOL,FILE_APPEND);
	echo "* ".pathenv("PATH_VERSION_BUILD").($ret = cleanCache() ? " cleaned" : " unable to clear").PHP_EOL;
	echo "*************************".PHP_EOL;

	foreach(glob(PATH_SRC."/*",GLOB_ONLYDIR) as $repo){
		$content = getVersion($ele = basename($repo));
		$logtags = "";
		$from = "man";
		if(is_dir($repo."/.git")){
			$from = "git";
			if(!NOFETCH){
				execnono("git clean -fdx", NULL, $repo, NULL);
				execnono("git fetch 2>&1", NULL, $repo, NULL);
				execnono("git fetch --tags --force", NULL, $repo, NULL); // https://stackoverflow.com/a/58438257
				if($content["from"] == "git ltag") {
					execnono("git reset --hard", NULL, $repo, NULL);
					execnono("git pull", NULL, $repo, NULL);
				}
			}
			if($content["from"] == "git tag") {	// head is tag
				$logtags = execnono('git log --tags --simplify-by-decoration --author-date-order --pretty="format:%ai %d" | head -n '.NB_TAGS, NULL, $repo, NULL);
				$ltd = secondsToNbDay(time() - ($strtime = strtotime(explode(" (",$logtags)[0])));
				$head = "tags/".$content["scm"]["tag"]["raw"];
			} else {							// head is branch
				$ltd = secondsToNbDay(time() - ($strtime = strtotime($content["scm"]["dateiso"])));
				$head = $content["scm"]["branch"];
				$logtags =
					date("Y-m-d H:i:s O",$strtime).
					" (HEAD, commit: ".$content["scm"]["commit"].", ".
					($ele == "libyuv" ? $content["product"] : $head).
					")";
			}
			$srccreate .=
				"git clone ".$content["scm"]["urlsclone"]["origin"]." ".$ele.PHP_EOL.
				"cd /D ".$ele.PHP_EOL.
				"git checkout ".$head.PHP_EOL.
				"cd /D ..".PHP_EOL;
			if($content["from"] != "git tag")
				$head = "branch/".$head;
		} elseif(is_dir($repo."/.svn")){
			$from = "svn";
			if(!NOFETCH)
				execnono("svn update", NULL, $repo, NULL);
			$head = $content["scm"]["commit"];
			$srccreate .=
				"svn co ".$content["scm"]["urls"]["origin"]."/".$content["scm"]["branchraw"]." ".$ele.PHP_EOL.
				"cd /D ".$ele.PHP_EOL.
				"svn update -r ".$head.PHP_EOL.
				"cd /D ..".PHP_EOL;
			$svninfo = execnono("svn log -l ".NB_TAGS, NULL, $repo, NULL);
			foreach(explode("\n",$svninfo) as $line){
				preg_match("/r([0-9]+) .* ([0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2} [+-][0-9]{2}00)/",$line,$matches);
				if($matches[1] && $matches[2]){
					$had = "";
					if($head == $matches[1])
						$had = "HEAD, ";
					$ltd = secondsToNbDay(time() - strtotime($matches[2]));
					$logtags .= $matches[2]." (".$had.$matches[1].")".PHP_EOL;
				}
			}
			$head = "revision/".$head;
		}
		echo
			str_pad($from,4).
			str_pad($ele,26).
			str_pad(str_replace(["tags/","branch/","revision/"],["\t\tt ","b ","\t\t\t\tr "],$head),26).
			PHP_EOL;
		file_put_contents($argv[1],'"'.$ele.'";"'.$from.'";"'.$content["scm"]["urls"]["origin"].'";"'.$head.'";"'.$content["scm"]["branch"].'";"'.$logtags.'";"'.$ltd.'"'.PHP_EOL,FILE_APPEND);
		if(GITGC && $from == "git"){
			foreach(explode("\n",execnono("git branch", NULL, $repo, NULL)) as $lb) {
				if(!str_starts_with($lb,"*")) {
					$cmd = "git branch -D ".$lb. " 2>&1";
					echo "\t".$cmd.PHP_EOL."\t".execnono($cmd, NULL, $repo, NULL).PHP_EOL;
				}
			}
			$cmd = "git gc --prune=now --aggressive 2>&1";
			echo "\t".$cmd." ".execnono($cmd, NULL, $repo, NULL).PHP_EOL;
			$cmd = "git reflog expire --all --expire=now 2>&1";
			echo "\t".$cmd." ".execnono($cmd, NULL, $repo, NULL).PHP_EOL;
		}
	}
	file_put_contents(dirname(__FILE__) . "/../srccreate.bat",$srccreate);
?>
