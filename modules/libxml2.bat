@echo off && call %PATH_MODULES_COMMON%\init.bat %1

	REM libxml2_a_dll MUST be used for PHP https://wiki.php.net/internals/windows/libs/libxml2
sed -i 's/iconv.lib/libiconv\.lib/g'  %CYGPATH_SRC%/%1/win32/Makefile.msvc
sed -i 's/LDFLAGS = \/nologo/LDFLAGS = \/nologo \/LTCG \/OPT:ICF,REF \/DEBUG/g'  %CYGPATH_SRC%/%1/win32/Makefile.msvc
sed -i 's/ARFLAGS = \/nologo/ARFLAGS = \/nologo \/LTCG/g'  %CYGPATH_SRC%/%1/win32/Makefile.msvc
sed -i 's/Z7/Zi/g'  %CYGPATH_SRC%/%1/win32/Makefile.msvc
sed -i 's/rc -Fo/rc -nologo -Fo/g'  %CYGPATH_SRC%/%1/win32/Makefile.msvc
sed -i 's/libxmladll/libxml2_a_dll/g'  %CYGPATH_SRC%/%1/win32/Makefile.msvc
sed -i 's/libxmla/libxml2_a/g'  %CYGPATH_SRC%/%1/win32/Makefile.msvc
	REM https://externals.io/message/25641
REM sed -i -E 's/\/Fo(.)\(XML_INTDIR\)/\/D "LIBXML_STATIC_FOR_DLL" \/Fo\\1\(XML_INTDIR\)/g'  %CYGPATH_SRC%/%1/win32/Makefile.msvc

cd /D win32
for %%X in (libxml2_a_dll libxml) do (
	cscript /nologo /e:jscript configure.js ^
	trio=no ^
	threads=native ^
	ftp=yes ^
	http=yes ^
	html=yes ^
	c14n=yes ^
	catalog=yes ^
	xpath=yes ^
	xptr=yes ^
	xptr_locs=yes ^
	xinclude=yes ^
	iconv=yes ^
	icu=yes ^
	iso8859x=yes ^
	zlib=yes ^
	lzma=yes ^
	xml_debug=yes ^
	mem_debug=no ^
	run_debug=no ^
	regexps=yes ^
	modules=yes ^
	tree=yes ^
	reader=yes ^
	writer=yes ^
	walker=yes ^
	pattern=yes ^
	push=yes ^
	valid=yes ^
	sax1=yes ^
	legacy=yes ^
	output=yes ^
	schemas=yes ^
	schematron=yes ^
	python=no ^
	compiler=msvc ^
	cruntime="/wd4090 /wd4723 /wd4013 /D_WINSOCK_DEPRECATED_NO_WARNINGS /Zf /GL /MD /MP%NUMBER_OF_PROCESSORS% %AVX% /Fd%%X.pdb" ^
	vcmanifest=yes ^
	debug=yes ^
	static=no ^
	prefix=%PATH_INSTALL% ^
	include=%PATH_INSTALL%\include ^
	lib=%PATH_INSTALL%\lib

	nmake %NMAKE_OPTS% /f Makefile.msvc %%X
)

if not exist %PATH_INSTALL%\include\libxml2\libxml\. md %PATH_INSTALL%\include\libxml2\libxml\
xcopy /C /F /Y %PATH_SRC%\%1\include\libxml\*.h %PATH_INSTALL%\include\libxml2\libxml\*
for %%X in (dll pdb) do (xcopy /C /F /Y %PATH_SRC%\%1\win32\bin.msvc\libxml2.%%X %PATH_INSTALL%\bin\*)
for %%X in (win32\libxml2_a_dll.pdb win32\bin.msvc\libxml2.lib win32\bin.msvc\libxml2_a_dll.lib) do (xcopy /C /F /Y %PATH_SRC%\%1\%%X %PATH_INSTALL%\lib\*)
call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\libxml2.dll