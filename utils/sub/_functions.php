<?php
	error_reporting(E_ALL & ~E_NOTICE);

	function replace_extension($filename, $new_extension) {
		return preg_replace('/\.[^\.]+$/', '.' . $new_extension, $filename);
	}

	function pathenv($env){
		return str_replace("\\","/",$_ENV[$env]);
	}

	function debug($msg){
		if(DEBUG) echo "#dbg: ".$msg.PHP_EOL;
	}

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