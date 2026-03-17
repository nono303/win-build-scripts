<?php
	include( dirname(__FILE__) . '/_functions-version.php');

	const CYG_BUILDS = ["memcached", "sslh", "proxytunnel", "libconfig"];

	// arg to const
	foreach([
		"DEBUG"		=> "verbose",
		"NO_PDB"	=> "nopdb",
	] as $def => $argin) {
		define($def, in_array($argin, $argv) ? true : false);
		$argv = array_diff($argv, [$argin]);
		debug(str_pad($def.": ",12).(constant($def) ? "ON" : "OFF"));
	}
	// no args: generate MD (+cache) for all scr
	if(($nbargs = sizeof($argv)) == 1) {
		echo "* ".pathenv("PATH_VERSION_BUILD").($ret = cleanCache() ? " cleaned" : " unable to clear").PHP_EOL;
		$mdh = "| src | version |".PHP_EOL."| ---- | ---- |".PHP_EOL;
		echo
			str_pad("src",25).
			str_pad("file",		VERBOSE_PAD).
			str_pad("tag",		VERBOSE_PAD).
			str_pad("ltag",		VERBOSE_PAD).
			str_pad("commit",	VERBOSE_PAD).
			str_pad("branch",	VERBOSE_PAD).
			PHP_EOL;
		foreach(glob(($cur = PATH_SRC)."/*",GLOB_ONLYDIR) as $srcpath) {
			$src = basename($srcpath);
			try {
				$ret = getVersion($src, true);
				$md =
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
			} catch(Exception $e) {
				echo PHP_EOL."! ".$e->getMessage();
				$ret["product"] = "";
				$md = "| ".$src." | `".$e->getMessage()."` |".PHP_EOL;
			}
			$mdf .= $md;
			if(!in_array($src,OUT_RELEASE))
				$mdr .= $md;
			echo PHP_EOL;
		}
		file_put_contents($fn = pathenv("PATH_BATCH").'/SRC_VERSION.md',$mdh.$mdf);
		file_put_contents($fn = pathenv("PATH_BATCH").'/SRC_VERSION-release.md',$mdh.$mdr);
		echo PHP_EOL."> ".realpath($fn).exit(0);
	} else {
		if(is_dir($cur = PATH_SRC)."/".$argv[1]) {
			$current = getVersion($argv[1],DEBUG);
		} else {
			echo "version.php '".$argv[1]."' '".$argv[2]."': '".PATH_SRC."/".$argv[1]."' doesn't exist".PHP_EOL;
			exit(-1);
		}
	}

	debug(print_r($current, true));
	if($nbargs == 2) { // default: return product
		echo $current["product"];
		exit(0);
	} elseif($nbargs >= 3) {
		if($argv[2] == "env") { // export env var for init
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
		} else { // verpatch
			$rpdb = NO_PDB ? "" : " /rpdb"; // manage pdb
			// description
			$description = "arch:".(pathenv("ARCH") ?: pathenv("PHP_SDK_ARCH")).pathenv("AVXB");
			if(in_array($argv[1], CYG_BUILDS)) {
				$rpdb = "";
				preg_match("/ ([0-9\.]+) /",shell_exec("gcc --version"),$matches);
				$description .= " gcc:".$matches[1]; // gcc version
			} else {
				$description .= " vcver:".pathenv("vcvars_ver")."[".pathenv("MSVC_DEPS")."]"; // msvc version
			}
			// additionnal params
			if($argv[3]) {
				/*
					additionnal descritption. order:
						1. build:xxx	php
						2. proot:x.y.z	php, httpd
						3. ldeps:x.y.z	php, memcached, sslh
					ex.
						go version pecl-text-xdiff C:\sdk\release\vs18_x64-avx2\_php-ts\php_xdiff.dll build:ts php:8.5.4.1 lib:1.2.3 verbose
						go version memcached D:\github\NONO_memcached\libevent-2.1\x64\memcached-avx-tls.exe libevent:2.1 verbose
						go version sslh D:\github\NONO_sslh\x64\avx2\sslh-ev.exe libconfig:1.8.2 verbose
				*/
				for($i = 3; $i < $nbargs; $i++) {
					if(str_starts_with($argv[$i],"build")) {
						$descargv .= " ".$argv[$i];
					} else {
						if(!$proot) {
							$proot = explode(":",$argv[$i])[0]; // prefix product
							$descargv .= " (".$argv[$i];
						} else {
							$descargv .= " ".$argv[$i];
						}
					}
				}
				if($proot)
					$descargv .= ")";
				if(in_array($argv[1], CYG_BUILDS))
					$proot = "";
			}
			// tag
			if($current["scm"]["tag"]) {
				$description .= " tag:".$current["scm"]["tag"]["product"];
			} else {
				if(!is_null($current["scm"]["branch"]) && $current["scm"]["branch"] != "HEAD" && $current["scm"]["branch"] != "")
					$description .= " branch:".$current["scm"]["branch"];
				if($current["scm"]["commit"])
					$description .= " commit:".$current["scm"]["commit"];
			}
			if($current["scm"]["date"])
				$description .= " date:".$current["scm"]["date"];
			$pname = basename($argv[2],".".pathinfo($argv[2], PATHINFO_EXTENSION));
			if($proot)
				$pname = $proot.":".$pname;
			$cmd = pathenv("BIN_VERPATCH")." ".$argv[2]." \"".$current["file"]."\" /va".$rpdb." /high /pv \"".$current["product"]."\" /s description \"".$description.$descargv."\" /s product \"".$pname."\" /s LegalTrademarks \"".$current["scm"]["urls"]["origin"]."\" /s LegalCopyright \"https://github.com/nono303/win-build-scripts\"";
			if(DEBUG || pathenv("CUR_DEBUG") == 1) {
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