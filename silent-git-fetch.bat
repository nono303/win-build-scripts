echo off
call git-fetch.bat >> silent-logs\git-fetch.%Date:~-4%-%Date:~-7,-5%-%Date:~-10,-8%-%TIME:~-11,-9%-%TIME:~-8,-6%-%TIME:~-5,-3%.log 2>&1