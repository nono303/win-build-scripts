<?php
	include_once("D:/http/include_php/nono/common.php");
	define("CURRENT_DIR","C:/sdk/release/vs16_x64-avx/bin");

	function replace_extension($filename, $new_extension) {
    return preg_replace('/\..+$/', '.' . $new_extension, $filename);
}

	define("SCRIPT_DIR",dirname(__FILE__));
	function check($dir){
		foreach(scandir($dir) as $file){
			if(is_dir($dir."/".$file) && $file != "." && $file != ".."){
				// TMP pas tous les niveaux -- check($dir."/".$file);
			} elseif(is_file($dir."/".$file) && (is_int(strpos($file,".exe")) || is_int(strpos($file,".dll")) || is_int(strpos($file,".so")))){
				echo sprintf("%-24s",$file).sprintf("%-20s",str_replace(CURRENT_DIR,"",$dir)."/");
				$dumpbinheaders = Common::execnono("dumpbin /headers ".$dir."/".$folder."/".$file,NULL,$dir."/".$folder,NULL);
				$opcmd = 'C:/sdk/softs/cyg64/bin/sh.exe -c "objdump -M intel -d '.$dir."/".$folder.$file.' | ./opcode.sh -s AVX';
				$testinstruction  = Common::execnono($opcmd,NULL,SCRIPT_DIR,NULL);
				$pdbcmd = 'C:/sdk/softs/ChkMatch.exe -c '.$dir."/".$folder.$file.' '.$dir."/".$folder.replace_extension($file,"pdb");
				$testpdb = Common::execnono($pdbcmd,NULL,SCRIPT_DIR,NULL);
				preg_match("/Result: (.*)/",$testpdb,$matches);
				$pdmmatch = $matches[1];
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
				echo $arc.$ltcg." ".$msver.str_pad($avx,12," ").str_pad(replace_extension($file,"pdb"),22," ").$pdmmatch." (".$pdbdumpbin.")".PHP_EOL;
				/*
				if($nbavx > 0 && !is_int(strpos($folder,"avx")))
					echo $avxinst;
				*/
			}		
		}
	}
	echo "> ".CURRENT_DIR.PHP_EOL;
	check(CURRENT_DIR);
?>