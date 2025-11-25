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
	31 	Foreground Red 		Applies non-bold/bright red to foreground
	32 	Foreground Green 	Applies non-bold/bright green to foreground
	33 	Foreground Yellow 	Applies non-bold/bright yellow to foreground
	34 	Foreground Blue 	Applies non-bold/bright blue to foreground
	35 	Foreground Magenta 	Applies non-bold/bright magenta to foreground
	36 	Foreground Cyan 	Applies non-bold/bright cyan to foreground
	37 	Foreground White 	Applies non-bold/bright white to foreground
	38 	Foreground Extended Applies extended color value to the foreground (see details below)
	39 	Foreground Default 	Applies only the foreground portion of the defaults (see 0)
*/
	$search = array(
/* Red */
		" fatal " => [31,"str"],
		" error " => [31,"str"],
		"error:" => [31,"str"],
		"stop" => [31,"str"],
		"err open" => [31,"str"], // version
/* Yellow */
		"(Warning[: ])" => [33,"reg"],
		"warning" => [33,"reg"],
		"^(sed:)" => [33,"reg"],
		"error while editing pdb path" => [33,"str"], // version
		"Update file checksum failed, the file may be damaged" => [33,"str"], // version
		"syntaxe " => [33,"str"],
		"inattendu" => [33,"str"],
		"impossible" => [33,"str"],
		"incorrecte" => [33,"str"],
		"rejected" => [33,"str"],
		"conflicts " => [33,"str"],
		"improve linker performance" => [33,"str"],
		"Hunk #" => [33,"str"], // patch offset 
		"pas reconnu en tant que commande interne" => [33,"str"],
		"environment is too large" => [33,"str"],
		"Could NOT find" => [33,"str"],
/* Cyan */
		"ne peut trouver le fichier" => [36,"str"], //mpir
		"non valide" => [36,"str"],
		"introuvable" => [36,"str"],
		"unknow" => [36,"str"],
	);
	$remove = array(
		"javahl" => [39, "str"],					// subversion java-hl
		"unknown_element.c" => [39, "str"],			// php
		"Using unknown MSVC version" => [39, "str"],// php
		"showWarning" => [39, "str"],				// icu
		"Could NOT find JSONC" => [39, "str"],		// gdal	
		"Could NOT find OpenCAD" => [39, "str"],	// gdal
		"Could NOT find TIFF" => [39, "str"],		// libwebp first pass	
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