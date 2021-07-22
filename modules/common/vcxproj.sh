link="<EnableCOMDATFolding>true<\/EnableCOMDATFolding><OptimizeReferences>true<\/OptimizeReferences>"
for i in `/usr/bin/find $1 -type f -name "*.vcxproj" 2>/dev/null` 
do
  sed -i -E 's/<PlatformToolset>[^<]+/<VCToolsVersion>'$5'<\/VCToolsVersion><PlatformToolset>v'$3'/g' $i
  sed -i -E 's/<WindowsTargetPlatformVersion>[^<]+/<WindowsTargetPlatformVersion>v'$4'/g' $i
  sed -i -E 's/<Optimization>[^<]+/<Optimization>MaxSpeed/g' $i
  sed -i 's/<\/ClCompile>/<Optimization>MaxSpeed<\/Optimization><WholeProgramOptimization>true<\/WholeProgramOptimization><MultiProcessorCompilation>true<\/MultiProcessorCompilation>'$2'<\/ClCompile>/g' $i
  sed -i 's/<\/Link>/'$link'<LinkTimeCodeGeneration>UseLinkTimeCodeGeneration<\/LinkTimeCodeGeneration><\/Link>/g' $i
  sed -i 's/<\/Lib>/'$link'<LinkTimeCodeGeneration>true<\/LinkTimeCodeGeneration><\/Lib>/g' $i
done
/usr/bin/find $1 -type f -name "*.props" -exec sed -i 's/<LinkTimeCodeGeneration>false<\/LinkTimeCodeGeneration>/'$link'<LinkTimeCodeGeneration>true<\/LinkTimeCodeGeneration>/g' {} \;