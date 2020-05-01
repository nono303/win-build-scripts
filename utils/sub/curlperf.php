<?php
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
$response = curl_exec($ch);
$opt = curl_getinfo($ch);
curl_close($ch);
echo "   time_namelookup  ".$opt["namelookup_time_us"].PHP_EOL;
echo "      time_connect  ".$opt["connect_time_us"].PHP_EOL;
echo "   time_appconnect  ".$opt["appconnect_time_us"].PHP_EOL;
echo "  time_pretransfer  ".$opt["pretransfer_time_us"].PHP_EOL;
echo "     time_redirect  ".$opt["redirect_time_us"].PHP_EOL;
echo "time_starttransfer  ".$opt["starttransfer_time_us"].PHP_EOL;
echo "              ----------".PHP_EOL;
echo "        time_total  ".$opt["total_time_us"].PHP_EOL;
?>