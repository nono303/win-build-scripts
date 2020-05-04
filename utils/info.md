https://www.robvanderwoude.com/battech_inputvalidation_commandline.php
https://stackoverflow.com/questions/9102422/windows-batch-set-inside-if-not-working
https://useurmind.de/rokuby/Rokuby/VsProjectConfiguration.html
https://docs.microsoft.com/en-us/cpp/build/reference/pdbaltpath-use-alternate-pdb-path?redirectedfrom=MSDN&view=vs-2019
https://docs.microsoft.com/fr-fr/dotnet/framework/tools/mage-exe-manifest-generation-and-editing-tool
https://msdn.microsoft.com/fr-fr/library/afyyse50.aspx nmake
https://github.com/MicrosoftDocs/visualstudio-docs/blob/master/docs/msbuild/msbuild-command-line-reference.md msbuild
B:\bin\dependencies\Dependencies.exe -imports libcurl.dll | grep dll  
c:\bin\wscc_sysinternals\sigcheck.exe -a -c jpegtran.exe
https://ss64.com/nt/delayedexpansion.html
https://stackoverflow.com/questions/4283312/batch-file-asks-for-file-or-folder
	xcopy /C /F /Y 
	fichier : avec * fin de cible : \newmane.ext* ou \* si meme nom
	repertoires : pas de backslash source et backslash destination xcopy  /C /F /Y %SRC% %DEST%\
	/E : recursif
https://stackoverflow.com/questions/54664134/cannot-compile-unknown-flag-pdbrpc-in-p2 old freetype vcxproj
https://docs.microsoft.com/en-us/visualstudio/msbuild/cl-task?view=vs-2019 options cl [CL /?]

for /f %%i in ('FINDSTR /C:"AM_INIT" %PATH_SRC%\%1\configure.ac') do for /F "tokens=1,2,3 delims=,\)" %%a in ("%%i") do set VERSION=%%b
git config --global apply.whitespace nowarn
git config --global core.autocrlf false