@echo off
set ymdhis=%Date%_%TIME:~-11,-9%-%TIME:~-8,-6%-%TIME:~-5,-3%
set ymdhis=%ymdhis: =0%
pause