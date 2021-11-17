<?php
	include( dirname(__FILE__) . '/_functions.php');

	define("SCRIPT_DIR",dirname(__FILE__));
	define("DEBUG",false);

	function sigcheck($dir,$file=""){
		global $data;
		$sigcmd = pathenv("BIN_SYGCHECK")." -a -c -e -r -nobanner ".$dir."/".$file;
		debug($sigcmd);
		$sig = execnono($sigcmd,NULL,$dir."/",NULL);
		debug($sig);
		$sig = explode("\n",$sig);
		array_shift($sig);
		foreach($sig as $v){
			$res = explode('","',$v);
			$ddate = explode(" ",$res[2]);
			$ddate = $ddate[1]." ".$ddate[0];
			$ressig[basename($res[0])] = array(
				"date" => $ddate,
				"publisher" => $res[3],
				"company" => $res[4],
				"description" => $res[5],
				"product" => $res[6],
				"productversion" => explode(" ",$res[7])[0],
				"fileversion" => explode(" ",$res[8])[0],
				"machinetype" => str_replace("-bit","",$res[9]),
				"binaryversion" => $res[10],
				"originalname" => $res[11],
				"internalname" => $res[12],
				"copyright" => $res[13],
				"comments" => $res[14],
			);
		};
		return $ressig;
	}

	function check($dirbase,$dir,$recurse=false){
		if(is_dir($dir)){
			$ressig = sigcheck($dir);
			foreach(scandir($dir) as $file){
				if(is_dir($dir."/".$file) && $file != "." && $file != ".." && $recurse){
					check($dirbase, $dir."/".$file,$recurse);
				} elseif (is_file($dir."/".$file)) {
					fileCheck($file,$dirbase,$dir,$recurse,$ressig);
				}
			}
		} elseif (is_file($dir)) {
			$file = basename($dir);
			$dir = str_replace("/".$file,"",$dir);
			fileCheck($file,$dir,$dir,$recurse,sigcheck($dir,$file));
		}
	}

	function fileCheck($file,$dirbase,$dir,$recurse,$ressig){
		global $col;
		global $data;
		global $cur;
		global $ext;
		if(is_file($dir."/".$file) && in_array(pathinfo($dir."/".$file)["extension"],$ext)) {
			debug($dir."/".$file);
			if($recurse) {
				$data[$cur][00] = str_replace($dirbase,"",$dir)."/".$file;
				} else {
				$data[$cur][00] = $file;
			}

			$copyright = $_ENV["RC_COPYRIGHT"];
			$title = $_ENV["ARCH"]." ".$_ENV["AVXECHO"]." MSVC ".$_ENV["vcvars_ver"];
			$data[$cur][50] =	$ressig[$file]["binaryversion"];
			$data[$cur][60] =	$ressig[$file]["productversion"];
			$data[$cur][5] =	$ressig[$file]["date"];
			$data[$cur][88] =	$ressig[$file]["product"];
			$data[$cur][110] =	$ressig[$file]["company"];
			$data[$cur][120] =	strlen($ressig[$file]["description"]) > 140 ? substr($ressig[$file]["description"],0,140)."..." : $ressig[$file]["description"];
			$data[$cur][65] =	$ressig[$file]["fileversion"];
			$data[$cur][10] =	$ressig[$file]["machinetype"];
			$data[$cur][150] =	$ressig[$file]["originalname"];
			$data[$cur][160] =	$ressig[$file]["internalname"];
			$data[$cur][170] =	$ressig[$file]["copyright"];
			$data[$cur][180] =	$ressig[$file]["comments"];
			if($data[$cur][88] == "n/a")
				$data[$cur][88] = "\033[33m".$data[$cur][88]."\033[39m";
			if($data[$cur][170] == $copyright){
				$data[$cur][85] = "OK";
			} else {
				$data[$cur][85] = "\033[31mKO\033[39m";
			}
			$nbavx = 0;
			$data[$cur][30] = "";
			if(CHECK_AVX){
				$obdcmd = pathenv("PATH_BIN_CYGWIN").'/sh.exe -c "objdump -M intel -d '.$dir."/".$file.' | ./opcode.sh -s AVX';
				debug($obdcmd);
				$obd  = execnono($obdcmd,NULL,SCRIPT_DIR,NULL);
				debug($obd);
				foreach(explode("\n",$obd) as $line){
					if(!is_int(strpos($line,"--")) && $line){
						$data[$cur][30] .= substr($line,28).PHP_EOL;
						$nbavx++;
					}
				}
				if($nbavx > 0)
				$data[$cur][30]="avx (".$nbavx.")";
			}

			$pdbfile = replace_extension($file,"pdb");
			$data[$cur][70] = "\033[33mn/a\033[39m";
			$data[$cur][80] = "\033[33mn/a\033[39m";
			if(is_file($dir."/".$pdbfile)){
				debug($dir."/".$pdbfile);
				$chkmcmd = pathenv("BIN_CHKMATCH").' -c '.$dir."/".$file.' '.$dir."/".$pdbfile;
				debug($chkmcmd);
				$chkm = execnono($chkmcmd,NULL,SCRIPT_DIR,NULL);
				debug($chkm);
				preg_match("/Result: (.*)/",$chkm,$matches);
				$data[$cur][70] = $pdbfile;
				$pdbres = str_replace(")","",str_replace("Unmatched (reason: ","",$matches[1]));
				$data[$cur][80] = $pdbres;
				if($data[$cur][80] != "Matched"){
					$data[$cur][80] = "\033[31m".$data[$cur][80]."\033[39m";
				} else {
					$data[$cur][80] = "OK";
				}
			}

			$dbhcmd = "dumpbin /headers ".$dir."/".$file;
			debug($dbhcmd);
			$dbh = execnono($dbhcmd,NULL,$dir."/",NULL);
			debug($dbh);

			preg_match("/ ([^ ]+) linker version/",$dbh,$matches);
			$data[$cur][40] = $matches[1];

			$data[$cur][20] = "";
			if(is_int(strpos($dbh,"(LTCG)")))
				$data[$cur][20] = "ltcg";

			// preg_match("/ ([^ ]+)\.pdb/",$dbh,$matches);
			// $pdbdumpbin = $matches[1].".pdb";
			// $data[$cur][10] = "!Na";
			// if(is_int(strpos($dbh,"machine (x86)")))
			// 	$data[$cur][10]="x86";
			// if(is_int(strpos($dbh,"machine (x64)")))
			// 	$data[$cur][10]="x64";

			ksort($data[$cur],SORT_NUMERIC);
			foreach($data[$cur] as $k => $v)
				if($col[$k]["pad"] != -1) {
					if(is_int(strpos($v,"\033"))) {
						echo str_pad($v,$col[$k]["pad"]+10," ");
					} else {
						echo str_pad($v,$col[$k]["pad"]," ");
					}
				}
			echo PHP_EOL;
			$cur++;
		}
	}

	foreach($argv as $arg){
		if($arg == "checkavx")
			$checkavx = true;
		if($arg == "recurse")
			$recurse = true;
		$matches = null;
		preg_match("/ext:(.*)/",$arg,$matches);
		if($matches[1])
			$extarg = $matches[1];
		$matches = null;
		preg_match("/nb:(.*)/",$arg,$matches);
		if($matches[1])
			$nbfile = $matches[1];
	}
	global $ext;
	if($extarg){
		$ext = explode(",",$extarg);
	} else {
		$ext = ["exe","dll","so"];
	}
	echo "************************************".PHP_EOL;
	echo "ext:      ".str_replace('"','',json_encode($ext)).PHP_EOL;
	if($checkavx){
		define("CHECK_AVX",true);
		echo "checkavx: ON".PHP_EOL;
	} else {
		define("CHECK_AVX",false);
		echo "checkavx: OFF".PHP_EOL;
	}
	if($recurse){
		define("RECURSE",true);
		echo "recurse:  ON".PHP_EOL;
	} else {
		define("RECURSE",false);
		echo "recurse:  OFF".PHP_EOL;
	}

	global $col;
	$col = array (
		0 => array("name" =>	"filename",		"pad" => 28),
		5 => array("name" =>	"date",			"pad" => 18),
		10 => array("name" =>	"x",			"pad" => 4),
		20 => array("name" =>	"link",			"pad" => 6),
		30 => array("name" =>	"set",			"pad" => 14),
		40 => array("name" =>	"cl",			"pad" => 7),
			50 => array("name" =>	"bver",			"pad" => -1),
		60 => array("name" =>	"pver",			"pad" => 10),
			65 => array("name" =>	"fver",			"pad" => -1),
			70 => array("name" =>	"pdb",			"pad" => -1),
		80 => array("name" =>	"pdb",	"pad" => 4),
		85 => array("name" =>	"©   ",	"pad" => 4),
		88 => array("name" =>	"product",		"pad" => 38),
			110 => array("name" =>	"company",		"pad" => -1),
		120 => array("name" =>	"description",	"pad" => 130),
			150 => array("name" =>	"originalname",	"pad" => -1),
			160 => array("name" =>	"internalname",	"pad" => -1),
			170 => array("name" =>	"copyright",	"pad" => -1),
		
			180 => array("name" =>	"comments",		"pad" => -1),
		
	);
	if(!CHECK_AVX) 
		$col[30]["pad"] = -1;
	if(RECURSE)
		$col[0]["pad"] = 35;

	global $data;
	$data = array();

	global $cur;
	$cur = 0;

	$argv[1] = str_replace("\\","/",$argv[1]);
	$affile = " ";
	if($nbfile && is_dir($argv[1])){
		if(($scanfile = sizeof(scandir($argv[1]))-2) == $nbfile) {
			$affile = ": \033[32m".$scanfile." (".$nbfile.")\033[39m ";
		} else {
			$affile = ": \033[31m".$scanfile." (".$nbfile.")\033[39m ";
		}
	}
	echo ">>>>>> ".$argv[1].$affile."<<<<<<".PHP_EOL;

	$data[$cur] = $argv[1];
	$cur++;
	foreach($col as $k => $v){
		$data[$cur][$k] = $v["name"];
		if($v["pad"] != -1) echo str_pad($v["name"],$v["pad"]," ");
	}
	echo PHP_EOL;
	$cur++;
	check($argv[1],$argv[1],RECURSE);
	$csv = "";
	foreach($data as $v){
		if(is_array($v)){
			$csv .= implode(";",$v).PHP_EOL;
		} else {
			$csv .= $v.PHP_EOL;
		}
	}
	if($argv[2] != "null")
		file_put_contents($argv[2],preg_replace("/\\033\[3[0-9]m/","",$csv), FILE_APPEND);
?>