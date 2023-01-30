<?php
	error_reporting(E_ALL & ~E_NOTICE & ~E_WARNING);

	function replace_extension($filename, $new_extension) {
		return preg_replace('/\.[^\.]+$/', '.' . $new_extension, $filename);
	}

	function pathenv($env){
		if(array_key_exists($env,$_ENV))
			return str_replace("\\","/",$_ENV[$env]);
		return null;
	}

	function debug($msg){
		if(DEBUG) echo "#dbg: ".$msg.PHP_EOL;
	}

	function execnono($cmd,$parts,$cwd,$env){
		return trim(shell_exec("cd /D ".$cwd." && ".$cmd));
	}

	function getLastModifiedFile($dir){
		foreach (scandir($dir) as $file) {
			if ($file == '.' || $file == '..' || is_dir($dir.'/'.$file)) 
				continue;
			if (is_file($dir.'/'.$file) && is_int(strpos($file,".log"))) {
				if (filemtime($dir.'/'.$file) > $mdate) {
					$newest_file = $dir.'/'.$file;
					$mdate = filemtime($dir.'/'.$file);
				}
			}
		}
		return $newest_file;
	}

	function secondsToNbDay($seconds) {
		$dtF = new \DateTime('@0');
		$dtT = new \DateTime("@$seconds");
		// return $dtF->diff($dtT)->format('%a days, %h hours, %i minutes and %s seconds');
		return $dtF->diff($dtT)->format('%a');
	}
?>