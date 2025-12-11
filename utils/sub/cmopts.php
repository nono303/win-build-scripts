<?php
		function color($status){
			$display = str_pad($status,8);
			switch($status){
				case "OK":
					return "\033[32m".$display."\033[39m";
				case "UNKNOWN":
					return "\033[31m".$display."\033[39m";
				case "NOTSET":
					return "\033[33m".$display."\033[39m";
			}
		}

		$getc = false;
		foreach(explode("\n",file_get_contents($argv[2])) as $line){
			if(str_contains($line,"cmake -LAH")){
				foreach(preg_split("/[ \t]+-D?/",explode("cmake -LAH",$line)[1]) as $arg) {
					$arg = trim($arg);
					if(!str_starts_with($arg,"CMAKE_") && str_contains($arg,"=")) {
						$t = explode("=",$arg);
						$cur[$t[0]] = $t[1];
					}
				}
				// remove src dir on last item
				$cur[$t[0]] = trim(explode($_ENV["PATH_SRC"],$cur[$t[0]])[0]);
			} elseif($line == "-- Cache values"){
				$getc = true;
			} elseif($getc && $line && str_starts_with($line,"// ")) {
				$comment = str_replace("// ","",$line);
			} elseif($getc && $line && !str_starts_with($line,"CMAKE_") && !str_contains($line,"==")) {
				preg_match("/^([^:]+):([^=]+)=(.*)$/",$line,$matches);
				if(array_key_exists(1,$matches) && array_key_exists(2,$matches) && array_key_exists(3,$matches)) {
					$ret[$matches[1]] = [
						"type" => $matches[2],
						"value" => $matches[3],
						"comment" => $comment
					];
					$comment = "";
				}
			}
		}
		foreach($cur as $k => $v){
			$res[$k]["key"] = $k;
			$res[$k]["value"] = $v;
			if(array_key_exists($k,$ret)) {
				$res[$k]["status"] = "OK";
				$res[$k]["comment"] = $ret[$k]["comment"] ?: null;
				unset($ret[$k]);
			} else {
				$res[$k]["status"]= "UNKNOWN";
			}
		}
		foreach($ret as $k => $v){
			$res[$k]["key"] = $k;
			$res[$k]["value"] = $v["value"];
			$res[$k]["comment"] = $ret[$k]["comment"] ?: null;
			$res[$k]["status"] = "NOTSET";
		}
		$csv = "";
		foreach($res as $k => $v){
			if(!preg_match('(_INCLUDE_DIR|_LIBRARY|_INSTALL_BIN_DIR|_INSTALL_LIB_DIR)', $k) && ! in_array($k,["PKG_CONFIG_ARGN"]))
				echo
					color($v["status"]).
					str_pad("-D".$v["key"]."=".$v["value"],80).
					(array_key_exists("comment",$v) ? "// ".$v["comment"] : "").PHP_EOL;
			$csv .= $v["status"].";"."-D".$v["key"]."=".$v["value"].(array_key_exists("comment",$v) ? ";".$v["comment"] : "").PHP_EOL;
		}
		file_put_contents($fn = $_ENV["PATH_LOGS"]."/cmopts/".$argv[1].".csv",$csv);
		echo PHP_EOL."> writing ".realpath($fn).PHP_EOL;
?>