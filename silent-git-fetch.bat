echo off
call ymdhis.bat
call do_php git-fetch.php 
REM >> silent-logs\git-fetch.%ymdhis%.log 2>&1