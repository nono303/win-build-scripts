<?php
	error_reporting(E_ERROR | E_WARNING | E_PARSE);
	define("SCRIPT_DIR",dirname(__FILE__));
	define("DEBUG",false);

	function replace_extension($filename, $new_extension) {
		return preg_replace('/\..+$/', '.' . $new_extension, $filename);
	}

	function binenv($env){
		return str_replace("\\","/",$_ENV[$env]);
	}

	function debug($msg){
		if(DEBUG) echo "#dbg: ".$msg.PHP_EOL;
	}

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
		$options = array(
					"suppress_errors" => false,
					"bypass_shell" => false
				);
		$descriptorspec = array(
		   0 => array("pipe", "r"),	// stdin is a pipe that the child will read from
		   1 => array("pipe", "w"),	// stdout is a pipe that the child will write to
		   2 => array("pipe", "w")	// stderr is a file to write to
		);
		$process = proc_open($process_cmd, $descriptorspec, $pipes, $cwd, $env, $options);
		if (is_resource($process)) {
			$out = stream_get_contents($pipes[1]);
			fclose($pipes[1]);
			$return_value = proc_close($process);
			return trim($out);
		}
		return null;
	}

	function sigcheck($dir,$file=""){
		global $data;
		$sigcmd = binenv("BIN_SYGCHECK")." -a -c -e -r -nobanner ".$dir."/".$file;
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

	function verpatch($dir,$file,$version,$copyright,$title){
		$vercmd = binenv("BIN_VERPATCH")." ".$dir."/".$file." ".$version." /rpdb /s copyright \"".$copyright."\" /s title \"".$title."\"";
		debug($vercmd);
		//echo $vercmd.PHP_EOL;
		$ver = execnono($vercmd,NULL,$dir."/",NULL);
		debug($ver);
		//echo $ver.PHP_EOL;
		preg_match("/ParseBinaryVersionResource: :(.*)\n/",$ver,$matches);
		if($matches[1]) echo "\t!! verpatch: ".$matches[1].PHP_EOL;
	}

	function check($dirbase,$dir,$recurse=false){
		global $col;
		global $data;
		global $cur;
		$ressig = sigcheck($dir);
		foreach(scandir($dir) as $file){
			if(is_dir($dir."/".$file) && $file != "." && $file != ".." && $recurse){
				check($dirbase, $dir."/".$file,$recurse);
			} elseif(is_file($dir."/".$file) && (is_int(strpos($file,".exe")) || is_int(strpos($file,".dll")) || is_int(strpos($file,".so")))) {
				debug($dir."/".$file);
				$data[$cur][00] = $file;

				$copyright = $_ENV["RC_COPYRIGHT"];
				$title = $_ENV["ARCH"]." ".$_ENV["AVXECHO"]." MSVC ".$_ENV["vcvars_ver"];
				if($ressig[$file]["copyright"] != $copyright && $file != "curl.exe" && $file != "libcurl.dll" && UPDATE_RC){
					verpatch($dir,$file,$ressig[$file]["binaryversion"],$copyright,$title);
					$ressig[$file] = sigcheck($dir,$file)[$file];
				}
				$data[$cur][50] =	$ressig[$file]["binaryversion"];
				$data[$cur][60] =	$ressig[$file]["productversion"];
				$data[$cur][5] =	$ressig[$file]["date"];
				$data[$cur][190] =	$ressig[$file]["product"];
				$data[$cur][110] =	$ressig[$file]["company"];
				$data[$cur][120] =	$ressig[$file]["description"];
				$data[$cur][65] =	$ressig[$file]["fileversion"];
				$data[$cur][10] =	$ressig[$file]["machinetype"];
				$data[$cur][150] =	$ressig[$file]["originalname"];
				$data[$cur][160] =	$ressig[$file]["internalname"];
				$data[$cur][170] =	$ressig[$file]["copyright"];
				$data[$cur][180] =	$ressig[$file]["comments"];
				if($data[$cur][170] == $copyright){
					$data[$cur][175] = "OK";
				} else {
					$data[$cur][175] = "KO";
				}
				if($data[$cur][160] == $title){
					$data[$cur][165] = "OK";
				} else {
					$data[$cur][165] = "KO";
				}

				$nbavx = 0;
				$data[$cur][30] = "";
				if(CHECK_AVX){
					$obdcmd = binenv("PATH_BIN_CYGWIN").'/sh.exe -c "objdump -M intel -d '.$dir."/".$file.' | ./opcode.sh -s AVX';
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
				$data[$cur][70] = "n/a";
				$data[$cur][80] = "";
				if(is_file($dir."/".$pdbfile)){
					debug($dir."/".$pdbfile);
					$chkmcmd = binenv("BIN_CHKMATCH").' -c '.$dir."/".$file.' '.$dir."/".$pdbfile;
					debug($chkmcmd);
					$chkm = execnono($chkmcmd,NULL,SCRIPT_DIR,NULL);
					debug($chkm);
					preg_match("/Result: (.*)/",$chkm,$matches);
					$data[$cur][70] = $pdbfile;
					$pdbres = str_replace(")","",str_replace("Unmatched (reason: ","",$matches[1]));
					$data[$cur][80] = $pdbres;
				}

				$dbhcmd = "dumpbin /headers ".$dir."/".$file;
				debug($dbhcmd);
				$dbh = execnono($dbhcmd,NULL,$dir."/",NULL);
				debug($dbh);

				preg_match("/ ([^ ]+) linker version/",$dbh,$matches);
				$data[$cur][40] = $matches[1];

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
					if($col[$k]["pad"] != -1) echo str_pad($v,$col[$k]["pad"]," ");
				echo PHP_EOL;
				$cur++;
			}		
		}
	}
	if(in_array("checkavx", $argv)){
		define("CHECK_AVX",true);
		echo "CHECK_AVX: ON".PHP_EOL;
	} else {
		define("CHECK_AVX",false);
		echo "CHECK_AVX: OFF".PHP_EOL;
	}
	
	if(in_array("updaterc", $argv)){
		define("UPDATE_RC",true);
		echo "UPDATE_RC: ON".PHP_EOL;
	} else {
		define("UPDATE_RC",false);
		echo "UPDATE_RC: OFF".PHP_EOL;
	}
	

	global $col;
	$col = array (
		0 => array("name" =>	"filename",		"pad" => 25),
		5 => array("name" =>	"date",			"pad" => 17),
		10 => array("name" =>	"x",			"pad" => 3),
		20 => array("name" =>	"link",			"pad" => 5),
		30 => array("name" =>	"set",			"pad" => 11),
		40 => array("name" =>	"cl",			"pad" => 6),
		50 => array("name" =>	"bver",			"pad" => 13),
		60 => array("name" =>	"pver",			"pad" => 13),
		65 => array("name" =>	"fver",			"pad" => 13),
		70 => array("name" =>	"pdb",			"pad" => 25),
		80 => array("name" =>	"pdbresult",	"pad" => 19),
			110 => array("name" =>	"company",		"pad" => -1),
			120 => array("name" =>	"description",	"pad" => -1),
		150 => array("name" =>	"originalname",	"pad" => 25),
			160 => array("name" =>	"internalname",	"pad" => -1),
		165 => array("name" =>	"in",	"pad" => 3),
			170 => array("name" =>	"copyright",	"pad" => -1),
		175 => array("name" =>	"cr",	"pad" => 3),
			180 => array("name" =>	"comments",		"pad" => -1),
		190 => array("name" =>	"product",		"pad" => 40),
	);
	if(!CHECK_AVX) 
		$col[30]["pad"] = -1;

	global $data;
	$data = array();

	global $cur;
	$cur = 0;

	$argv[1] = str_replace("\\","/",$argv[1]);

	echo "> ".$argv[1].PHP_EOL;
	$data[$cur] = $argv[1];
	$cur++;
	foreach($col as $k => $v){
		$data[$cur][$k] = $v["name"];
		if($v["pad"] != -1) echo str_pad($v["name"],$v["pad"]," ");
	}
	echo PHP_EOL;
	$cur++;
	check($argv[1],$argv[1]);
	$csv = "";
	foreach($data as $v){
		if(is_array($v)){
			$csv .= implode(";",$v).PHP_EOL;
		} else {
			$csv .= $v.PHP_EOL;
		}
	}
	file_put_contents($argv[2],$csv, FILE_APPEND);
?>