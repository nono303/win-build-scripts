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

	function replace_extension($filename, $new_extension) {
		return preg_replace('/\..+$/', '.' . $new_extension, $filename);
	}

	function check($dirbase,$dir){
		foreach(scandir($dir) as $file){
			if(is_dir($dir."/".$file) && $file != "." && $file != ".."){
				// TMP pas tous les niveaux -- check($dirbase, $dir."/".$file);
			} elseif(is_file($dir."/".$file) && (is_int(strpos($file,".exe")) || is_int(strpos($file,".dll")) || is_int(strpos($file,".so")))){
				$dumpbinheaders = execnono("dumpbin /headers ".$dir."/"."/".$file,NULL,$dir."/",NULL);
				$opcmd = 'C:/sdk/softs/cyg64/bin/sh.exe -c "objdump -M intel -d '.$dir."/".$file.' | ./opcode.sh -s AVX';
				$testinstruction  = execnono($opcmd,NULL,SCRIPT_DIR,NULL);
				$pdbfile = replace_extension($file,"pdb");
				echo $dir."/".$pdbfile.PHP_EOL;
				if(is_file($dir."/".$pdbfile)){
					$pdbcmd = 'C:/sdk/softs/ChkMatch.exe -c '.$dir."/".$file.' '.$dir."/".$pdbfile;
					$testpdb = execnono($pdbcmd,NULL,SCRIPT_DIR,NULL);
					echo $testpdb;

					$pdbcmd = 'dumpbin /PDBPATH:verbose '.$dir."/".$file;
					$testpdb = execnono($pdbcmd,NULL,SCRIPT_DIR,NULL);
					echo $testpdb;

					$pdbcmd = 'C:/sdk/softs/ChkMatch.exe -c '.$dir."/".$file.' '.$dir."/".$pdbfile;
					$testpdb = execnono($pdbcmd,NULL,SCRIPT_DIR,NULL);
					echo $testpdb;

					exit();

					preg_match("/Result: (.*)/",$testpdb,$matches);
					$pdmmatch = $matches[1];
				}
				$nbavx = 0;
				$avxinst = "";
				foreach(explode("\n",$testinstruction) as $line){
					if(!is_int(strpos($line,"--")) && $line){
						$avxinst .= substr($line,28).PHP_EOL;
						$nbavx++;
					}
				}
				preg_match("/ ([^ ]+) linker version/",$dumpbinheaders,$matches);
				$msver = $matches[1];
				preg_match("/ ([^ ]+)\.pdb/",$dumpbinheaders,$matches);
				$pdbdumpbin = $matches[1].".pdb";
				$avx = "    ";
				if($nbavx > 0)
					$avx=" avx (".$nbavx.")";
				$arc = "!Na";
				if(is_int(strpos($dumpbinheaders,"machine (x86)")))
					$arc="x86";
				if(is_int(strpos($dumpbinheaders,"machine (x64)")))
					$arc="x64";
				$ltcg = "     ";
				if(is_int(strpos($dumpbinheaders,"(LTCG)")))
					$ltcg = " ltcg";
				echo sprintf("%-25s",$file)./* .sprintf("%-20s",str_replace($dirbase,"",$dir)."/") */$arc.$ltcg." ".$msver.str_pad($avx,12," ").str_pad($pdbfile,26," ").$pdmmatch." (".$pdbdumpbin.")".PHP_EOL;
				/*
				if($nbavx > 0 && !is_int(strpos($folder,"avx")))
					echo $avxinst;
				*/
			}		
		}
	}

	define("SCRIPT_DIR",dirname(__FILE__));
	echo "> ".$argv[1].PHP_EOL;
	check($argv[1],$argv[1]);
?>