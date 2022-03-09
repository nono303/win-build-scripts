@echo off
for %%D in (%PATH_BUILD% %PATH_INSTALL%) do (
	if exist %%D\. rmdir /S /Q %%D
	mkdir %%D
)
	REM iso avx.bat l.33
for %%s in (lib bin include %DIR_LIB_UNUSED%) do (mkdir %PATH_INSTALL%\%%s)