for %%D in (%PATH_BUILD% %PATH_INSTALL%) do (
	if exist %%D\. rmdir /S /Q %%D
	mkdir %%D
)
for %%s in (lib bin include) do (if not exist %PATH_INSTALL%\%%s\. mkdir %PATH_INSTALL%\%%s)