/usr/bin/find $1 -type f -name "*.vcxproj" -exec sed -i 's/<\/ClCompile>/<WholeProgramOptimization>true<\/WholeProgramOptimization><MultiProcessorCompilation>true<\/MultiProcessorCompilation>'$2'<\/ClCompile>/g' {} \;
/usr/bin/find $1 -type f -name "*.vcxproj" -exec sed -i 's/<\/Link>/<LinkTimeCodeGeneration>UseLinkTimeCodeGeneration<\/LinkTimeCodeGeneration><\/Link>/g' {} \;