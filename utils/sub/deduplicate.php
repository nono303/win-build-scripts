<?php
	define("DEBUG",false);
	
	include_once("_functions.php");
	
	if(DEBUG) print_r($argv);
	if(DEBUG) echo $argv[1].PHP_EOL;
	$env = pathenv($argv[1]);
	if(DEBUG) echo $env.PHP_EOL;
	$enva = explode(";",$env);
	$size['init'] = sizeof($enva);
	if(DEBUG) print_r($enva);
	
	// remove empty
	$enva = array_filter($enva);
	$size['empty'] = sizeof($enva);
	if(DEBUG) print_r($enva);
	
	// fix path
	$enva = array_map(function($v) {return str_replace("//","/",$v);},$enva);
	
	// remove duplicate
	$enva = array_unique($enva,SORT_STRING);
	$size['dedup'] = sizeof($enva);
	if(DEBUG) print_r($enva);
	
	if(DEBUG) echo "[".implode(" > ",$size)."]";
	// implode
	$env = implode(";",$enva);
	echo trim($env);
?>