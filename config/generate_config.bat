c:\cyg32\bin\cygcheck.exe -c -d | sed -e "1,2d" -e 's/ .*\$//' > cyg32.packagelist
c:\cyg64\bin\cygcheck.exe -c -d | sed -e "1,2d" -e 's/ .*\$//' > cyg64.packagelist
"C:\Program Files (x86)\Microsoft Visual Studio\Installer\vs_installer.exe" export --installPath "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community" --config "C:\httpd-sdk\config\.vsconfig"
pause