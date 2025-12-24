@echo off && call %PATH_MODULES_COMMON%\init.bat %1
call cl /nologo /c /DLUA_BUILD_AS_DLL /Fdliblua.pdb ^
/w ^
/Gw ^
/Gy ^
/Zc:inline ^
/O2 ^
/Ob3 ^
/Zf ^
/Zi ^
/FS ^
/GL ^
/MD ^
/MP%NUMBER_OF_PROCESSORS% ^
/cgthreads8 ^
%AVX% ^
/DNDEBUG ^
/std:clatest ^
lapi.c ^
lauxlib.c ^
lbaselib.c ^
lcode.c ^
lcorolib.c ^
lctype.c ^
ldblib.c ^
ldebug.c ^
ldo.c ^
ldump.c ^
lfunc.c ^
lgc.c ^
linit.c ^
liolib.c ^
llex.c ^
lmathlib.c ^
lmem.c ^
loadlib.c ^
lobject.c ^
lopcodes.c ^
loslib.c ^
lparser.c ^
lstate.c ^
lstring.c ^
lstrlib.c ^
ltable.c ^
ltablib.c ^
ltests.c ^
ltm.c ^
lua.c ^
lundump.c ^
lutf8lib.c ^
lvm.c ^
lzio.c

ren lua.obj lua.o

link /NOLOGO /LTCG /OPT:REF,ICF /DEBUG /DLL /IMPLIB:liblua.lib	/OUT:liblua.dll *.obj
link /NOLOGO /LTCG /OPT:REF,ICF /DEBUG				/OUT:lua.exe lua.o liblua.lib

for %%X in (obj exp o) do (rm -fv *.%%X)

for %%X in (liblua.dll lua.exe liblua.pdb lua.pdb) do (xcopy /C /F /Y %PATH_SRC%\%1\%%X %PATH_INSTALL%\bin\*)
xcopy /C /F /Y %PATH_SRC%\%1\liblua.lib %PATH_INSTALL%\lib\*
for %%X in (lualib.h luaconf.h lua.h lauxlib.h) do (xcopy /C /F /Y %PATH_SRC%\%1\%%X %PATH_INSTALL%\include\*)
for %%X in (liblua.dll lua.exe) do (call do_php %PATH_UTILS%\sub\version.php %1 %PATH_INSTALL%\bin\%%X)
