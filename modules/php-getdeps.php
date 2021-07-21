<?php
	function delTree($dir) {
		$files = array_diff(scandir($dir), array('.','..'));
		foreach ($files as $file) {
			if(is_dir($dir."/".$file)){
				delTree("$dir/$file");
			} else {
				echo "\tdel fil '".$dir."/".$file."'".PHP_EOL;
				unlink("$dir/$file");
			}
		}
		echo "\tdel dir '".$dir."'".PHP_EOL;
		return rmdir($dir);
	} 

	// print_r($_ENV);
	// exit();

	// stable || staging
	$type = "staging";
	// x86 || x64
	$arch = $_ENV["ARCH"];
	// vs16 || vc15 || vs17
	$msvc = $_ENV["MSVC_DEPS"];
	// https://windows.php.net/downloadS/php-sdk/deps/series/
	if($msvc == "vs16"){
		$pckver = "master";
	} else {
		$pckver = $_ENV["PHPVER"];
	}
	$basedir = $_ENV["PATH_PHP_SDK"]."/phpmaster/".$msvc."/".$arch."/";
	$outdir = $basedir."deps/";
	$zipdir = $basedir."zip/";


	$depsreq = array(
						// 2020-04-22
		// "apache",
		"c-client",		//2007f
		"fbclient",		//3.0.6
		// "freetype",
		"glib",			//2.53.3
		"ICU",			//68.1
		"libargon2",	//20190702
		// "libbzip2",
		// "libcurl",
		"libenchant",	//2.2.8
		// "libffi",
		// "libiconv",
		"libintl",		//0.18.3-6
		// "libjpeg",
		"liblmdb",		//0.9.22-4
		"libonig",		//6.9.6
		// "libpng",
		"libpq",		//11.4
		"libqdbm",		//1.8.78
		"libsasl",		//2.1.27-2
		"libsodium",	//1.0.18
		// "libssh2",
		// "libtidy",
		"libwebp",		//1.1.0
		// "libxml2",
		// "libxpm",
		"libxslt",		//1.1.34
		// "libzip",
		"mpir",			//3.0.0
		"net-snmp",		//5.7.3-1
		// "nghttp2",
		"openldap",		//2.4.47
		// "openssl",
		// "sqlite3",
		// "wineditline",
		// "zlib",
	);

	$urlbase = "https://windows.php.net/downloadS/php-sdk/deps/";
	

		/******** > 2021-07-21 TMP !! vs17 non disponible ********/
		if($msvc == "vs17"){
			$msvcpackages = "vs16";
		} else {
			$msvcpackages = $msvc;
		}
		/******** < 2021-07-21 TMP !! vs17 non disponible ********/
	$repdl = $urlbase.$msvcpackages."/".$arch."/";
	$package = "packages-".$pckver."-".$msvcpackages."-".$arch."-".$type.".txt";

	$serie = $urlbase."series/".$package;
	$stampfile = "lastupate.txt";

	$ch = curl_init();
	$opts = array(
		CURLOPT_RETURNTRANSFER	=> 1,
		CURLOPT_HEADER			=> 0,
		CURLOPT_CONNECTTIMEOUT	=> 2,
		CURLOPT_TIMEOUT			=> 5,
		CURLOPT_SSL_VERIFYPEER	=> 0,
		CURLOPT_VERBOSE			=> 0,
		CURLOPT_SSL_VERIFYHOST	=> 0,
		CURLOPT_FOLLOWLOCATION	=> 1,
		CURLINFO_HEADER_OUT		=> 0,
		CURLOPT_FAILONERROR		=> 0,
		CURLOPT_PRIVATE			=> 1,
		CURLOPT_FILETIME		=> 1,
	);
	curl_setopt_array($ch,$opts);
	curl_setopt($ch,CURLOPT_USERAGENT,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:86.0) Gecko/20100101 Firefox/86.0');

	if($pckver == "8.0" && $msvc == "vc15"){
		$data = file_get_contents(dirname(__FILE__)."/".$package);
		$timestamp = filemtime(dirname(__FILE__)."/".$package);
	} else {
		curl_setopt($ch, CURLOPT_URL, $serie);
		
		$data = curl_exec ($ch);
		$cgi = curl_getinfo($ch);
		$error = curl_error($ch); 
		if(is_array($error) || $cgi["http_code"] != "200"){
			echo "Unbale to retrieve '".$serie."' > aborting!".PHP_EOL.print_r($cgi,true).PHP_EOL.print_r($error,true);
			exit(1);
		}
		echo "retrieve '".$serie."' > ok".PHP_EOL;
		$timestamp = curl_getinfo($ch, CURLINFO_FILETIME);
		if ($timestamp == -1) {
			echo "Unbale to retrieve datetime of '".$serie."' > aborting!".PHP_EOL;
			exit(1);
		}
	}
	if(is_file($basedir.$stampfile)){
		$lastupate = intval(trim(file_get_contents($basedir.$stampfile)));
		if($lastupate > $timestamp){
			echo "deps: up to date:".PHP_EOL;
			echo " - ".date("Y-m-d H:i:s", $timestamp)." '".$package."'".PHP_EOL;
			echo " - ".date("Y-m-d H:i:s", $lastupate)." '".$stampfile."'".PHP_EOL;
			echo "> exiting".PHP_EOL;
			exit(0);
		} else {
			echo "deps: out of date > download".PHP_EOL;
			unlink($basedir.$stampfile);
		}
	} else {
		echo "deps: not present > download".PHP_EOL;
	}
	if(is_dir($outdir)){
		echo "cleaning '".$outdir."'".PHP_EOL;
		delTree($outdir);
		sleep(1);
	}
	if(!mkdir($outdir)){
		echo "Unbale to create '".$outdir."' > aborting!".PHP_EOL;
		exit(1);
	} else {
		echo "creating '".$outdir."'".PHP_EOL;
	}
	if(!is_dir($zipdir)){
		if(!mkdir($zipdir)){
			echo "Unbale to create '".$zipdir."' > aborting!".PHP_EOL;
			exit(1);
		} else {
			echo "creating '".$zipdir."'".PHP_EOL;
		}
	}
	$nddep = 0;
	$opts = array(
		CURLOPT_HEADER => 0,
		CURLOPT_RETURNTRANSFER	=> 0,
		CURLOPT_TIMEOUT => 0,
		CURLOPT_NOPROGRESS => 0,
	);
	$opts[CURLOPT_PROGRESSFUNCTION] = function ($ch, $download_size, $downloaded, $upload_size, $uploaded) {
		if($download_size != 0)
			echo str_pad(sprintf('%0.2f', ($downloaded / $download_size) * 100, 2),6," ",STR_PAD_LEFT)."%\r";
	};
	curl_setopt_array($ch, $opts);
	foreach(explode("\n",$data) as $dep){
		$dep = trim($dep);
		foreach($depsreq as  $depreq){
			if(is_int(strpos($dep,$depreq))){
				$destination = $zipdir.$dep;
				$nddep++;
				if(is_file($destination)){
					echo "In cache: ".$dep.PHP_EOL;
				} else {
					echo "Download: ".$repdl.$dep.PHP_EOL;
					curl_setopt($ch, CURLOPT_URL, $repdl.$dep);
					$fp = fopen($destination, "w");
					curl_setopt($ch, CURLOPT_FILE, $fp);
					$data = curl_exec ($ch);
					$error = curl_error($ch); 
					if(is_array($error)){
						print_r($error);
						echo "Unbale to retrieve '".$repdl.$dep."' > aborting!".PHP_EOL;
					}
					fclose($fp);
				}
			}
		}
	}
	echo $nddep." / ".sizeof($depsreq).PHP_EOL;
	curl_close ($ch);
	$unzip = $_ENV["BIN_SEVENZ"]." x -y ".$zipdir."* -o".$outdir.PHP_EOL;
	echo "Unzip file to deps: '".$unzip."'".PHP_EOL;
	passthru($unzip);
	echo "create '".$stampfile."' with current timestamp".PHP_EOL;
	file_put_contents($basedir.$stampfile,time());
?>