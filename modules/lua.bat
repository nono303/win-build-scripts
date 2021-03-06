call %PATH_MODULES_COMMON%\init.bat %1
call cl /w /MD /Zi /O2 /GL /MD /Zi /MP16 %AVX% /DNDEBUG /c /DLUA_BUILD_AS_DLL ^
lutf8lib.c ^
lvm.c ^
lzio.c ^
lundump.c ^
ltests.c ^
ltm.c ^
lua.c ^
lstrlib.c ^
ltable.c ^
ltablib.c ^
lstate.c ^
lstring.c ^
loslib.c ^
lparser.c ^
loadlib.c ^
lobject.c ^
lopcodes.c ^
lmathlib.c ^
lmem.c ^
linit.c ^
liolib.c ^
llex.c ^
ldump.c ^
lfunc.c ^
lgc.c ^
ldblib.c ^
ldebug.c ^
ldo.c ^
lcode.c ^
lcorolib.c ^
lctype.c ^
lapi.c ^
lauxlib.c ^
lbaselib.c

ren lua.obj lua.o

link /LTCG /OPT:REF,ICF /DEBUG /DLL /IMPLIB:liblua.lib	/OUT:liblua.dll *.obj
link /LTCG /OPT:REF,ICF /DEBUG				/OUT:lua.exe lua.o liblua.lib
lib  /LTCG						/OUT:liblua_static.lib *.obj

del *.obj
del *.exp
del *.o


for %%X in (liblua.dll lua.exe liblua.pdb lua.pdb) do (xcopy /C /F /Y %PATH_SRC%\%1\%%X %PATH_INSTALL%\bin\*)
for %%X in (liblua.lib liblua_static.lib) do (xcopy /C /F /Y %PATH_SRC%\%1\%%X %PATH_INSTALL%\lib\*)
for %%X in (lualib.h luaconf.h lua.h lauxlib.h) do (xcopy /C /F /Y %PATH_SRC%\%1\%%X %PATH_INSTALL%\include\*)
for %%X in (liblua.dll lua.exe) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X)
