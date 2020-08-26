<?php
	include_once"nono\\dirContent.php";

	$verf = "4.0.5.2";
	$commit = "baec8a2";
	$pr = "pr71";

	$ver = $verf;
	$lc = $verf;
	if($commit){
		$ver .= "-".$commit;
		$lc .= " commit ".$commit;
	}
	if($pr){
		$ver .= "-".$pr;
		$lc .= " with ".$pr;
	}

	foreach(array_merge(dirContent::scan($dirs = "D:\\github\\NONO_PHP7-memcache-dll\\vc15", ["dll"], true) ,dirContent::scan($dirs = "D:\\github\\NONO_PHP7-memcache-dll\\vs16", ["dll"], true)) as $file){
		$val = explode("\\",$file);
		//echo sizeof($val)."\t".print_r($val,true).PHP_EOL;
		if(sizeof($val) == 8){
			$avx = " ".$val[6]." ";
			$pvi = 7;
		} elseif(sizeof($val) == 7){
			$avx = "";
			$pvi = 6;
		}
		$phpver = substr($val[$pvi],4,3);
		$msvc = $val[3];
		$arch = $val[4];
		$thread = $val[5];
/*
		echo "msvc:   ".$msvc.PHP_EOL;
		echo "arch:   ".$arch.PHP_EOL;
		echo "thread: ".$thread.PHP_EOL;
		echo "avx:    ".$avx.PHP_EOL;
		echo "phpver: ".$phpver.PHP_EOL;
*/
		$cmd = 'c:\sdk\softs\verpatch.exe '.$file.' /high '.$ver.' /pv '.$phpver.' /rpdb /s desc "pecl-memcache for PHP '.$phpver.' '.$msvc.' '.$arch.$avx.$thread.'" /s product "PHP" /s OriginalFilename "php_memcache.dll" /s InternalName "php_memcache.dll" /s LegalCopyright "release: https://github.com/nono303/PHP7-memcache-dll '.$lc.' src: https://github.com/websupport-sk/pecl-memcache"';
		echo $cmd.PHP_EOL;
		$msvc = null;
		$arch = null;
		$thread = null;
		$cmd= null;
		$avx = null;
		$phpver = null;
		$val = null;
	}
// 
?>