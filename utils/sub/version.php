<?php
	include( dirname(__FILE__) . '/_functions.php');
	define("DEBUG",false);

	global $letterpos;
	global $nogit;

	$pos = 1;
	foreach (range('a', 'z') as $letter)
		$letterpos[$letter] = $pos++;
	$proot = $argv[1] = strtolower($argv[1]);
	if(in_array($proot,["mod_bikeshed","mod_maxminddb","mod_fcgid","mod_h2","mod_md","mod_wku_bt","mod_h264_streaming","mod_qos","mod_security"]))
		$proot = "httpd";
	if(in_array($proot,["pecl-memcache","php-geos","php-ogr","php-proj","pecl-text-xdiff","php-ext-brotli","php-ext-zstd","xdebug","php-src"]))
		$proot = "php";
	$nogit = array(
		"libgeotiff"		=> ["/#define LIBGEOTIFF_STRING_VERSION +\"([0-9\.]+)/s",
							pathenv("PATH_INSTALL")."/include/geotiff.h"],
		"sslh"				=> ["/define VERSION \"v([0-9\.]+)-([0-9]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/version.h"],
		"dependencies"		=> ["/AssemblyVersion\(\"([0-9\.]+)\"/s",
							pathenv("PATH_SRC")."/".$argv[1]."/DependenciesGui/Properties/AssemblyInfo.cs"],
		"pecl-system-sync"	=> ["/PHP_SYNC_VERSION +\"([0-9\.]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/php_sync.h"],
		"mod_maxminddb"		=> ["/\[mod_maxminddb\], ?\[([0-9\.]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/configure.ac"],
		"subversion"		=> ["/#define SVN_VER_MAJOR *([0-9]+).*#define SVN_VER_MINOR *([0-9]+).*#define SVN_VER_PATCH *([0-9]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/subversion/include/svn_version.h"],
		"tidy"				=> ["/([0-9]{1,3}\.[0-9]+\.[0-9]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/version.txt"],
		"libssh2"			=> ["/#define LIBSSH2_VERSION_MAJOR *([0-9]+).*#define LIBSSH2_VERSION_MINOR *([0-9]+).*#define LIBSSH2_VERSION_PATCH *([0-9]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/include/libssh2.h"],
		"mod_fcgid"			=> ["/#define MODFCGID_VERSION_MAJOR *([0-9]+).*#define MODFCGID_VERSION_MINOR *([0-9]+).*#define MODFCGID_VERSION_SUBVER *([0-9]+).*#define MODFCGID_VERSION_DEV *([0-9]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/modules/fcgid/fcgid_conf.h"],
		"libxml2"			=> ["/#define LIBXML_DOTTED_VERSION +\"([0-9\.]+)/s",
							pathenv("PATH_INSTALL")."/include/libxml2/libxml/xmlversion.h"],
		"python"			=> ["/#define PY_VERSION +\"([0-9\.]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/Include/patchlevel.h"],
		"curl"				=> ["/#define LIBCURL_VERSION \"([0-9\.]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/include/curl/curlver.h"],
		"nghttp2"			=> ["/nghttp2 VERSION ([0-9\.]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/CMakeLists.txt"],
		"libjpeg-turbo"		=> ["/set\(VERSION ([0-9\.]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/CMakeLists.txt"],
		"libgav1"			=> ["/LIBGAV1_MAJOR_VERSION *([0-9]+).*LIBGAV1_MINOR_VERSION *([0-9]+).*LIBGAV1_PATCH_VERSION *([0-9]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/src/gav1/version.h"],
		"php-ogr"			=> ['/PHP_OGR_VERSION "([0-9\.]+)/s',
							pathenv("PATH_SRC")."/".$argv[1]."/php_ogr.h"],
		"php-proj"			=> ['/PHP_PROJ_VERSION "([0-9\.]+)/s',
							pathenv("PATH_SRC")."/".$argv[1]."/src/php_proj.h"],
		"libxpm"			=> ["/\[libXpm\], *\[([0-9\.]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/configure.ac"],
		"yajl"				=> ["/SET \(YAJL_MAJOR ([0-9]+).*SET \(YAJL_MINOR ([0-9]+).*SET \(YAJL_MICRO ([0-9]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/CMakeLists.txt"],
		"mod_security"		=> ["/MODSEC_VERSION_MAJOR *\"([0-9]+).*MODSEC_VERSION_MINOR *\"([0-9]+).*MODSEC_VERSION_MAINT *\"([0-9]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/apache2/msc_release.h"],
		"sqlite"			=> ["/#define SQLITE_VERSION +\"([0-9\.]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/sqlite3.h"],
		"php-ext-brotli"	=> ["/#define BROTLI_EXT_VERSION \"([0-9\.]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/php_brotli.h"],
		"php-ext-zstd"		=> ["/#define PHP_ZSTD_VERSION \"([0-9\.]+)/s",
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
		"libiconv"			=> ['/AC_INIT\(\[libiconv\], \[([0-9\.]+)/s',
							pathenv("PATH_SRC")."/".$argv[1]."/libiconv/configure.ac"],
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
		"apr2"				=> ["/#define APR_MAJOR_VERSION *([0-9]+).*#define APR_MINOR_VERSION *([0-9]+).*#define APR_PATCH_VERSION *([0-9]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/include/apr_version.h"],
		"apr-util"			=> ["/#define APU_MAJOR_VERSION *([0-9]+).*#define APU_MINOR_VERSION *([0-9]+).*#define APU_PATCH_VERSION *([0-9]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/include/apu_version.h"],
		"openssl-quic"		=> ["/VERSION_NUMBER=([0-9\.]+)/",
							pathenv("PATH_SRC")."/".$argv[1]."/makefile"],
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
		"wineditline"		=> ["/RL_READLINE_VERSION *0x([0-9]{2})([0-9]{2})([0-9]{2})/s",
							pathenv("PATH_SRC")."/".$argv[1]."/src/editline/readline.h"],
		"libconfig"		=> ["/AC_INIT\(\[libconfig\],\[([0-9\.]+)/s",
							pathenv("PATH_SRC")."/".$argv[1]."/configure.ac"],
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
					if(strlen($matches[$i] = trim($matches[$i])) > 1) 
						$matches[$i] = ltrim($matches[$i],'0');
					$ver_product .= $sep.$matches[$i];
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
				// echo "SCM_TAG: ".$ver_product.PHP_EOL;
				// remove name
				$ver_product = str_replace($src,"",$ver_product);
				// remove other prefix
				$ver_product = preg_replace("/^\D+([0-9])/","\\1",$ver_product);
				// remove git commit suffix
				$ver_product = preg_replace("/-.{8}$/","",$ver_product);
				// remove other suffix (might end with a number ex. centos7)
				$ver_product = preg_replace("/-\D+[0-9]?$/","",$ver_product);
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
			} else {
				echo str_pad($src,20)."NO TAG OR VERSION!".PHP_EOL;
				$tagok = false;
			}
			
			if($tagok){
				if(str_ends_with($ver_product,"."))
					$ver_product .= "0";
				if(str_starts_with($ver_product,"."))
					$ver_product = "0".$ver_product;
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
				// force x.x.x.x
				if (($nbdot = substr_count($ver_file, '.')) < 3)
					for($i = $nbdot; $i < 3; $i++)
						$ver_file = $ver_file.".0";
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
	} elseif(sizeof($argv) == 2){
		echo getVersion($cur,$argv[1])["product"];
	} elseif(sizeof($argv) >= 3){
		if(is_dir($cur = pathenv("PATH_SRC"))."/".$argv[1]){
			$current = getVersion($cur,$argv[1]);
			if($argv[2] == "veronly"){
				echo $current["file"];
				exit(1);
			}
			if(pathenv("ARCH")){
				$arch = pathenv("ARCH");
			} elseif(pathenv("PHP_SDK_ARCH")){
				$arch = pathenv("PHP_SDK_ARCH");
			}
			$description .= "arch:".$arch.pathenv("AVXB")." vcver:".pathenv("vcvars_ver")."[".pathenv("MSVC_DEPS")."]";

			$rpdb = " /rpdb";
			if($argv[3]){
				if($argv[3] == "norpdb"){
					$rpdb = "";
				} elseif($argv[3] == "memcached"){
					preg_match("/(libevent-[0-9]\.[0-9])/",$argv[2],$matches);
					$matches[1] ? $libdep = " ".str_replace("-",":",$matches[1]) : $libdep = "";
				} elseif($argv[3] != "libconfig" ){
					$libdep = " ".$argv[3];
					$description .= " ".$argv[3];
				}
				/* cygwin
					[1] => libconfig
					[2] => D:\github\NONO_sslh\x64\avx2\cygconfig-11.dll
					[3] => libconfig
				---					   
					[1] => sslh
					[2] => D:\github\NONO_sslh\x64\avx2\echosrv.exe
					[3] => libconfig:v1.7.3
				---							   
					[1] => memcached
					[2] => D:\github\NONO_memcached\libevent-2.1\x64\memcached-avx-tls.exe
					[3] => memcached
				***
					[4] => 	x%TARGET_ARCH% 
					[5] => 	%AVXECHO%
				*/
				if(in_array($argv[1],["memcached","sslh","libconfig"])){
					$rpdb = "";
					$arch = $argv[4];
					$avx = $argv[5];
					preg_match("/ ([0-9\.]+) /",shell_exec("gcc --version"),$matches);
					$gccver = $matches[1];
					$description = 
						"arch:".$arch."-".$avx." ".
						"gcc:".$gccver.$libdep;
				}
			}
			if(pathenv("SCM_COMORREV"))
				$description .= " commit:".pathenv("SCM_COMORREV");
			if(pathenv("SCM_TAG"))
				$description .= " tag:".pathenv("SCM_TAG");
			if(!is_null(pathenv("SCM_BRANCH")) && pathenv("SCM_BRANCH") != "HEAD" && pathenv("SCM_BRANCH") != "")
				$description .= " branch:".pathenv("SCM_BRANCH");
			if(pathenv("SCM_COMORREV_DATE"))
				$description .= " date:".pathenv("SCM_COMORREV_DATE");
			$pname = basename($argv[2],".".pathinfo($argv[2], PATHINFO_EXTENSION));
			if($pname != $proot)
				$pname = $proot.":".$pname;

			$cmd = pathenv("BIN_VERPATCH")." ".$argv[2]." \"".$current["file"]."\" /va".$rpdb." /high /pv \"".$current["product"]."\" /s description \"".$description."\" /s product \"".$pname."\" /s LegalTrademarks \"".pathenv("SCM_URL")."\" /s LegalCopyright \"https://github.com/nono303/win-build-scripts\"";
			if(DEBUG || pathenv("CUR_DEBUG") == 1){
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