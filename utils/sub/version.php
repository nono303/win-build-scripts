<?php
	include( dirname(__FILE__) . '/_functions.php');

	/*
		CONST
	*/

	const DEBUG = false;
	const VERBOSE_PAD = 12;
	const REMOTE_URLS = ["origin","upstream"];

	define("PATH_SRC",pathenv("PATH_SRC"));
	define("CACHE_VERSION",pathenv("CACHE_VERSION") == "1" ? true : false);

	/*
		DATA ARRAYS
	*/

	global $letterpos;
	$pos = 1;
	foreach (range('a', 'z') as $letter)
		$letterpos[$letter] = $pos++;

	global $verfromfile;
	$verfromfile = [
		// no tag
		"libyuv"			=> ["/LIBYUV_VERSION (.*)/",
							PATH_SRC."/libyuv/include/libyuv/version.h"],
		// no tag
		"mobac"				=> ["/version = '([0-9\.]+)/",
							PATH_SRC."/mobac/build.gradle"],
		// no tag
		"mod_h264_streaming"=> ["/#define VERSION \"([^\"]+)\"/",
							PATH_SRC."/mod_h264_streaming/config.h"],
		// no tag
		"serf"				=> ["/#define SERF_MAJOR_VERSION *([0-9]+).*#define SERF_MINOR_VERSION *([0-9]+).*#define SERF_PATCH_VERSION *([0-9]+)/s",
							PATH_SRC."/serf/serf.h"],
		// no tag
		"apr"				=> ["/#define APR_MAJOR_VERSION *([0-9]+).*#define APR_MINOR_VERSION *([0-9]+).*#define APR_PATCH_VERSION *([0-9]+)/s",
							PATH_SRC."/apr/include/apr_version.h"],
		// no tag
		"apr-util"			=> ["/#define APU_MAJOR_VERSION *([0-9]+).*#define APU_MINOR_VERSION *([0-9]+).*#define APU_PATCH_VERSION *([0-9]+)/s",
							PATH_SRC."/apr-util/include/apu_version.h"],
		// no tag
		"giflib"			=> ['/ +VERSION ([0-9\.]+)/s',
							PATH_SRC."/giflib/5.2.1/CMakeLists.txt"],
		// no tag
		"mpir"				=> ['/#define _MSC_MPIR_VERSION "([0-9\.]+)/s',
							PATH_SRC."/mpir/gmp-h.in"],
		// no tag
		"pecl-system-sync"	=> ["/PHP_SYNC_VERSION +\"([0-9\.]+)/s",
							PATH_SRC."/pecl-system-sync/php_sync.h"],
		// no tag
		"subversion"		=> ["/#define SVN_VER_MAJOR *([0-9]+).*#define SVN_VER_MINOR *([0-9]+).*#define SVN_VER_PATCH *([0-9]+)/s",
							PATH_SRC."/subversion/subversion/include/svn_version.h"],
		// tag lower than file
		"tidy"				=> ["/([0-9]{1,3}\.[0-9]+\.[0-9]+)/s",
							PATH_SRC."/tidy/version.txt"],
		// tag lower than file
		"yajl"				=> ["/SET \(YAJL_MAJOR ([0-9]+).*SET \(YAJL_MINOR ([0-9]+).*SET \(YAJL_MICRO ([0-9]+)/s",
							PATH_SRC."/yajl/CMakeLists.txt"],
		// tag lower than file
		"libsodium"			=> ["/#define LIBSODIUM_VERSION_STRING \"([0-9\.]+)/s",
							PATH_SRC."/libsodium/builds/msvc/resource.rc"],
		// tag lower than file
		"libgd"				=> ["/#define GD_MAJOR_VERSION *([0-9]+).*#define GD_MINOR_VERSION *([0-9]+).*#define GD_RELEASE_VERSION *([0-9]+).*#define GD_EXTRA_VERSION *\"([^\"]+)\".*/s",
							PATH_SRC."/libgd/src/gd.h"],
		// tag lower than file
		"bzip2"				=> ['/VALUE "ProductVersion", "([0-9\.]+)/s',
							PATH_SRC."/bzip2/version.rc"],
		// tag lower than file
		"verpatch"			=> ["/set _ver=\"([^ ]+)/",
							PATH_SRC."/verpatch/ver-self.cmd"],
		// dirty version & last tag 8.0.1.xx
		"pecl-memcache"		=> ["/PHP_MEMCACHE_VERSION \"([0-9\.]+)/",
							PATH_SRC."/pecl-memcache/src/php_memcache.h"],
		// svn
		"mod_qos"			=> ['/g_revision\[\] = "([0-9\.]+)/s',
							PATH_SRC."/mod_qos/mod_qos.c"],
		// see nssm.bat for explanation
		"nssm"				=> ['/set NSSM_VER=([0-9\.]+)/s',
							pathenv("PATH_MODULES")."/nssm.bat"],
	];

	$addon = [
		"src" => [
			"libxpm"		=> "- _[src](https://gitlab.freedesktop.org/xorg/lib/libxpm)_",
			"mod_wku_bt"	=> "- _[src1](https://emptyhammock.com/media/downloads/wku_bt-2.01.zip)_",
			"sqlite"		=> "- _[release](https://www.sqlite.org/changes.html)_",

		],"version" => [
			"pecl-parallel"	=> ":red_circle: [~~1.2.11~~](https://github.com/krakjoe/parallel/issues/369)",
			"mobac"			=> ":warning: [apacheCommonsHttp](https://sourceforge.net/p/mobac/bugs/400/)",
		]
	];

	global $forcedelete;
	$forcedelete = ["_for_java11_tasks"];

	/*
		FUNCTIONS
	*/

	function getVerFileProduct($raw, $src) {
		global $forcedelete;
		preg_match_all('/\d+/', str_replace(array_merge([$src],$forcedelete),"",$raw), $matches);
		$ver_file = $ver_product = implode(".",$matches[0]);
		// ver_file: force x.x.x.x
		if (($nbdot = substr_count($ver_file, '.')) < 3) {
			for($i = $nbdot; $i < 3; $i++)
				$ver_file .= ".0";
		} elseif ($nbdot > 3){
			$tmp = explode(".",$ver_file);
			$ver_file = $tmp[0].".".$tmp[1].".".$tmp[2].".".$tmp[3];
		}
		// remove ending .0 in ver_product like x.x.x.0
		if(substr_count($ver_product, '.') >= 3 && str_ends_with($ver_product,".0"))
			$ver_product = substr($ver_product, 0,-2);
		return ["file" => $ver_file ,"product" => $ver_product, "raw" => $raw];
	}

	function getVersion($src, $verbose = false) {
		if(CACHE_VERSION && is_file($fcache = pathenv("PATH_VERSION_BUILD")."/".$src.".json")) {
			debug("get cached result from ".realpath($fcache));
			return json_decode(file_get_contents($fcache),true);
		}
		global $verfromfile;
		if($verbose)
			echo str_pad($src,25);
		// git source overrided
		if (is_array($verfromfile[$src])) {
			if(!is_file($verfromfile[$src][1]))
				throw new Exception("bad verfromfile file for ".$src." : ".$verfromfile[$src][1]);
			preg_match($verfromfile[$src][0],file_get_contents($verfromfile[$src][1]),$matches);
			for($i = 1; $i < sizeof($matches); $i++){
				if(strlen($matches[$i] = trim($matches[$i])) > 1)
					$matches[$i] = ltrim($matches[$i],'0');
				$ret["vfile"] .= $sep.$matches[$i];
				$sep = ".";
			}
			if(!$ret["vfile"])
				throw new Exception("bad verfromfile regexp for ".$src." : ".$verfromfile[$src][0]);
			$ret["vfile"] = getVerFileProduct($ret["vfile"], $src);
			$ret["vfile"]["name"] = $verfromfile[$src][1];
			if($verbose)
				echo str_pad($ret["vfile"]["product"], VERBOSE_PAD);
		} elseif($verbose) {
			echo str_pad("N/A", VERBOSE_PAD);
		}
		if (is_dir(PATH_SRC."/".$src."/.git")){
			$url = 0;
			foreach(array_filter(explode("\n",execnono($cmd = "git config --get remote.".REMOTE_URLS[0].".url && git config --get remote.".REMOTE_URLS[1].".url",NULL,realpath(PATH_SRC."/".$src),NULL))) as $rurl)
				$ret["scm"]["urls"][REMOTE_URLS[$url++]] = str_replace(".git","",$rurl);
			$ret["scm"]["name"] = "git";
			if($ret["scm"]["tag"] = trim(explode("\n",execnono($cmd = "git tag --points-at HEAD",NULL,realpath(PATH_SRC."/".$src),NULL))[0])){
				$ret["scm"]["tag"] = getVerFileProduct($ret["scm"]["tag"], $src);
				if($verbose)
					echo str_pad($ret["scm"]["tag"]["product"], VERBOSE_PAD);
			} else {
				unset($ret["scm"]["tag"]);
				if($verbose)
					echo str_pad("N/A", VERBOSE_PAD);
			}
			$ret["scm"]["ltag"] = explode("-g",execnono($cmd = "git describe --tags --long --always",NULL,realpath(PATH_SRC."/".$src),NULL));

			if(sizeof($ret["scm"]["ltag"]) == 2) { // have last tag
				$ret["scm"]["commit"] = array_pop($ret["scm"]["ltag"]);
				$ret["scm"]["branch"] = getGitBranchAtCommit($ret["scm"]["commit"], PATH_SRC."/".$src);
				if(sizeof($ret["scm"]["ltag"]) == 2 && $ret["scm"]["ltag"][1] == "0") // remove traling 0
					array_pop($ret["scm"]["ltag"]);
				$ret["scm"]["ltag"] = getVerFileProduct(implode("-",$ret["scm"]["ltag"]), $src);
				if($verbose)
					echo str_pad($ret["scm"]["ltag"]["product"], VERBOSE_PAD).str_pad($ret["scm"]["commit"], VERBOSE_PAD).str_pad($ret["scm"]["branch"], VERBOSE_PAD);
			} else { //dont have last taf
				$ret["scm"]["commit"] = $ret["scm"]["ltag"][0];
				$ret["scm"]["branch"] = getGitBranchAtCommit($ret["scm"]["commit"], PATH_SRC."/".$src);
				if($verbose)
					echo str_pad("N/A", VERBOSE_PAD).str_pad($ret["scm"]["commit"], VERBOSE_PAD).str_pad($ret["scm"]["branch"], VERBOSE_PAD);
				unset($ret["scm"]["ltag"]);
			}
			$ret["scm"]["date"] = trim(execnono($cmd = "git show -s --format=%cd --date=short ".$ret["scm"]["commit"],NULL,realpath(PATH_SRC."/".$src),NULL));
		} elseif (is_dir(PATH_SRC."/".$src."/.svn")){
			$ret["scm"]["name"] = "svn";
			$svninfo = execnono($cmd = "svn info",NULL,realpath(PATH_SRC."/".$src),NULL);
			preg_match("/Repository Root: ?(.*)\n/",$svninfo,$matches);
			$ret["scm"]["urls"][REMOTE_URLS[0]] = trim($matches[1]);
			preg_match("/Relative URL: \^\/(.*)\n/",$svninfo,$matches);
			$ret["scm"]["branch"] = explode("/",trim($matches[1]))[0];
			preg_match("/Last Changed Rev: (.*)\n/",$svninfo,$matches); // 'Revision' might not reflect last change of the module
			$ret["scm"]["commit"] = "r".trim($matches[1]); // add prefixe r for revision
			preg_match("/Last Changed Date: ([^ ]*)/",$svninfo,$matches);
			$ret["scm"]["date"] = trim($matches[1]);
		}

		// some verbose check
		if($verbose) {
			if($ret["vfile"] && $ret["scm"]["tag"] && $ret["vfile"]["product"] == $ret["scm"]["tag"]["product"])
				echo "file is useless";
			if($ret["vfile"] && $ret["scm"]["ltag"] && str_starts_with($ret["scm"]["ltag"]["product"],$ret["vfile"]["product"]))
				echo "file is useless";
			if($ret["scm"]["tag"] && $ret["scm"]["ltag"] && !str_starts_with($ret["scm"]["ltag"]["product"],$ret["scm"]["tag"]["product"]))
				echo "last tag mismatch tag";
			if($ret["scm"]["tag"] && $ret["scm"]["ltag"] && $ret["scm"]["ltag"]["product"] != $ret["scm"]["tag"]["product"] && !str_ends_with($ret["scm"]["ltag"]["product"],"0"))
				echo "last tag != tag";
		}
		// order return by src
		if($ret[$current = "vfile"]){
			$ret["file"] = $ret[$current]["file"];
			$ret["product"] = $ret[$current]["product"];
			$ret["from"] = $ret[$current]["name"];
		} elseif($ret["scm"][$current = "tag"]){
			$ret["file"] = $ret["scm"][$current]["file"];
			$ret["product"] = $ret["scm"][$current]["product"];
			$ret["from"] = $ret["scm"]["name"]." ".$current;
		} elseif($ret["scm"][$current = "ltag"]){
			$ret["file"] = $ret["scm"][$current]["file"];
			$ret["product"] = $ret["scm"][$current]["product"];
			$ret["from"] = $ret["scm"]["name"]." ".$current;
		} else {
			Throw new Exception ($src.": no tag or version");
		}
		if(CACHE_VERSION){
			file_put_contents($fcache,json_encode($ret, JSON_ENCODE_OPTIONS));
			debug(PHP_EOL."cache result to ".realpath($fcache));
		}
		return $ret;
	}

	/*
		MAIN
	*/
	$nbargs = sizeof($argv);
	debug($nbargs.PHP_EOL.print_r($argv,true));
	// no args: generate MD (+cache) for all scr
	if($nbargs == 1){
		$md = "| src | version |".PHP_EOL."| ---- | ---- |".PHP_EOL;
		echo
			str_pad("src",25).
			str_pad("file", VERBOSE_PAD).
			str_pad("tag", VERBOSE_PAD).
			str_pad("ltag", VERBOSE_PAD).
			str_pad("commit", VERBOSE_PAD).
			str_pad("branch", VERBOSE_PAD).
			PHP_EOL;
		foreach(glob(($cur = PATH_SRC)."/*",GLOB_ONLYDIR) as $srcpath) {
			$src = basename($srcpath);
			try {
				$ret = getVersion($src, true);
				$md .=
					"| ".
					($ret["scm"]["urls"]["origin"] ?
						"[".$src."](".($ret["scm"]["urls"]["origin"]).")" :
						$src).
					($ret["scm"]["urls"]["upstream"] ?
						" - [*upstream + src*](".($ret["scm"]["urls"]["upstream"]).")" :
						"").
					($addon["src"][$src] ? " ".$addon["src"][$src] : "").
					" | ".$ret["product"].
					(!str_ends_with($ret["from"], " tag") ?
						" - ".$ret["scm"]["commit"] :
						""
						).
					($addon["version"][$src] ? " ".$addon["version"][$src] : "").
					" |".
					PHP_EOL;
			} catch(Exception $e){
				echo PHP_EOL."! ".$e->getMessage();
				$ret["product"] = "";
				$md = "| ".$src." | `".$e->getMessage()."` |".PHP_EOL;
			}
			echo PHP_EOL;
		}
		file_put_contents($fn = pathenv("PATH_BATCH").'/SRC_VERSION.md',$md);
		echo PHP_EOL."> ".realpath($fn).exit(0);
	} else {
		if(is_dir($cur = PATH_SRC)."/".$argv[1]) {
			$current = getVersion($argv[1],DEBUG);
		} else {
			echo "version.php '".$argv[1]."' '".$argv[2]."': '".PATH_SRC."/".$argv[1]."' doesn't exist".PHP_EOL;
			exit(-1);
		}
	}


	// default: return product
	if($nbargs == 2) {
		debug(print_r($current, true));
		echo $current["product"];
		exit(0);
	} elseif($nbargs >= 3) {
		// export env var for init
		if($argv[2] == "env"){
			echo
				"SCM_COMORREV=".$current["scm"]["commit"].PHP_EOL.
				"SCM_TAG=".($current["scm"]["tag"] ? $current["scm"]["tag"]["product"] : "").PHP_EOL.
				"SCM_BRANCH=".$current["scm"]["branch"].PHP_EOL.
				"SCM_COMORREV_DATE=".$current["scm"]["date"].PHP_EOL.
				"SCM_URL=".$current["scm"]["urls"]["origin"].PHP_EOL.
				"GET_VERSION=".$current["product"];
			exit(0);
		} elseif(!is_file($argv[2])) {
			echo "[version] ERROR: file '".$argv[2]."' doesn't exist".PHP_EOL;
			exit(-1);
		} else {
			if(pathenv("ARCH")){
				$arch = pathenv("ARCH");
			} elseif(pathenv("PHP_SDK_ARCH")){
				$arch = pathenv("PHP_SDK_ARCH");
			}
			$description .= "arch:".$arch.pathenv("AVXB")." vcver:".pathenv("vcvars_ver")."[".pathenv("MSVC_DEPS")."]";

			// manage pdb
			$rpdb = " /rpdb";
			if($argv[3]){
				if($argv[3] == "norpdb"){
					$rpdb = "";
				} elseif($argv[3] == "memcached"){
					preg_match("/(libevent-[0-9]\.[0-9])/",$argv[2],$matches);
					$matches[1] ? $libdep = " ".str_replace("-",":",$matches[1]) : $libdep = "";
				} elseif($argv[3] != "libconfig") {
					// for GCC only
					$libdep = " ".$argv[3];
					/*
						additionnal descritption (used in php & httpd). order
							1. build:xxx
							2. proot:xxx
							3. libdeps:xxx
						ex. do_php C:\sdk\batch\utils\sub\version.php pecl-text-xdiff C:\sdk\release\vs18_x64-avx2\_php-ts\php_xdiff.dll build:ts php:8.5.4.1 lib:1.2.3
						do_php %PATH_UTILS%\sub\version.php php-ext-brotli C:\sdk\release\vs18_x64-avx2\_php-ts\php_brotli.dll build:ts php:8.5.4.1 brotli:1.2.10
					*/
					for($i = 3; $i < $nbargs; $i++){
						if(str_starts_with($argv[$i],"build")){
							$descargv .= " ".$argv[$i];
						} else {
							if(!$proot){
								$proot = explode(":",$argv[$i])[0]; // prefix product
								$descargv .= " (".$argv[$i];
							} else {
								$descargv .= " ".$argv[$i];
							}
						}
					}
					if($proot)
						$descargv .= ")";
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
				if(in_array($argv[1],["memcached", "sslh", "libconfig"])){
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

			if($current["scm"]["tag"]) {
				$description .= " tag:".$current["scm"]["tag"]["product"];
			} else {
				if(!is_null($current["scm"]["branch"]) && $current["scm"]["branch"] != "HEAD" && $current["scm"]["branch"] != "")
					$description .= " branch:".array_filter(explode("/",$current["scm"]["branch"]))[0]; // fix svn like '/trunk/httpd_src/modules/qos'
				if($current["scm"]["commit"])
					$description .= " commit:".$current["scm"]["commit"];
			}
			if($current["scm"]["date"])
				$description .= " date:".$current["scm"]["date"];
			$pname = basename($argv[2],".".pathinfo($argv[2], PATHINFO_EXTENSION));
			if($proot)
				$pname = $proot.":".$pname;

			$cmd = pathenv("BIN_VERPATCH")." ".$argv[2]." \"".$current["file"]."\" /va".$rpdb." /high /pv \"".$current["product"]."\" /s description \"".$description.$descargv."\" /s product \"".$pname."\" /s LegalTrademarks \"".$current["scm"]["urls"][0]."\" /s LegalCopyright \"https://github.com/nono303/win-build-scripts\"";
			if(DEBUG || pathenv("CUR_DEBUG") == 1){
				echo $cmd.PHP_EOL;
			} else {
				echo "[version] '".$current["product"]."' ".$argv[2]." (".str_replace("/","\\",$current["from"]).")".PHP_EOL;
			}
			passthru($cmd);
		}
	} else {
		echo "Bad usage:".PHP_EOL."type go help".PHP_EOL;
		exit(-1);
	}
?>