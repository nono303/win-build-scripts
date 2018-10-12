echo off
call ymdhis.bat
call C:\php72-sdk\bin\php\php.exe git-fetch.php 
REM >> silent-logs\git-fetch.%ymdhis%.log 2>&1