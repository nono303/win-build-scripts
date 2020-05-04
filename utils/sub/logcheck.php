<?php
	error_reporting(E_ERROR | E_WARNING | E_PARSE);

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

	function checkLog($file,$search,$afffile = true){
		foreach(file($file) as $linenum => $data){
			$aff = false;
			if(is_int(strpos($data,"####### BEGIN")))
				$curmod = $data;
			foreach($search as $word => $color){
				if(is_int(stripos($data,$word))){
					$data = preg_replace("/(".$word.")/i","\033[".$color."m\\1\033[39m",$data);
					$aff = true;
				}
			}
			if($aff){
				if ($afffile)
					echo str_pad(basename($file), 42);
				if($curmod){
					echo "\t\t".$curmod;
					$curmod = "";
				}
				echo str_pad($linenum+1,5).": ".trim($data).PHP_EOL;
			}
		}
	}
/*
https://docs.microsoft.com/en-us/windows/console/console-virtual-terminal-sequences

30 	Foreground Black 	Applies non-bold/bright black to foreground
31 	Foreground Red 	Applies non-bold/bright red to foreground
32 	Foreground Green 	Applies non-bold/bright green to foreground
33 	Foreground Yellow 	Applies non-bold/bright yellow to foreground
34 	Foreground Blue 	Applies non-bold/bright blue to foreground
35 	Foreground Magenta 	Applies non-bold/bright magenta to foreground
36 	Foreground Cyan 	Applies non-bold/bright cyan to foreground
37 	Foreground White 	Applies non-bold/bright white to foreground
38 	Foreground Extended 	Applies extended color value to the foreground (see details below)
39 	Foreground Default 	Applies only the foreground portion of the defaults (see 0)
*/
	$search = array(
		"warning " => 33,
		"warning:" => 33,
		"LTCG s" => 33,
		" fatal " => 31,
		" error " => 31,
		"syntaxe " => 33,
		"inattendu" => 33,
		"impossible" => 33,
		"non valide" => 36,
		"introuvable" => 36,
		"stop" => 31,
	);
	//print_r($argv);
	//exit();
	$dir = $argv[1];
	if($argv[3] == "full"){
		foreach (scandir($dir) as $file) 
			if ($file != '.' && $file != '..' && is_file($dir."/".$file)) 
				checkLog($dir."/".$file,$search,true);
	} elseif ($argv[3] == "last"){
		$file = getLastModifiedFile($dir);
		echo "> ".basename($file).PHP_EOL;
		checkLog($file,$search,false);
	} elseif (is_file($dir."/".$argv[3])){
		echo "> ".$file.PHP_EOL;
		checkLog($dir."/".$argv[3],$search,false);
	} else {
		echo "build logcheck [full|last|__xx__.log]".PHP_EOL;
	}
?>