<?php
	include( dirname(__FILE__) . '/_functions.php');

	/*
		CONST
	*/

	const DEBUG = false;
	const DEBUG_PAD = 12;
	const REMOTE_URLS = ["origin","upstream"];

	define("PATH_SRC",pathenv("PATH_SRC"));

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
		global $verfromfile;
		if($verbose)
			echo str_pad($src,25);
		// git source overrided
		if (is_array($verfromfile[$src])) {
			if(!is_file($ret["vfile"]["from"] = $verfromfile[$src][1]))
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
			if($verbose)
				echo str_pad($ret["vfile"]["product"], DEBUG_PAD);
		} elseif($verbose) {
			echo str_pad("N/A", DEBUG_PAD);
		}

		if (is_dir(PATH_SRC."/".$src."/.git")){
			$url = 0;
			foreach(array_filter(explode("\n",execnono($cmd = "git config --get remote.".REMOTE_URLS[0].".url && git config --get remote.".REMOTE_URLS[1].".url",NULL,realpath(PATH_SRC."/".$src),NULL))) as $rurl)
				$ret["scm"]["urls"][REMOTE_URLS[$url++]] = str_replace(".git","",$rurl);
			$ret["scm"]["name"] = "git";
			if($ret["scm"]["tag"] = trim(explode("\n",execnono($cmd = "git tag --points-at HEAD",NULL,realpath(PATH_SRC."/".$src),NULL))[0])){
				$ret["scm"]["tag"] = getVerFileProduct($ret["scm"]["tag"], $src);
				if($verbose)
					echo str_pad($ret["scm"]["tag"]["product"], DEBUG_PAD);
			} elseif($verbose) {
				echo str_pad("N/A", DEBUG_PAD);
			}
			$ret["scm"]["ltag"] = explode("-g",execnono($cmd = "git describe --tags --long --always",NULL,realpath(PATH_SRC."/".$src),NULL));
			if(sizeof($ret["scm"]["ltag"]) == 2) { // have last tag
				$ret["scm"]["commit"] = array_pop($ret["scm"]["ltag"]);
				$ret["scm"]["branch"] = getGitBranchAtCommit($ret["scm"]["commit"], PATH_SRC."/".$src);
				if(sizeof($ret["scm"]["ltag"]) == 2 && $ret["scm"]["ltag"][1] == "0") // remove traling 0
					array_pop($ret["scm"]["ltag"]);
				$ret["scm"]["ltag"] = getVerFileProduct(implode("-",$ret["scm"]["ltag"]), $src);
				if($verbose)
					echo str_pad($ret["scm"]["ltag"]["product"], DEBUG_PAD).str_pad($ret["scm"]["commit"], DEBUG_PAD).str_pad($ret["scm"]["branch"], DEBUG_PAD);
			} else { //dont have last taf
				$ret["scm"]["commit"] = $ret["scm"]["ltag"][0];
				$ret["scm"]["branch"] = getGitBranchAtCommit($ret["scm"]["commit"], PATH_SRC."/".$src);
				if($verbose)
					echo str_pad("N/A", DEBUG_PAD).str_pad($ret["scm"]["commit"], DEBUG_PAD).str_pad($ret["scm"]["branch"], DEBUG_PAD);
				unset($ret["scm"]["ltag"]);
			}

		} // TODO SVN

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
			$ret["from"] = $ret[$current]["product"];
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
		return $ret;
	}

	/*
		MAIN
	*/

	// print_r($argv);

	// all src: gen MD
	if(sizeof($argv) == 1){
		$md = "| src | version |".PHP_EOL."| ---- | ---- |".PHP_EOL;
		echo
			str_pad("src",25).
			str_pad("file", DEBUG_PAD).
			str_pad("tag", DEBUG_PAD).
			str_pad("ltag", DEBUG_PAD).
			str_pad("commit", DEBUG_PAD).
			str_pad("branch", DEBUG_PAD).
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
		$proot = $argv[1] = strtolower($argv[1]);
		if(in_array($proot,["mod_bikeshed","mod_evasive","mod_fcgid","mod_h2","mod_h264_streaming","mod_maxminddb","mod_md","mod_qos","mod_security","mod_wku_bt","mod_zstd"]))
			$proot = "httpd";
		if(in_array($proot,["pecl-datetime-timezonedb","pecl-igbinary","pecl-memcache","pecl-parallel","pecl-system-sync","pecl-text-xdiff","php-ext-brotli","php-ext-zstd","php-geos","php-ogr","php-proj","php-src"]))
			$proot = "php";
	}

	// default: return product
	if(sizeof($argv) == 2) {
		$ret = getVersion($argv[1], true);
		print_r($ret);
		echo $ret["product"];
	} elseif(sizeof($argv) >= 3){
		if(is_dir($cur = PATH_SRC)."/".$argv[1]){
			$current = getVersion($argv[1]);
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
			if($ret["scm"]["tag"])
				$description .= " tag:".$ret["scm"]["tag"];
			if(!is_null(pathenv("SCM_BRANCH")) && pathenv("SCM_BRANCH") != "HEAD" && pathenv("SCM_BRANCH") != "")
				$description .= " branch:".pathenv("SCM_BRANCH");
			if(pathenv("SCM_COMORREV_DATE"))
				$description .= " date:".pathenv("SCM_COMORREV_DATE");
			$pname = basename($argv[2],".".pathinfo($argv[2], PATHINFO_EXTENSION));
			if($pname != $proot)
				$pname = $proot.":".$pname;
			if(is_file($argv[2])){
				$cmd = pathenv("BIN_VERPATCH")." ".$argv[2]." \"".$current["file"]."\" /va".$rpdb." /high /pv \"".$current["product"]."\" /s description \"".$description."\" /s product \"".$pname."\" /s LegalTrademarks \"".pathenv("SCM_URL")."\" /s LegalCopyright \"https://github.com/nono303/win-build-scripts\"";
				if(DEBUG || pathenv("CUR_DEBUG") == 1){
					echo $cmd.PHP_EOL;
				} else {
					echo "[version] '".$current["product"]."' ".$argv[2]." (".str_replace("/","\\",$current["from"]).")".PHP_EOL;
				}
				passthru($cmd);
			} else {
				echo "[version] ERROR: ".$argv[2]." doesn't exist".PHP_EOL;
				exit(-1);
			}
		} else {
			echo "version.php '".$argv[1]."' '".$argv[2]."': '".PATH_SRC."/".$argv[1]."' doesn't exist".PHP_EOL;
			exit(-1);
		}
	} else {
		echo
			"Bad usage:".PHP_EOL.
			"no params: export current version of all src modules to a csv file in %PATH_LOG%".PHP_EOL.
			"version.php [src_module] [file_to_patch] patch 'file_to_patch' with version of 'src_module'".PHP_EOL;
		exit(-1);
	}
?>