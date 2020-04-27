@echo off
set BININFO_LOG=%PATH_LOGS%\%1_%MSVC_DEPS%-%ARCH%%AVXB%_%ymdhis%.csv
call do_php %PATH_UTILS%\sub\%1.php %BININFO_LOG:\=/% %2 %3