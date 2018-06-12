if %ARCH% == x86 ( 

"C:\msvc15\MSBuild\15.0\Bin\MSBuild.exe" C:\php72-sdk\deps-buils\freetype\builds\windows\vc2017\freetype.sln /nowarn:C4267 /nowarn:C4244 /nowarn:C4702 /nowarn:C4312 /m:8 /t:Clean,freetype /p:Configuration=Release /p:DebugSymbols=true /p:DebugType=None /p:Platform="Win32"
copy /Y C:\php72-sdk\deps-buils\freetype\objs\vc2017\Win32\freetype_a.lib C:\php72-sdk\phpmaster\vc15\x86\deps\lib\freetype_a.lib
copy /Y C:\php72-sdk\deps-buils\freetype\objs\vc2017\Win32\freetype_a.pdb C:\php72-sdk\phpmaster\vc15\x86\deps\lib\freetype_a.pdb 

"C:\msvc15\MSBuild\15.0\Bin\MSBuild.exe" C:\php72-sdk\deps-buils\libiconv\MSVC15\libiconv.sln /nowarn:C4090 /nowarn:C4244 /nowarn:C4267 /nowarn:c4018 /nowarn:MSB8012 /m:8 /t:Clean,libiconv_static,libiconv_dll /p:Configuration=Release /p:DebugSymbols=true /p:DebugType=None /p:Platform="Win32"
copy /Y C:\php72-sdk\deps-buils\libiconv\MSVC15\Win32\libiconv_a.lib C:\php72-sdk\phpmaster\vc15\x86\deps\lib\libiconv_a.lib
copy /Y C:\php72-sdk\deps-buils\libiconv\MSVC15\Win32\libiconv_a.pdb C:\php72-sdk\phpmaster\vc15\x86\deps\lib\libiconv_a.pdb 
copy /Y C:\php72-sdk\deps-buils\libiconv\MSVC15\Win32\bin\libiconv.dll C:\php72-sdk\phpmaster\vc15\x86\deps\bin\libiconv.dll 
copy /Y C:\php72-sdk\deps-buils\libiconv\MSVC15\Win32\bin\libiconv.pdb C:\php72-sdk\phpmaster\vc15\x86\deps\bin\libiconv.pdb 

"C:\msvc15\MSBuild\15.0\Bin\MSBuild.exe" C:\php72-sdk\deps-buils\libxpm\windows\vc15\libxpm.sln /nowarn:C4018 /nowarn:C4244 /nowarn:C4267 /nowarn:C4311 /nowarn:C4312 /m:8 /t:Clean,libxpm /p:Configuration="Static Release" /p:DebugSymbols=true /p:DebugType=None /p:Platform="Win32"
copy /Y "C:\php72-sdk\deps-buils\libxpm\windows\builds\Win32\Static Release\libxpm_a.lib" C:\php72-sdk\phpmaster\vc15\x86\deps\lib\libxpm_a.lib
copy /Y "C:\php72-sdk\deps-buils\libxpm\windows\builds\Win32\Static Release\libxpm_a.pdb" C:\php72-sdk\phpmaster\vc15\x86\deps\lib\libxpm_a.pdb 

"C:\msvc15\MSBuild\15.0\Bin\MSBuild.exe" C:\php72-sdk\deps-buils\libpng\projects\vstudio2017\vstudio.sln /m:8 /t:Clean,libpng /p:Configuration="Release Library" /p:DebugSymbols=true /p:DebugType=None /p:Platform="Win32"
copy /Y "C:\php72-sdk\deps-buils\libpng\projects\vstudio2017\Release Library\libpng_a.lib" C:\php72-sdk\phpmaster\vc15\x86\deps\lib\libpng_a.lib
copy /Y "C:\php72-sdk\deps-buils\libpng\projects\vstudio2017\Release Library\libpng_a.pdb" C:\php72-sdk\phpmaster\vc15\x86\deps\lib\libpng_a.pdb 

"C:\msvc15\MSBuild\15.0\Bin\MSBuild.exe" C:\php72-sdk\deps-buils\libpng\projects\vstudio2017\vstudio.sln /m:8 /t:Clean,libpng /p:Configuration="Release" /p:DebugSymbols=true /p:DebugType=None /p:Platform="Win32"
copy /Y "C:\php72-sdk\deps-buils\libpng\projects\vstudio2017\Release\libpng.dll" C:\php72-sdk\phpmaster\vc15\x86\deps\bin\libpng.dll
copy /Y "C:\php72-sdk\deps-buils\libpng\projects\vstudio2017\Release\libpng.pdb" C:\php72-sdk\phpmaster\vc15\x86\deps\bin\libpng.pdb 

)
if %ARCH% == x64 (

"C:\msvc15\MSBuild\15.0\Bin\MSBuild.exe" C:\php72-sdk\deps-buils\freetype\builds\windows\vc2017\freetype.sln /nowarn:C4267 /nowarn:C4244 /nowarn:C4702 /nowarn:C4312 /m:8 /t:Clean,freetype /p:Configuration=Release /p:DebugSymbols=true /p:DebugType=None /p:Platform="x64"
copy /Y C:\php72-sdk\deps-buils\freetype\objs\vc2017\x64\freetype_a.lib C:\php72-sdk\phpmaster\vc15\x64\deps\lib\freetype_a.lib
copy /Y C:\php72-sdk\deps-buils\freetype\objs\vc2017\x64\freetype_a.pdb C:\php72-sdk\phpmaster\vc15\x64\deps\lib\freetype_a.pdb 

"C:\msvc15\MSBuild\15.0\Bin\MSBuild.exe" C:\php72-sdk\deps-buils\libiconv\MSVC15\libiconv.sln /nowarn:C4090 /nowarn:C4244 /nowarn:C4267 /nowarn:MSB8012 /m:8 /t:Clean,libiconv_static,libiconv_dll /p:Configuration=Release /p:DebugSymbols=true /p:DebugType=None /p:Platform="x64"
copy /Y C:\php72-sdk\deps-buils\libiconv\MSVC15\x64\libiconv_a.lib C:\php72-sdk\phpmaster\vc15\x64\deps\lib\libiconv_a.lib
copy /Y C:\php72-sdk\deps-buils\libiconv\MSVC15\x64\libiconv_a.pdb C:\php72-sdk\phpmaster\vc15\x64\deps\lib\libiconv_a.pdb 
copy /Y C:\php72-sdk\deps-buils\libiconv\MSVC15\x64\bin\libiconv.dll C:\php72-sdk\phpmaster\vc15\x64\deps\bin\libiconv.dll 
copy /Y C:\php72-sdk\deps-buils\libiconv\MSVC15\x64\bin\libiconv.pdb C:\php72-sdk\phpmaster\vc15\x64\deps\bin\libiconv.pdb 

"C:\msvc15\MSBuild\15.0\Bin\MSBuild.exe" C:\php72-sdk\deps-buils\libxpm\windows\vc15\libxpm.sln /nowarn:C4018 /nowarn:C4244 /nowarn:C4267 /nowarn:C4311 /nowarn:C4312 /m:8 /t:Clean,libxpm /p:Configuration="Static Release" /p:DebugSymbols=true /p:DebugType=None /p:Platform="x64"
copy /Y "C:\php72-sdk\deps-buils\libxpm\windows\builds\x64\Static Release\libxpm_a.lib" C:\php72-sdk\phpmaster\vc15\x64\deps\lib\libxpm_a.lib
copy /Y "C:\php72-sdk\deps-buils\libxpm\windows\builds\x64\Static Release\libxpm_a.pdb" C:\php72-sdk\phpmaster\vc15\x64\deps\lib\libxpm_a.pdb 

"C:\msvc15\MSBuild\15.0\Bin\MSBuild.exe" C:\php72-sdk\deps-buils\libpng\projects\vstudio2017\vstudio.sln /m:8 /t:Clean,libpng /p:Configuration="Release Library" /p:DebugSymbols=true /p:DebugType=None /p:Platform="x64"
copy /Y "C:\php72-sdk\deps-buils\libpng\projects\vstudio2017\x64\Release Library\libpng_a.lib" C:\php72-sdk\phpmaster\vc15\x64\deps\lib\libpng_a.lib
copy /Y "C:\php72-sdk\deps-buils\libpng\projects\vstudio2017\x64\Release Library\libpng_a.pdb" C:\php72-sdk\phpmaster\vc15\x64\deps\lib\libpng_a.pdb 

"C:\msvc15\MSBuild\15.0\Bin\MSBuild.exe" C:\php72-sdk\deps-buils\libpng\projects\vstudio2017\vstudio.sln /m:8 /t:Clean,libpng /p:Configuration="Release" /p:DebugSymbols=true /p:DebugType=None /p:Platform="x64"
copy /Y "C:\php72-sdk\deps-buils\libpng\projects\vstudio2017\x64\Release\libpng.dll" C:\php72-sdk\phpmaster\vc15\x64\deps\bin\libpng.dll
copy /Y "C:\php72-sdk\deps-buils\libpng\projects\vstudio2017\x64\Release\libpng.pdb" C:\php72-sdk\phpmaster\vc15\x64\deps\bin\libpng.pdb 

)