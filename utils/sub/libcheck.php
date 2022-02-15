<?php
	include( dirname(__FILE__) . '/_functions.php');

	if(is_dir($argv[1] = str_replace("\\","/",$argv[1]))){
		echo ">>>>>> ".$argv[1]." <<<<<<".PHP_EOL;
		$pdbpresent = array_map('basename', glob($argv[1].'/*.pdb', GLOB_BRACE));
		foreach(explode("\n",trim(execnono("grep --binary-files=text --include=\*.lib -oRine '[0-9a-zA-Z_-]*\.pdb'",NULL,$argv[1],NULL))) as $entry){
			if($entry){
				$ret = explode(":",$entry);
				if(!is_array($final[$liste = end(explode("/",$ret[0]))]))
					$final[$liste] = [];
				if(!in_array($value = str_replace("-Fd","",$ret[2]),$final[$liste = end(explode("/",$ret[0]))])) 
					array_push($final[$liste],$value);
			}
		}
		if(is_array($final)){
			foreach($final as $lib => $tabpdb){
				echo "# ".$lib.PHP_EOL;
				foreach($tabpdb as $pdb){
					echo "\t";
					if(in_array($pdb,$pdbpresent)){
						if(explode(".",$pdb)[0] == explode(".",$lib)[0]){
							echo "\033[32m".$pdb."\033[39m";
						} else {
							echo "\033[35m".$pdb."\033[39m";
						}
						$pdbpresent = array_diff($pdbpresent,[$pdb]);
					} elseif($pdb == "vc140.pdb"){
						echo "\033[33m".$pdb."\033[39m";
					} else {
						echo "\033[31m".$pdb."\033[39m";
					}
					echo PHP_EOL;
				}
			}
		}
		if(sizeof($pdbpresent) > 0){
			echo "# UNUSED".PHP_EOL;
			foreach($pdbpresent as $unused)
				echo "\t\033[36m".$unused."\033[39m".PHP_EOL;
		}
	}
?>