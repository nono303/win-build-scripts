<?php
	function execnono($cmd,$parts,$cwd,$env){
		$args = '';
		if($parts){
			foreach ($parts as $k => $part) {
				if (is_string($k)) {
					$args .= ' ' . escapeshellarg($k) . ' ' . escapeshellarg($part);
				} else {
					$args .= ' ' . escapeshellarg($part);
				}
			}
		}
		$process_cmd = '"' . $cmd . '"' . ' ' . $args;
		$options = array(
			"suppress_errors" => false,
			"bypass_shell" => false
		);
		$descriptorspec = array(
		   0 => array("pipe", "r"), // stdin is a pipe that the child will read from
		   1 => array("pipe", "w"), // stdout is a pipe that the child will write to
		   2 => array("pipe", "w")  // stderr is a file to write to
		);
		$process = proc_open($process_cmd, $descriptorspec, $pipes, $cwd, $env, $options);
		if (is_resource($process)) {
			$out = stream_get_contents($pipes[1]);
			fclose($pipes[1]);
			$return_value = proc_close($process);
			return trim($out);
		}
		return null;
	}

	error_reporting(E_ALL & ~E_NOTICE);
	date_default_timezone_set("Europe/Paris");
	define("NB_TAGS",5);

	if(in_array("gitcg", $argv)){
		define("GIT_GC",true);
		echo "GIT_GC: ON".PHP_EOL;
	} else {
		define("GIT_GC",false);
		echo "GIT_GC: OFF".PHP_EOL;
	}

	if(in_array("nofetch", $argv)){
		define("REPO_FETCH",false);
		echo "REPO_FETCH: OFF".PHP_EOL;
	} else {
		define("REPO_FETCH",true);
		echo "REPO_FETCH: ON".PHP_EOL;
	}

	$srcdir = str_replace("\\","/",$_ENV["PATH_SRC"])."/";
	echo "> ".$srcdir.PHP_EOL;

	file_put_contents($argv[1],'"name";"url";"cur rem. branch";"status";"cur tag";"log tags"'.PHP_EOL,FILE_APPEND);
	echo "*************************".PHP_EOL;
	foreach(scandir($srcdir) as $ele){
		if(is_dir($repo = $srcdir.$ele) &&  $ele != "." && $ele != ".."){
			$artname = basename($repo);
			if(is_dir($repo."/.git")){
				$upstream = execnono("git config --get remote.origin.url",NULL,$repo,NULL);
				$current_tag = execnono("git describe --tags",NULL,$repo,NULL);
				$gitclean = execnono("git clean -fdx",NULL,$repo,NULL);
				if(REPO_FETCH){
					$gitfecthtag = execnono("git fetch",NULL,$repo,NULL);
					$gitfecthtag .= execnono("git fetch --tag",NULL,$repo,NULL);
				}
				$excurbr = preg_match("/ -\> (.*)\n/",execnono("git branch -a",NULL,$repo,NULL),$matches);
				$remotecur = $matches[1];

				/* $gitstatus = execnono("git status",NULL,$repo,NULL);
				$statusarray = "";
				$cr = "";
				$sep = "";
				foreach(explode("\n",$gitstatus) as $status){
					if(strlen($status) != 0 && !is_int(strpos($status,"On branch")) && !is_int(strpos($status,"HEAD detached at")) && !is_int(strpos($status,"Your branch is up to date with"))){
						$statusarray .= $cr.$status;
						$cr = PHP_EOL;
						echo $sep.$status.PHP_EOL;
						$sep = "    ";
					}
				}
				*/
				
				$gitstatus = explode("\t",execnono("git rev-list --left-right --count ".$remotecur."...HEAD",NULL,$repo,NULL)) [0];
				if($gitstatus && $gitstatus != "0"){
					$gitstatus = $gitstatus." commit(s) behind '".$remotecur."'";
					$gitstatus2 = PHP_EOL."details: git diff HEAD..".$remotecur;
				} else {
					$gitstatus2 = "";
					$gitstatus = "up to date with '".$remotecur."'";
				}
				$gitlasttags2 = execnono('git log --tags --simplify-by-decoration --pretty="format:%ai %d" | head -n '.NB_TAGS,NULL,$repo,NULL);
				if(GIT_GC){
					echo execnono("git reflog expire --all --expire=now",NULL,$repo,NULL);
					echo execnono("git gc --prune=now --aggressive",NULL,$repo,NULL);
				}

			} elseif(is_dir($repo."/.svn")){
				if(REPO_FETCH){
					$gitfecthtag = execnono("svn update",NULL,$repo,NULL);
				}
				$svninfo = execnono("svn info",NULL,$repo,NULL);
				preg_match("/Repository Root:(.*)\n/",$svninfo,$matches);
				$upstream = $matches[1];
				preg_match("/Relative URL: \^\/(.*)\n/",$svninfo,$matches);
				$remotecur = $matches[1];
				preg_match("/Revision: (.*)\n/",$svninfo,$matches);
				$current_tag = trim($matches[1]);
				
				$svninfo = execnono("svn log -l ".NB_TAGS,NULL,$repo,NULL);
				$gitlasttags = "";
				foreach(explode("\n",$svninfo) as $line){
					preg_match("/r([0-9]+) .* ([0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2} [+-][0-9]{2}00)/",$line,$matches);
					if($matches[1] && $matches[2]){
						$head = "";
						if($gitlasttags == "")
							$gitlasttags = $matches[1];
						if($current_tag == $matches[1])
							$head = "HEAD, ";
						$gitlasttags2 .= $matches[2]." (".$head.$matches[1].")".PHP_EOL;
					}
				}
				if($gitlasttags != $current_tag){
					$gitstatus = "local: r".$current_tag." '".$remotecur."': r".$gitlasttags;
				} else {
					$gitstatus = "up to date with '".$remotecur."'";
				}
			}
			echo $artname." [".$upstream."]".PHP_EOL;
			echo "  Current tag: ".$current_tag.PHP_EOL;
			echo "  Status     : ".explode("\n",$gitstatus)[0].PHP_EOL;

			echo "*************************".PHP_EOL;
			file_put_contents($argv[1],'"'.$artname.'";"'.$upstream.'";"'.$remotecur.'";"'.$gitstatus.$gitstatus2.'";"'.$current_tag.'";"'.$gitlasttags2.'"'.PHP_EOL,FILE_APPEND);
			$artname = "";
			$upstream = "";
			$remotecur = "";
			$gitstatus = "";
			$current_tag = "";
			$gitlasttags2 = "";
		}
	}
?>