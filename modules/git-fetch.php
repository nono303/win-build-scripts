<?php
error_reporting(E_ALL & ~E_NOTICE);
date_default_timezone_set("Europe/Paris");

DEFINE("FETCH",true);
define("GIT_GC",false);
DEFINE("SRC_DIR","C:/src/");
$fout = "C:/httpd-sdk/_logs/git-fetch.".date("Y-m-d_H-i-s").".csv";

$repos = array();
foreach(scandir(SRC_DIR) as $ele)
	if(is_dir(SRC_DIR.$ele) &&  $ele != "." && $ele != "..")
		array_push($repos, SRC_DIR.$ele);

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

file_put_contents($fout,'"name";"url";"branch";"tag";"last tags";"log tags";"status"'.PHP_EOL,FILE_APPEND);
echo "*************************".PHP_EOL;
foreach($repos as $repo){
	if(is_dir($repo."/.git")){
		$artname = basename($repo);
		$upstream = execnono("git config --get remote.origin.url",NULL,$repo,NULL);
		$current_tag = execnono("git describe --tags",NULL,$repo,NULL);
		$current_branch = str_replace("(","",execnono("git branch | grep \* | cut -d ' ' -f2",NULL,$repo,NULL));
		if($artname != "php72-sdk")
			$gitclean = execnono("git clean -fdx",NULL,$repo,NULL);
		if(FETCH)
			$gitfecthtag = execnono("git fetch",NULL,$repo,NULL);
		if(FETCH)
			$gitfecthtag .= execnono("git fetch --tag",NULL,$repo,NULL);
		$gitstatus = execnono("git status",NULL,$repo,NULL);
		$gitlasttags = execnono('git for-each-ref --sort=taggerdate --format %(tag)_,,,_%(taggerdate:raw) refs/tags | gawk \'BEGIN { FS = "_,,,_"  } ; { t=strftime("%Y-%m-%d",$2); printf "%s %s\n", t, $1  }\' | tail -n 10 | tac',NULL,$repo,NULL);
		$gitlasttags2 = execnono('git log --tags --simplify-by-decoration --pretty="format:%ai %d" | head -n 5',NULL,$repo,NULL);
		if(GIT_GC){
			echo execnono("git reflog expire --all --expire=now",NULL,$repo,NULL);
			echo execnono("git gc --prune=now --aggressive",NULL,$repo,NULL);
		}
		echo $artname." [".$upstream."]".PHP_EOL;
		echo "  Branch: ".$current_branch.PHP_EOL;
		echo "  Tag   : ".$current_tag.PHP_EOL;
		echo "  Status: ";

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

		echo "*************************".PHP_EOL;
		file_put_contents($fout,'"'.$artname.'";"'.$upstream.'";"'.$current_branch.'";"'.$current_tag.'";"'.$gitlasttags.'";"'.$gitlasttags2.'";"'.str_replace('"','\'',$statusarray).'"'.PHP_EOL,FILE_APPEND);
	}
}
?>