<?php
	include( dirname(__FILE__) . '/_functions.php');

	global $letterpos;
	global $nogit;

	$pos = 1;
	foreach (range('a', 'z') as $letter)
		$letterpos[$letter] = $pos++;
	$argv[1] = strtolower($argv[1]);
	$proot = $argv[1];
	if(in_array($proot,["mod_maxminddb","mod_fcgid","mod_h2","mod_md","mod_wku_bt","mod_h264_streaming"]))
		$proot = "httpd";
	if(in_array($proot,["pecl-memcache","php-geos","pecl-text-xdiff","php-ext-brotli","xdebug","php-src"]))
		$proot = "php";
	$nogit = array(
		"libjpeg-turbo"		=> ["/set\(VERSION ([0-9\.]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/CMakeLists.txt"],
		"libgav1"			=> ["/LIBGAV1_MAJOR_VERSION *([0-9]+).*LIBGAV1_MINOR_VERSION *([0-9]+).*LIBGAV1_PATCH_VERSION *([0-9]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/src/gav1/version.h"],
		"php-ogr"			=> ['/PHP_OGR_VERSION "([0-9\.]+)/s',
							pathenv("PATH_SRC")."/".$argv[1]."/php_ogr.h"],
		"php-proj"			=> ['/PHP_PROJ_VERSION "([0-9\.]+)/s',
							pathenv("PATH_SRC")."/".$argv[1]."/src/php_proj.h"],
		"libffi"			=> ["/\[libffi\],\[([0-9\.]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/configure.ac"],
		"yajl"			=> ["/SET \(YAJL_MAJOR ([0-9]+).*SET \(YAJL_MINOR ([0-9]+).*SET \(YAJL_MICRO ([0-9]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/CMakeLists.txt"],
		"mod_security"		=> ["/MODSEC_VERSION_MAJOR *\"([0-9]+).*MODSEC_VERSION_MINOR *\"([0-9]+).*MODSEC_VERSION_MAINT *\"([0-9]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/apache2/msc_release.h"],
		"sqlite"			=> ["/#define SQLITE_VERSION +\"([0-9\.]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/sqlite3.h"],
		"php-ext-brotli"	=> ["/#define BROTLI_EXT_VERSION \"([0-9\.]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/php_brotli.h"],
		"php-ext-zstd"		=> ["/#define PHP_ZSTD_EXT_VERSION \"([0-9\.]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/php_zstd.h"],
		"libxslt"			=> ["/MAJOR_VERSION\], \[([0-9]+).*MINOR_VERSION\], \[([0-9]+).*MICRO_VERSION\], \[([0-9]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/configure.ac"],
		"libsodium"			=> ["/#define LIBSODIUM_VERSION_STRING \"([0-9\.]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/builds/msvc/resource.rc"],
		"libpng"			=> ["/#define PNG_LIBPNG_VER_MAJOR *([0-9]+).*#define PNG_LIBPNG_VER_MINOR *([0-9]+).*#define PNG_LIBPNG_VER_RELEASE *([0-9]+).*/s",
							pathenv("PATH_SRC")."/".$argv[1]."/png.h"],
		"libgd"				=> ["/#define GD_MAJOR_VERSION *([0-9]+).*#define GD_MINOR_VERSION *([0-9]+).*#define GD_RELEASE_VERSION *([0-9]+).*#define GD_EXTRA_VERSION *\"([^\"]+)\".*/s",
							pathenv("PATH_SRC")."/".$argv[1]."/src/gd.h"],
		"geographiclib"		=> ["/PROJECT_VERSION_MAJOR ([0-9]+).*PROJECT_VERSION_MINOR ([0-9]+).*PROJECT_VERSION_PATCH ([0-9]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/CMakeLists.txt"],
		"libiconv"			=> ['/#define VERSION "([0-9\.]+)/s',
							pathenv("PATH_SRC")."/".$argv[1]."/libiconv/config.h"],
		"libev"				=> ['/AC_INIT\(\[libev\], \[([0-9\.]+)/s',
							pathenv("PATH_SRC")."/".$argv[1]."/configure.ac"],
		"mod_qos"			=> ['/g_revision\[\] = "([0-9\.]+)/s',
							pathenv("PATH_SRC")."/".$argv[1]."/mod_qos.c"],
		"giflib"			=> ['/giflib VERSION ([0-9\.]+)/s',
							pathenv("PATH_SRC")."/".$argv[1]."/5.2.1/CMakeLists.txt"],
		"mpir"				=> ['/#define _MSC_MPIR_VERSION "([0-9\.]+)"/s',
							pathenv("PATH_SRC")."/".$argv[1]."/gmp.h"],
		"bzip2"				=> ['/VALUE "ProductVersion", "([0-9\.]+)/s',
							pathenv("PATH_SRC")."/".$argv[1]."/version.rc"],
		"apr"				=> ["/#define APR_MAJOR_VERSION *([0-9]+).*#define APR_MINOR_VERSION *([0-9]+).*#define APR_PATCH_VERSION *([0-9]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/include/apr_version.h"],
		"apr-util"			=> ["/#define APU_MAJOR_VERSION *([0-9]+).*#define APU_MINOR_VERSION *([0-9]+).*#define APU_PATCH_VERSION *([0-9]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/include/apu_version.h"],
		"openssl-quic"		=> ["/VERSION_NUMBER=([0-9\.]+)/",
							pathenv("PATH_SRC")."/".$argv[1]."/makefile"],
		"php-cgi-spawner"	=> "1.1.24",
		"verpatch"			=> ["/set _ver=\"([^ ]+)/",
							pathenv("PATH_SRC")."/".$argv[1]."/ver-self.cmd"],
		"php-geos"			=> ["/PHP_GEOS_VERSION \"([0-9\.]+)/",
							pathenv("PATH_SRC")."/".$argv[1]."/php_geos.h"],
		"pecl-text-xdiff"	=> ["/PHP_XDIFF_VERSION \"([0-9\.]+)/",
							pathenv("PATH_SRC")."/".$argv[1]."/php_xdiff.h"],
		"pecl-memcache"		=> ["/PHP_MEMCACHE_VERSION \"([0-9\.]+)/",
							pathenv("PATH_SRC")."/".$argv[1]."/src/php_memcache.h"],
		"icu"				=> ["/U_ICU_VERSION \"(.*)\"/",
							pathenv("PATH_SRC")."/".$argv[1]."/icu4c/source/common/unicode/uvernum.h"],
		"nssm"				=> ["/NSSM_VERSIONINFO (.*),(.*),(.*),(.*)/",
							pathenv("PATH_SRC")."/".$argv[1]."/version.h"],
		"libyuv"			=> ["/LIBYUV_VERSION (.*)/",
							pathenv("PATH_SRC")."/".$argv[1]."/include/libyuv/version.h"],
		"mobac"				=> ["/mobac.revision=(.*)/",
							pathenv("PATH_SRC")."/".$argv[1]."/mobac/build/resources/main/mobac/mobac-rev.properties"],
		"mod_h264_streaming"=> ["/#define VERSION \"([^\"]+)\"/",
							pathenv("PATH_SRC")."/".$argv[1]."/config.h"],
		"serf"				=> ["/#define SERF_MAJOR_VERSION *([0-9]+).*#define SERF_MINOR_VERSION *([0-9]+).*#define SERF_PATCH_VERSION *([0-9]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/serf.h"],
		"wineditline"		=> ["/WinEditLine_VERSION_MAJOR *([0-9]+).*WinEditLine_VERSION_MINOR *([0-9]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/CMakeLists.txt"],
	);

	function getVersion($cur,$src){
		global $letterpos;
		global $nogit;
		$ver_product = "";
			$ver_file = "";
			$tagok = true;
			// git source overrided
			if (is_array($nogit[$src])){
				$from = $nogit[$src][1];
				preg_match($nogit[$src][0],file_get_contents($nogit[$src][1]),$matches);
				$sep = "";
				for($i = 1; $i < sizeof($matches); $i++){
					$ver_product .= $sep.trim($matches[$i]);
					$sep = ".";
				}
				if(pathenv("CUR_DEBUG") == 1)
					echo "    # nogit version: ".$ver_product." [".$nogit[$src][1]."]".PHP_EOL;
			} elseif (is_string($nogit[$src])){
				$from = $nogit[$src];
				$ver_product = $nogit[$src];
			} elseif (is_dir($cur."/".$src."/.git")){
				$from = "git";
				$ver_product = pathenv("SCM_TAG");
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
				// alpha / beta as .
				$ver_product = str_replace(["alpha","beta","rc","RC"],".",$ver_product);
				// pecl-memcache 5 'digit' version
				if(($sctex = sizeof($ctex = explode(".",$ver_product))) > 4){
					$ver_product = $ctex[0].".".$ctex[1].".".$ctex[2].".".$ctex[3];
					for($i = 4; $i < $sctex; $i++)
						$ver_product .= $ctex[$i];
				}
				// alpha, beta etc without number
				$ver_product = str_replace("..",".0.",$ver_product);
				if(substr($ver_product, -1) == ".")
					$ver_product .= "0";
			} else {
				echo str_pad($src,20)."NO TAG OR VERSION!".PHP_EOL;
				$tagok = false;
			}
			
			if($tagok){
				// '-dev' as 0
				$ver_product = str_replace("-dev","0",$ver_product);
				$ver_file = $ver_product;
				// letter in version : openssl & jpeg
				preg_match("/([a-zA-Z])$/",$ver_file,$matches);
				if($matches[1]){
					$ver_file = preg_replace("/[a-zA-Z]$/",".".$letterpos[strtolower($matches[1])],$ver_file);
					// !! must add a - to be take in account for producton version (verpatch limitation ?)
					$ver_product = preg_replace("/([a-zA-Z])$/","-".strtolower($matches[1]),$ver_product);
				}
				return ["file" => $ver_file ,"product" => $ver_product,"from" => $from];
			}
	}
	// print_r($argv);
	if(sizeof($argv) == 1){
		$md = "| src | version | ".PHP_EOL."| ---- | ---- |".PHP_EOL;
		foreach(scandir($cur = pathenv("PATH_SRC")) as $src) {
			if(is_dir($cur."/".$src) & $src != "." && $src != ".."){
				$current = getVersion($cur,$src);
				// $upstream = str_replace("git:","https:",execnono($cmd = "git config --get remote.origin.url",NULL,$cur."/".$src,NULL));
				echo str_pad($src,20).str_pad($current["product"],12).str_pad($current["file"],12).PHP_EOL;
				// $md .= "| [".$src."](".$upstream.") | ".$current["file"]." |".PHP_EOL;
			}
		}
		// file_put_contents(dirname(__FILE__) . '/../../SRC_VERSION.md',$md);
	} elseif(sizeof($argv) >= 3){
		if(is_dir($cur = pathenv("PATH_SRC"))."/".$argv[1]){
			$current = getVersion($cur,$argv[1]);

			if(pathenv("ARCH")){
				$arch = pathenv("ARCH");
			}elseif(pathenv("PHP_SDK_ARCH")){
				$arch = pathenv("PHP_SDK_ARCH");
			}
			$description .= "arch:".$arch.pathenv("AVXB")." vcver:".pathenv("vcvars_ver")."[".pathenv("MSVC_DEPS")."]";

			$rpdb = " /rpdb";
			$descadd = "";
			if($argv[3] == "norpdb"){
				$rpdb = "";
			} elseif($argv[3] == "memcached"){
				$rpdb = "";
				preg_match("/(libevent-[0-9]\.[0-9])/",$argv[2],$matches);
				$libevent = str_replace("-",":",$matches[1]);
				$gccver = end(explode(" ",explode("\n",shell_exec("gcc --version"))[0]));
				if(is_int(strpos($argv[2],"\\x86\\")))
					$arch = "x86";
				if(is_int(strpos($argv[2],"\\x64\\")))
					$arch = "x64";
				if(is_int(strpos($argv[2],"-avx")))
					$avx = "-avx";
				$description = "arch:".$arch.$avx." gcc:".$gccver." ".$libevent;
			} elseif($argv[3] != ""){
				$descadd = " ".$argv[3];
			}
			if(pathenv("SCM_COMORREV"))
				$description .= " commit:".pathenv("SCM_COMORREV");
			if(pathenv("SCM_TAG"))
				$description .= " tag:".pathenv("SCM_TAG");
			if(!is_null(pathenv("SCM_BRANCH")) && pathenv("SCM_BRANCH") != "HEAD" && pathenv("SCM_BRANCH") != "")
				$description .= " branch:".pathenv("SCM_BRANCH");
			if(pathenv("SCM_COMORREV_DATE"))
				$description .= " date:".pathenv("SCM_COMORREV_DATE");
			if($descadd)
				$description .= $descadd;
			$pname = basename($argv[2],".".pathinfo($argv[2], PATHINFO_EXTENSION));
			if($pname != $proot)
				$pname = $proot.":".$pname;

			$cmd = pathenv("BIN_VERPATCH")." ".$argv[2]." \"".$current["file"]."\" /va".$rpdb." /high /pv \"".$current["product"]."\" /s description \"".$description."\" /s product \"".$pname."\" /s LegalTrademarks \"".pathenv("SCM_URL")."\" /s LegalCopyright \"https://github.com/nono303/win-build-scripts\"";
			if(pathenv("CUR_DEBUG") == 1){
				echo $cmd.PHP_EOL;
			} else {
				echo "[version] '".$current["product"]."' ".$argv[2]." (".str_replace("/","\\",$current["from"]).")".PHP_EOL;
			}
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