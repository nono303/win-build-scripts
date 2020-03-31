<?php
	//print_r($_ENV);
	//exit();
	// stable || staging
	$type = "staging";
	// x86 || x64
	$arch = $_ENV["ARCH"];
	// vs16 || vc15
	$msvc = $_ENV["MSVC_DEPS"];
	// https://windows.php.net/downloadS/php-sdk/deps/series/
	if($msvc == "vs16"){
		$package = "master";
	} else {
		$package = $_ENV["PHPVER"];
	}
	$outdir = "C:/php72-sdk/phpmaster/".$msvc."/".$arch."/deps/";
	$depsreq = array(
		"c-client",
		"fbclient",
		"glib",
		"ICU",
		"libargon2",
		"libenchant",
		"libffi",
		"libintl",
		"liblmdb",
		"libonig",
		"libpq",
		"libqdbm",
		"libsasl",
		"libsodium",
		"libwebp",
		"libxslt",
		"libzip",
		"mpir",
		"net-snmp",
		"openldap",
		"wineditline",
		"libcurl",
	);

	$urlbase = "https://windows.php.net/downloadS/php-sdk/deps/";
	$repdl = $urlbase.$msvc."/".$arch."/";
	$serie = $urlbase."series/packages-".$package."-".$msvc."-".$arch."-".$type.".txt";
	echo $serie.PHP_EOL;

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
	CURLOPT_FAILONERROR		=> 1,
	CURLOPT_PRIVATE			=> 1,
);
curl_setopt_array($ch,$opts);
curl_setopt($ch,CURLOPT_USERAGENT,'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.13) Gecko/20080311 Firefox/2.0.0.13');
curl_setopt($ch, CURLOPT_URL, $serie);
$data = curl_exec ($ch);
$error = curl_error($ch); 


print_r($error);

/*

*/

	$nddep = 0;
	foreach(explode("\n",$data) as $dep){
		foreach($depsreq as  $depreq){
			if(is_int(strpos($dep,$depreq))){
				$nddep++;
				echo $repdl.$dep.PHP_EOL;
				curl_setopt($ch, CURLOPT_URL, $repdl.$dep);
				$data = curl_exec ($ch);
				$error = curl_error($ch); 
				
				$destination = $outdir.$dep;
				$file = fopen($destination, "w+");
				fputs($file, $data);
				fclose($file);
			}
		}
	}
	echo $nddep." / ".sizeof($depsreq).PHP_EOL;
	curl_close ($ch);
?>