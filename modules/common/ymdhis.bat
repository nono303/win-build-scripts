@echo off
set ymdhis=%Date:~-4%-%Date:~-7,-5%-%Date:~-10,-8%_%TIME:~-11,-9%-%TIME:~-8,-6%-%TIME:~-5,-3%
set ymdhis=%ymdhis: =0%