<?php
	function curlVersion(){
		// https://curl.haxx.se/libcurl/c/curl_version_info.html
		$feature = array(
			"CURL_VERSION_ALTSVC" => "ALTSVC",
			"CURL_VERSION_ASYNCHDNS" => "ASYNCHDNS",
			"CURL_VERSION_BROTLI" => "BROTLI",
			"CURL_VERSION_CONV" => "CONV",
			"CURL_VERSION_CURLDEBUG" => "CURLDEBUG",
			"CURL_VERSION_DEBUG" => "DEBUG",
			"CURL_VERSION_GSSAPI" => "GSSAPI",
			"CURL_VERSION_GSSNEGOTIATE" => "GSSNEGOTIATE",
			"CURL_VERSION_HTTPS_PROXY" => "HTTPS_PROXY",
			"CURL_VERSION_HTTP2" => "HTTP2",
//			"CURL_VERSION_HTTP3" => "HTTP3",
			"CURL_VERSION_IDN" => "IDN",
			"CURL_VERSION_IPV6" => "IPV6",
			"CURL_VERSION_KERBEROS4" => "KERBEROS4",
			"CURL_VERSION_KERBEROS5" => "KERBEROS5",
			"CURL_VERSION_LARGEFILE" => "LARGEFILE",
			"CURL_VERSION_LIBZ" => "LIBZ",
			"CURL_VERSION_MULTI_SSL" => "MULTI_SSL",
			"CURL_VERSION_NTLM" => "NTLM",
			"CURL_VERSION_NTLM_WB" => "NTLM_WB",
			"CURL_VERSION_PSL" => "PSL",
			"CURL_VERSION_SPNEGO" => "SPNEGO",
			"CURL_VERSION_SSL" => "SSL",
			"CURL_VERSION_SSPI" => "SSPI",
			"CURL_VERSION_TLSAUTH_SRP" => "TLSAUTH_SRP",
//			"CURL_VERSION_UNIX_SOCKETS " => "UNIX_SOCKETS"
		);
		$info = curl_version();
		$deps = "";
		if($info["libz_version"])
			$deps .= " zlib/".$info["libz_version"];
		if($info["brotli_version"])
			$deps .= " brotli/".$info["brotli_version"];
		if($info["ares"])
			$deps .= " c-ares/".$info["ares"];
		if($info["brotli_version"])
			$deps .= " nghttp2/".$info["brotli_version"];
		if($info["libssh_version"])
			$deps .= " ".$info["libssh_version"];
		if($info["libidn"])
			$deps .= " idn/".$info["libidn"];
		if($info["iconv_ver_num"])
			$deps .= " iconv/".$info["iconv_ver_num"];
		$protoc = "";
		foreach($info["protocols"] as $p)
			$protoc .= " ".$p;
		$feat = "";
		foreach($feature as $c => $n)
			if($info['features'] & constant($c))
				$feat .= " ".$n;
		$out =  "php_cURL libcurl/".$info["version"]." (".$info["host"].") ".$info["ssl_version"].$deps.PHP_EOL;
		$out .= "Protocols:".$protoc.PHP_EOL;
		$out .= "Features:".$feat.PHP_EOL;
		return $out;
	}

	$ch = curl_init();
	curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
	curl_setopt($ch, CURLOPT_HEADER,1);
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER,0);
	curl_setopt($ch, CURLOPT_VERBOSE,0);
	curl_setopt($ch, CURLOPT_SSL_VERIFYHOST,0);
	curl_setopt($ch, CURLOPT_FOLLOWLOCATION,1);
	curl_setopt($ch, CURLINFO_HEADER_OUT,1);
	curl_setopt($ch, CURLOPT_FAILONERROR,1);
	curl_setopt($ch, CURLOPT_PRIVATE,1);
	curl_setopt($ch, CURLOPT_IPRESOLVE,CURL_IPRESOLVE_V4);
	curl_setopt($ch, CURLOPT_ENCODING,'');
	curl_setopt($ch, CURLOPT_TCP_FASTOPEN,1);
	curl_setopt($ch, CURLOPT_URL,$argv[1]);
	curl_setopt($ch, CURLOPT_SSLVERSION, CURL_SSLVERSION_MAX_TLSv1_2);
	$response = curl_exec($ch);
	$opt = curl_getinfo($ch);
	curl_close($ch);
	echo curlVersion().PHP_EOL;
	$microdiv = 1000000;
	echo "    dns_resolution  ".($opt["namelookup_time_us"]/$microdiv).PHP_EOL;
	echo "   tcp_established  ".($opt["connect_time_us"]/$microdiv).PHP_EOL;
	echo "ssl_handshake_done  ".($opt["appconnect_time_us"]/$microdiv).PHP_EOL;
	echo "  time_pretransfer  ".($opt["pretransfer_time_us"]/$microdiv).PHP_EOL;
	if($opt["redirect_time_us"])
		echo "     time_redirect  ".($opt["redirect_time_us"]/$microdiv).PHP_EOL;
	echo "time_starttransfer  ".($opt["starttransfer_time_us"]/$microdiv).PHP_EOL;
	echo "                    --------".PHP_EOL;
	echo "        time_total  ".($opt["total_time_us"]/$microdiv).PHP_EOL.PHP_EOL;
?>