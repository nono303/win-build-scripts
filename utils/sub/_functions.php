<?php
	error_reporting(E_ALL & ~E_NOTICE & ~E_WARNING);

	// json options for cached version file
	const JSON_ENCODE_OPTIONS = JSON_PRETTY_PRINT | JSON_THROW_ON_ERROR | JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE;

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

	function execnono($cmd,$parts,$cwd,$env,&$stderr = null){
		$args = '';
		if($parts) {
			foreach ($parts as $k => $part)
				is_string($k) ?  $args .= ' ' . escapeshellarg($k) . ' ' . escapeshellarg($part) : $args .= ' ' . escapeshellarg($part);
			$process_cmd = '"' . $cmd . '" ' . $args;
		} else {
			$process_cmd = $cmd;
		}
		$options = [
			"suppress_errors" => false,
			"bypass_shell" => false,
			"blocking_pipes" => false,
			"create_process_group" => false,
			"create_new_console" => false
		];
		$descriptorspec = [
			0 => ["pipe", "r"],  // stdin is a pipe that the child will read from
			1 => ["pipe", "w"],  // stdout is a pipe that the child will write to
			2 => ["pipe", "w"]   // stderr is a file to write to
		];
		$process = proc_open($process_cmd, $descriptorspec, $pipes, $cwd, $env, $options);
		stream_set_blocking($pipes[1], false);
		if (is_resource($process)) {
			if($stdin){
				fwrite($pipes[0], $stdin);
				fclose($pipes[0]);
			}
			$out = stream_get_contents($pipes[1]);
			fclose($pipes[1]);
			$stderr = trim(stream_get_contents($pipes[2]));
			fclose($pipes[2]);
			// It is important that you close any pipes before calling
			// proc_close in order to avoid a deadlock
			$return_value = proc_close($process);
			// echo "command returned $return_value\n";
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

	function getGitBranchAtCommit($commit, $repo){
		preg_match("/HEAD ->(.*)\n/m",$res = execnono($cmd = "git branch -a --contains ".$commit." | grep -v detached", NULL, $repo, NULL), $matches);
		if($matches[1]) {
			$branch = $matches[1];
		} else {
			preg_match("/^\* (.*)/m",$res,$matches);
			if($matches[1]) {
				$branch = trim($matches[1]);
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
		return $branch;
	}
?>