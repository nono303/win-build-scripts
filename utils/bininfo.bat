@echo off
set BININFO_LOG=%PATH_LOGS%\%1_%MSVC_DEPS%-%ARCH%%AVXB%_%ymdhis%.csv
if %QUIC_BUILD% == 1 (
	set NBBIN=256
) else (
	set NBBIN=250
)
if exist %2\. (
	call do_php %PATH_UTILS%\sub\%1.php %2 %BININFO_LOG:\=/% %2 %3 %4 %5 %6 %7 %8
) else (
	set BININFO_LOG=%PATH_LOGS%\%1_%MSVC_DEPS%-%ARCH%%AVXB%_%ymdhis%.csv
	call do_php %PATH_UTILS%\sub\%1.php %PATH_INSTALL%\bin %BININFO_LOG:\=/% %2 %3 nb:%NBBIN% %4 %5 %6 %7
	call do_php %PATH_UTILS%\sub\%1.php %PATH_INSTALL%\bin\iconv %BININFO_LOG:\=/% %2 %3 nb:426 %4 %5 %6 %7
	call do_php %PATH_UTILS%\sub\%1.php %PATH_INSTALL%\modules %BININFO_LOG:\=/% %2 %3 nb:258 %4 %5 %6 %7
	call do_php %PATH_UTILS%\sub\%1.php %PATH_RELEASE_SVN%\%MSVC_DEPS%\%ARCH%%AVXB% %BININFO_LOG:\=/% %2 %3 nb:61 %4 %5 %6 %7
		REM !! TMP (nts ts)
	for %%E in (nts) do (call do_php %PATH_UTILS%\sub\%1.php %PATH_INSTALL%\_php-%%E %BININFO_LOG:\=/% %2 %3 nb:86 %4 %5 %6 %7)
	call do_php %PATH_UTILS%\sub\%1.php %PATH_INSTALL%\_proj\bin %BININFO_LOG:\=/% %2 %3 nb:20 %4 %5 %6 %7
	call do_php %PATH_UTILS%\sub\%1.php %PATH_INSTALL%\_geographiclib\bin %BININFO_LOG:\=/% %2 %3 nb:22 %4 %5 %6 %7
)