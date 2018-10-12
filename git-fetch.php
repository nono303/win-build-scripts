<?php
error_reporting(E_ALL & ~E_NOTICE);
date_default_timezone_set("Europe/Paris");

DEFINE("FETCH",true);
DEFINE("SRC_DIR","C:/src/");
$fout = "C:/httpd-sdk/silent-logs/git-fetch.".date("Y-m-d_H-i-s").".csv";

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
	// echo $process_cmd;
	$options = array(
				"suppress_errors" => false,
				"bypass_shell" => false
			);

	$descriptorspec = array(
	   0 => array("pipe", "r"),  // stdin is a pipe that the child will read from
	   1 => array("pipe", "w"),  // stdout is a pipe that the child will write to
	   2 => array("pipe", "w")  // stderr is a file to write to
	);
	$process = proc_open($process_cmd, $descriptorspec, $pipes, $cwd, $env, $options);
	if (is_resource($process)) {
		$out = stream_get_contents($pipes[1]);
		fclose($pipes[1]);
		// It is important that you close any pipes before calling
		// proc_close in order to avoid a deadlock
		$return_value = proc_close($process);
		// echo "command returned $return_value\n";
		return trim($out);
	}
	return null;
}

file_put_contents($fout,"name;url;branch;tag;status;new tag(s)".PHP_EOL,FILE_APPEND);
foreach($repos as $repo){
	$artname = basename($repo);
	$upstream = execnono("git config --get remote.origin.url",NULL,$repo,NULL);
	$current_tag = execnono("git describe --tags",NULL,$repo,NULL);
	$current_branch = str_replace("(","",execnono("git branch | grep \* | cut -d ' ' -f2",NULL,$repo,NULL));
	$gitclean = execnono("git clean -fdx",NULL,$repo,NULL);
	$gitstatus = execnono("git status",NULL,$repo,NULL);

	if(FETCH)
		$gitfecth = execnono("git fetch",NULL,$repo,NULL);
	if(FETCH)
		$gitfecthtag = execnono("git fetch --tag",NULL,$repo,NULL);
/*	$gitfecthtag = "   81d6c3e..4dbc141  master     -> origin/master
 * [new tag]         v1.11.2    -> v1.11.2
 * [new tag]         v1.11.3    -> v1.11.3";
*/
	echo $artname." [".$upstream."]".PHP_EOL;
	echo "  Branch: ".$current_branch.PHP_EOL;
	echo "  Tag   : ".$current_tag.PHP_EOL;
	echo "  Status: ".PHP_EOL;
	$statusarray = "";
	$cr = "";
	foreach(explode("\n",$gitstatus) as $status){
		if(strlen($status) != 0 && !is_int(strpos($status,"On branch")) && !is_int(strpos($status,"HEAD detached at")) && !is_int(strpos($status,"Your branch is up to date with"))){
			$statusarray .= $cr.$status;
			$cr = PHP_EOL;
			echo "    ".$status.PHP_EOL;
		}
	}
	if($gitfecthtag){
		echo "! New Tag(s): ".PHP_EOL;
		$newtagsarray = "";
		$cr = "";
		foreach(explode("\n",$gitfecthtag) as $tag){
			if(is_int(strpos($tag,"[new tag]"))){
				$newtagsarray .=  $cr.($nt = substr($tag, strrpos($tag, ' ') + 1));
				$cr = PHP_EOL;
				echo "    ".$nt.PHP_EOL;
			}
		}
	}
	echo "*************************".PHP_EOL;
	file_put_contents($fout,'"'.$artname.'";"'.$upstream.'";"'.$current_branch.'";"'.$current_tag.'";"'.str_replace('"','\'',$statusarray).'";"'.$newtagsarray.'"'.PHP_EOL,FILE_APPEND);
}
?>