@echo off && call %PATH_MODULES_COMMON%\init.bat %1

set VCDIR=msvc/vs22
sed -i 's/mpir^<\/TargetName^>/mpir_static^<\/TargetName^>/g' %PATH_SRC%/%1/%VCDIR%/lib_mpir_gc/lib_mpir_gc.vcxproj

for %%Y in (dll_mpir_gc lib_mpir_gc) do (
	%PATH_BIN_CYGWIN%\bash %PATH_MODULES_COMMON%/vcxproj.sh "%CYGPATH_SRC%/%1/%VCDIR%/%%Y" %AVXVCX% %PTFTS% %WKITVER% %VCTOOLSVER% %DOTNETVER%
	MSBuild.exe %PATH_SRC%\%1\%VCDIR%\%%Y\%%Y.vcxproj ^
		%MSBUILD_OPTS% ^
		/p:Configuration=Release ^
		/p:Platform=%archmsbuild%
	
)
for %%X in (gmp-impl.h gmp-mparam.h gmp.h gmpxx.h longlong.h mpir.h mpirxx.h) do (for /F "delims=" %%I in ('dir /a:-D /s /b %PATH_SRC%\%1\%VCDIR:/=\%\%%X') do (xcopy /C /F /Y %%I %PATH_INSTALL%\include\*))
for %%X in (mpir.dll mpir.pdb) do (for /F "delims=" %%I in ('dir /a:-D /s /b %PATH_SRC%\%1\%VCDIR:/=\%\%%X') do (xcopy /C /F /Y %%I %PATH_INSTALL%\bin\*))
for %%X in (mpir.lib mpir_static.lib mpir_static.pdb) do (for /F "delims=" %%I in ('dir /a:-D /s /b %PATH_SRC%\%1\%VCDIR:/=\%\%%X') do (xcopy /C /F /Y %%I %PATH_INSTALL%\lib\*))
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\mpir.dll

