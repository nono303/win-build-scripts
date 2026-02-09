<?php
	include( dirname(__FILE__) . '/_functions.php');

	define("SCRIPT_DIR",dirname(__FILE__));
	define("DEBUG",false);

	// "Path", "Verified", "Date", "Publisher", "Company", "Description", "Product", "Product Version", "File Version", "Machine Type", "Binary Version", "Original Name", "Internal Name", "Copyright", "Comments", "Entropy"
	function sigcheck($dir,$file=""){
		global $data;
		$sig = explode("\n",mb_convert_encoding(execnono($sigcmd = pathenv("BIN_SYGCHECK")." -a -ct -e -r -nobanner -accepteula ".$dir."/".$file,NULL,$dir."/",NULL), "UTF-8", "UTF-16LE"));
		debug("sigcheck() ".$sigcmd.": ".$sig);
		$ark = array_map('trim', explode("\t",array_shift($sig))); // cvs headers
		foreach($sig as $line) {
			$val = array_map('trim', explode("\t", $line));
			if($key = basename($val[0]))
				foreach($val as $i => $v)
					$ressig[$key][$ark[$i]] = $v;
		}
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
			fileCheck($file,$dir,$dir,$recurse,$ressig);
		}
	}

	function fileCheck($file,$dirbase,$dir,$recurse,$ressig){
		global $col;
		global $data;
		global $cur;
		global $ext;
		if(is_file($dir."/".$file) && in_array(pathinfo($dir."/".$file)["extension"],$ext)) {
			debug("fileCheck(1) ".$dir."/".$file);
			$data[$cur][00] = $recurse ?
				str_replace($dirbase,"",$dir)."/".$file :
				$file;
			$copyright = $_ENV["RC_COPYRIGHT"];
			$title = $_ENV["ARCH"]." ".$_ENV["AVXECHO"]." MSVC ".$_ENV["vcvars_ver"];
			$data[$cur][50] =	$ressig[$file]["Binary Version"];
			$data[$cur][60] =	$ressig[$file]["Product Version"];
			$data[$cur][5] =	$ressig[$file]["Date"];
			$data[$cur][88] =	$ressig[$file]["Product"];
			$data[$cur][110] =	$ressig[$file]["Company"];
			$data[$cur][120] =	strlen($ressig[$file]["Description"]) > 140 ?
				substr($ressig[$file]["Description"],0,140)."..." :
				$ressig[$file]["Description"];
			$data[$cur][65] =	$ressig[$file]["File Version"];
			$data[$cur][10] =	substr($ressig[$file]["Machine Type"],0,2);
			$data[$cur][150] =	$ressig[$file]["Original Name"];
			$data[$cur][160] =	$ressig[$file]["Internal Name"];
			$data[$cur][170] =	$ressig[$file]["Copyright"];
			$data[$cur][180] =	$ressig[$file]["Comments"];
			if($data[$cur][88] == "n/a")
				$data[$cur][88] = "\033[33m".$data[$cur][88]."\033[39m";
			$data[$cur][85] = $data[$cur][170] == $copyright ?
				"OK" :
				"\033[31mKO\033[39m";
			$nbavx = 0;
			$data[$cur][30] = "";
			if(CHECK_AVX){
				$obdcmd = pathenv("PATH_BIN_CYGWIN").'/sh.exe -c "objdump -M intel -d '.$dir."/".$file.' | ./opcode.sh -s AVX';
				if(DEBUG)
					echo "###".$obdcmd.PHP_EOL;
				$stderr = null;
				$obd  = execnono($obdcmd,NULL,SCRIPT_DIR,NULL,$stderr);
				if($stderr){
					// dumpbin fix issue with 'BFD: __FILE__: bad string table size X' but is really slow
					$obdcmd = pathenv("PATH_BIN_CYGWIN").'/sh.exe -c "dumpbin /disasm '.$dir."/".$file.' | ./opcode.sh -s AVX';
					if(DEBUG)
						echo "###".$obdcmd.PHP_EOL;
					$obd  = execnono($obdcmd,NULL,SCRIPT_DIR,NULL);
				}
				debug("fileCheck(2) ".$obdcmd.": ".$obd);
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
				$chkmcmd = pathenv("BIN_CHKMATCH").' -c '.$dir."/".$file.' '.$dir."/".$pdbfile;
				if(DEBUG)
					echo "###".$chkmcmd.PHP_EOL;
				$chkm = execnono($chkmcmd,NULL,SCRIPT_DIR,NULL);
				debug("fileCheck(3) ".$chkmcmd.": ".$chkm);
				preg_match("/Result: (.*)/",$chkm,$matches);
				$data[$cur][70] = $pdbfile;
				$data[$cur][80] = $matches[1] ?
					str_replace(")","",str_replace("Unmatched (reason: ","",$matches[1])) :
					"KO";
				$data[$cur][80] = $data[$cur][80] != "Matched" ?
					"\033[31m".$data[$cur][80]."\033[39m" :
					"OK";
			}

			$dbhcmd = "dumpbin /headers ".$dir."/".$file;
			if(DEBUG)
				echo "###".$dbhcmd.PHP_EOL;
			$dbh = execnono($dbhcmd,NULL,$dir."/",NULL);
			debug("fileCheck(4) ".$dbhcmd.": ".$dbh);

			preg_match("/ ([^ ]+) linker version/",$dbh,$matches);
			$data[$cur][40] = $matches[1];

			$data[$cur][20] = "";
			if(is_int(strpos($dbh,"(LTCG)")))
				$data[$cur][20] = "ltcg";

			ksort($data[$cur],SORT_NUMERIC);
			foreach($data[$cur] as $k => $v)
				if($col[$k]["pad"] != -1)
					echo str_pad($v,$col[$k]["pad"]+ (is_int(strpos($v ?: "","\033")) ? 10 : 0)," ");
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
	$ext = $extarg ? explode("-",$extarg) : ["exe","dll","so"];
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
		0 => array("name" =>	"filename",		"pad" => 42),
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
		88 => array("name" =>	"product",		"pad" => 40),
			110 => array("name" =>	"company",		"pad" => -1),
		120 => array("name" =>	"description",	"pad" => 0), // 0 = last
			150 => array("name" =>	"originalname",	"pad" => -1),
			160 => array("name" =>	"internalname",	"pad" => -1),
			170 => array("name" =>	"copyright",	"pad" => -1),

			180 => array("name" =>	"comments",		"pad" => -1),

	);
	if(!CHECK_AVX)
		$col[30]["pad"] = -1;

	global $data;
	$data = array();

	global $cur;
	$cur = 0;

	$argv[1] = str_replace("\\","/",$argv[1]);
	$affile = " ";
	if($nbfile && is_dir($argv[1]))
		$affile = ($scanfile = sizeof(scandir($argv[1]))-2) == $nbfile ?
			": \033[32m".$scanfile." (".$nbfile.")\033[39m " :
			": \033[31m".$scanfile." (".$nbfile.")\033[39m ";
	echo ">>>>>> ".$argv[1].$affile."<<<<<<".PHP_EOL;

	$data[$cur] = $argv[1];
	$cur++;
	foreach($col as $k => $v){
		$data[$cur][$k] = $v["name"];
		if($v["pad"] != -1)
			echo str_pad($v["name"],$v["pad"]," ");
	}
	echo PHP_EOL;
	$cur++;
	check($argv[1],$argv[1],RECURSE);
	$csv = "";
	foreach($data as $v)
		$csv .= is_array($v) ?
			implode(";",$v).PHP_EOL :
			$v.PHP_EOL;
	if($argv[2] != "null")
		file_put_contents($argv[2],preg_replace("/\\033\[3[0-9]m/","",$csv), FILE_APPEND);
?>