/usr/bin/find /cygdrive/c/src/libiconv/MSVC15/ -type f -name "*.vcxproj" -exec sed -i 's/<Keyword>Win32Proj<\/Keyword>/<Keyword>Win32Proj<\/Keyword><WindowsTargetPlatformVersion>10.0.18362.0<\/WindowsTargetPlatformVersion>/g' {} \; 