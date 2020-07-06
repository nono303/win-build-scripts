@echo off
set BININFO_LOG=%PATH_LOGS%\%1_%MSVC_DEPS%-%ARCH%%AVXB%_%ymdhis%.csv
call do_php %PATH_UTILS%\sub\%1.php %PATH_INSTALL%\bin %BININFO_LOG:\=/% %2 %3 nb:154
call do_php %PATH_UTILS%\sub\%1.php %PATH_RELEASE_SVN%\%MSVC_DEPS%\%ARCH%%AVXB% %BININFO_LOG:\=/% %2 %3 nb:61
	REM !! TMP (nts ts)
for %%E in (nts) do (call do_php %PATH_UTILS%\sub\%1.php %PATH_RELEASE_PHP%\%MSVC_DEPS%-%ARCH%%AVXB%-%%E  %BININFO_LOG:\=/% %2 %3 nb:30)