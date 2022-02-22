@echo off && call %PATH_MODULES_COMMON%\init.bat %1

cd /D win32
for %%X in (libxml_a_dll libxml_a) do (
	cscript /nologo /e:jscript configure.js ^
	trio=no ^
	threads=native ^
	ftp=yes ^
	http=yes ^
	html=yes ^
	c14n=yes ^
	catalog=yes ^
	docb=yes ^
	xpath=yes ^
	xptr=yes ^
	xinclude=yes ^
	iconv=yes ^
	icu=yes ^
	iso8859x=yes ^
	zlib=yes ^
	lzma=yes ^
	xml_debug=yes ^
	mem_debug=yes ^
	run_debug=yes ^
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
	cruntime="/wd4090 /wd4723 /D_WINSOCK_DEPRECATED_NO_WARNINGS /Zf /GL /MD /MP%NUMBER_OF_PROCESSORS% %AVX% /Fd%%X.pdb" ^
	vcmanifest=yes ^
	debug=yes ^
	static=no ^
	prefix=%PATH_INSTALL% ^
	include=%PATH_INSTALL%\include ^
	lib=%PATH_INSTALL%\lib

	sed -i 's/LDFLAGS = \/nologo/LDFLAGS = \/nologo \/LTCG \/OPT:ICF,REF \/DEBUG/g'  %CYGPATH_SRC%/%1/win32/Makefile
	sed -i 's/ARFLAGS = \/nologo/ARFLAGS = \/nologo \/LTCG/g'  %CYGPATH_SRC%/%1/win32/Makefile
	sed -i 's/Z7/Zi/g'  %CYGPATH_SRC%/%1/win32/Makefile
	sed -i 's/rc -Fo/rc -nologo -Fo/g'  %CYGPATH_SRC%/%1/win32/Makefile
	sed -i 's/libxmladll/libxml_a_dll/g'  %CYGPATH_SRC%/%1/win32/Makefile
	sed -i 's/libxmla/libxml_a/g'  %CYGPATH_SRC%/%1/win32/Makefile
		REM https://externals.io/message/25641
	REM sed -i -E 's/\/Fo(.)\(XML_INTDIR\)/\/D "LIBXML_STATIC_FOR_DLL" \/Fo\\1\(XML_INTDIR\)/g'  %CYGPATH_SRC%/%1/win32/Makefile
	nmake %NMAKE_OPTS% /f Makefile %%X
)

nmake %NMAKE_OPTS% /f Makefile install-dist
xcopy /C /F /Y %PATH_SRC%\%1\win32\bin.msvc\libxml2.pdb %PATH_INSTALL%\bin\*
for %%X in (libxml_a.pdb libxml_a_dll.pdb) do (xcopy /C /F /Y %PATH_SRC%\%1\win32\%%X %PATH_INSTALL%\lib\*)
for %%X in (libxml2.dll xmlcatalog.exe xmllint.exe) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X)