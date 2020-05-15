<?php
	include( dirname(__FILE__) . '/_functions.php');

	global $letterpos;
	global $nogit;

	$pos = 1;
	foreach (range('a', 'z') as $letter)
		$letterpos[$letter] = $pos++;
	$nogit = array(
		"lua"				=> ["/version = \"([^\"]+)\"/",	pathenv("PATH_SRC")."/lua/dist.info"],
		"mobac"				=> ["/mobac.version=(.*)/",	pathenv("PATH_SRC")."/mobac/src/main/resources/mobac/mobac.properties"],
		"mod_fcgid"			=> ["/#define MODFCGID_VERSION_MAJOR *([0-9]+).*#define MODFCGID_VERSION_MINOR *([0-9]+).*#define MODFCGID_VERSION_SUBVER *([0-9]+).*#define MODFCGID_VERSION_DEV *([0-9]+)/s",	pathenv("PATH_SRC")."/mod_fcgid/modules/fcgid/fcgid_conf.h"],
		"mod_h264_streaming"=> ["/#define VERSION \"([^\"]+)\"/", pathenv("PATH_SRC")."/mod_h264_streaming/config.h"],
		"serf"				=> ["/#define SERF_MAJOR_VERSION *([0-9]+).*#define SERF_MINOR_VERSION *([0-9]+).*#define SERF_PATCH_VERSION *([0-9]+)/s",pathenv("PATH_SRC")."/serf/serf.h"],
		"wineditline"		=> ["/WinEditLine_VERSION_MAJOR *([0-9]+).*WinEditLine_VERSION_MINOR *([0-9]+)/s",pathenv("PATH_SRC")."/wineditline/CMakeLists.txt"],
	);

	function getVersion($cur,$src){
		global $letterpos;
		global $nogit;
		$ver_product = "";
			$ver_file = "";
			$tagok = true;
			// git source overrided
			if (is_array($nogit[$src])){
				preg_match($nogit[$src][0],file_get_contents($nogit[$src][1]),$matches);
				$sep = "";
				for($i = 1; $i < sizeof($matches); $i++){
					$ver_product .= $sep.trim($matches[$i]);
					$sep = ".";
				}
			} elseif (is_dir($cur."/".$src."/.git")){
				$ver_product = execnono("git describe --tags",NULL,$cur."/".$src,NULL);
				// remove name
				$ver_product = str_replace($src,"",$ver_product);
				// remove other prefix
				$ver_product = preg_replace("/^\D+([0-9])/","\\1",$ver_product);
				// remove git commit suffix
				$ver_product = preg_replace("/-.{8}$/","",$ver_product);
				// remove other suffix
				$ver_product = preg_replace("/-\D+$/","",$ver_product);
				// splitter as .
				$ver_product = preg_replace("/[-_]/",".",$ver_product);
				// pecl-memcache 5 'digit' version
				if(($sctex = sizeof($ctex = explode(".",$ver_product))) > 4){
					$ver_product = $ctex[0].".".$ctex[1].".".$ctex[2].".".$ctex[3];
					for($i = 4; $i < $sctex; $i++)
						$ver_product .= $ctex[$i];
				}
			} else {
				echo str_pad($src,20)."NO TAG OR VERSION!".PHP_EOL;
				$tagok = false;
			}
			
			if($tagok){
				$ver_file = $ver_product;
				// letter in version : openssl & jpeg
				preg_match("/([a-zA-Z])$/",$ver_file,$matches);
				if($matches[1]){
					$ver_file = preg_replace("/[a-zA-Z]$/",".".$letterpos[strtolower($matches[1])],$ver_file);
					// !! must add a - to be take in account for producton version (verpatch limitation ?)
					$ver_product = preg_replace("/([a-zA-Z])$/","-".strtolower($matches[1]),$ver_product);
				}
				return ["file" => $ver_file ,"product" => $ver_product];
				
			}
	}
	// print_r($argv);
	if(sizeof($argv) == 1){
		$md = "| src | version | ".PHP_EOL."| ---- | ---- |".PHP_EOL;
		foreach(scandir($cur = pathenv("PATH_SRC")) as $src) {
			if(is_dir($cur."/".$src) & $src != "." && $src != ".."){
				$current = getVersion($cur,$src);
				echo str_pad($src,20).str_pad($current["product"],12).str_pad($current["file"],12).PHP_EOL;
				$md .= "| ".$src." | ".$current["file"]." |".PHP_EOL;
			}
		}
		file_put_contents(dirname(__FILE__) . '/../../SRC_VERSION.md',$md);
	} elseif(sizeof($argv) >= 3){
		if(is_dir($cur = pathenv("PATH_SRC"))."/".$argv[1]){
			$current = getVersion($cur,$argv[1]);
			$rpdb = " /rpdb";
			if($argv[3] == "norpdb")
				$rpdb = "";
			$cmd = pathenv("BIN_VERPATCH")." ".$argv[2]." \"".$current["file"]."\" /va".$rpdb." /high /pv \"".$current["product"]."\" /s product \"".basename($argv[2],".".pathinfo($argv[2], PATHINFO_EXTENSION))."\"";
			echo $cmd.PHP_EOL;
			passthru($cmd);
		} else {
			echo "version.php '".$argv[1]."' '".$argv[2]."': '".pathenv("PATH_SRC")."/".$argv[1]."' doesn't exist";
			exit(-1);
		}
	} else {
		echo "Bad usage: 
no params: export current version of all src modules to a csv file in %PATH_LOG%
version.php [src_module] [file_to_patch] patch 'file_to_patch' with version of 'src_module'";
exit(-1);
	}
?>