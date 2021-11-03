<?php
	include( dirname(__FILE__) . '/_functions.php');

	function checkWord($search,$data){
		foreach($search as $word => $wdata){
			if($wdata[1] == "reg"){
				preg_match("/".$word."/i",$data,$matches);
				if($matches[1])
					return preg_replace("/(".$matches[1].")/i","\033[".$wdata[0]."m\\1\033[39m",$data);
			} else if($wdata[1] == "str" && is_int(stripos($data,$word))) {
				return preg_replace("/(".$word.")/i","\033[".$wdata[0]."m\\1\033[39m",$data);
			}
		}
		return false;
	}

	function checkLog($file,$search,$remove,$afffile = true){
		foreach(file($file) as $linenum => $data){
			$aff = "";
			if(is_int(strpos($data,"####### BEGIN")))
				$curmod = $data;
			if(!checkWord($remove,$data))
				$aff = checkWord($search,$data);
			if($aff){
				if ($afffile)
					echo str_pad(basename($file), 42);
				if($curmod){
					echo "\t\t".$curmod;
					$curmod = "";
				}
				echo str_pad($linenum+1,5).": ".trim($aff).PHP_EOL;
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
		"(Warning[: ])" => [33,"reg"],
		"^(sed:)" => [33,"reg"],
		" fatal " => [31,"str"],
		" error " => [31,"str"],
		"stop" => [31,"str"],
		"syntaxe " => [33,"str"],
		"inattendu" => [33,"str"],
		"impossible" => [33,"str"],
		"incorrecte" => [33,"str"],
		"non valide" => [36,"str"],
		"introuvable" => [36,"str"],
		"rejected" => [33,"str"],
		"conflicts " => [33,"str"],
		"improve linker performance" => [33,"str"],

	);
	$remove = array(
		"CMake Warning at CMake" => [39, "str"],
		// gradle
		"Daemon will be stopped at the end of the build" => [39, "str"],
		// dav1d
		"fvisibility=hidden" => [39, "str"],
		// php-src
		"Using unknown MSVC version" => [39, "str"],
	);
	//print_r($argv);
	//exit();
	$dir = $argv[1];
	if($argv[3] == "full"){
		foreach (scandir($dir) as $file) 
			if ($file != '.' && $file != '..' && is_file($dir."/".$file)) 
				checkLog($dir."/".$file,$search,$remove,true);
	} elseif ($argv[3] == "last"){
		$file = getLastModifiedFile($dir);
		echo "> ".basename($file).PHP_EOL;
		checkLog($file,$search,$remove,false);
	} elseif (is_file($dir."/".$argv[3])){
		echo "> ".$argv[3].PHP_EOL;
		checkLog($dir."/".$argv[3],$search,$remove,false);
	} else {
		echo file_get_contents(dirname(__FILE__) . '/../../usage.txt');
	}
?>