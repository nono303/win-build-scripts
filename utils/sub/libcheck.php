<?php
	include( dirname(__FILE__) . '/_functions.php');
	DEFINE("PAD",35);
	$afftype = ["pdb" => "STATIC","dll" => "SHARED"];

	if(is_dir($argv[1] = str_replace("\\","/",$argv[1]))){
		echo ">>>>>> ".$argv[1]." <<<<<<".PHP_EOL;
		$liblist = array_map('basename', glob($argv[1].'/*.lib', GLOB_BRACE));
		foreach(["pdb" => "/","dll" => "/../bin/"] as $k => $v){
			if(sizeof($entries = array_filter(explode("\n",trim(execnono("grep --binary-files=text --include=\*.lib -oRine '[0-9a-zA-Z_-]*\.".$k."'",NULL,$argv[1],NULL))))) == 0)
				continue;
			echo "\t****** ".$afftype[$k]." ******".PHP_EOL;
			$pdbordlllist[$k] = array_map('basename', glob($argv[1].$v.'*.'.$k, GLOB_BRACE));
			foreach($entries as $entry){
				$ret = explode(":",$entry);
				if(!is_array($final[$k][$libname = end(explode("/",$ret[0]))]))
					$final[$k][$libname] = [];
				if(!in_array($value = str_replace("-Fd","",$ret[2]),$final[$k][$libname = end(explode("/",$ret[0]))])) 
					array_push($final[$k][$libname],$value);
			}
			if(is_array($final[$k])){
				foreach($final[$k] as $lib => $tabresultat){
					if(!is_array($final["pdb"]) || !($k == "dll" && array_key_exists($lib,$final["pdb"]))){
						echo str_pad($lib,PAD);
						$liblist = array_diff($liblist,[$lib]);
						
						$echres = "";
						foreach($tabresultat as $pdbordll){
							if(in_array($pdbordll,$pdbordlllist[$k])){
								if(explode(".",$pdbordll)[0] == explode(".",$lib)[0] || $k == "dll"){
									$echres .= str_pad("\033[92m".$pdbordll."\033[39m",PAD);
								} else {
									$echres .= str_pad("\033[95m".$pdbordll."\033[39m",PAD);
								}
								$pdbordlllist[$k] = array_diff($pdbordlllist[$k],[$pdbordll]);
							} elseif($pdbordll == "vc140.pdb"){
								$echres .= str_pad("\033[33m".$pdbordll."\033[39m",PAD);
							} else {
								$echres .= str_pad("\033[31m".$pdbordll."\033[39m",PAD);
							}
						}
						echo $echres.PHP_EOL;
					}
				}
			}
			if(sizeof($pdbordlllist[$k]) > 0){
				echo "\033[96m# ".strtoupper($k)." WITH NO LIB\033[39m".PHP_EOL;
				foreach($pdbordlllist[$k] as $unused)
					echo "\t\033[96m".$unused."\033[39m".PHP_EOL;
			}
		}
		if(sizeof($liblist) > 0){
			echo "\033[93m# LIB WITH NO DLL & PDB\033[39m".PHP_EOL;
			foreach($liblist as $unused)
				echo "\t\033[93m".$unused."\033[39m".PHP_EOL;
		}
	}
?>