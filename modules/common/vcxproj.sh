link="<EnableCOMDATFolding>true<\/EnableCOMDATFolding><OptimizeReferences>true<\/OptimizeReferences>"
for i in `/usr/bin/find $1 -type f -name "*.vcxproj" 2>/dev/null` 
do
  sed -i 's/<\/ClCompile>/<Optimization>MaxSpeed<\/Optimization><WholeProgramOptimization>true<\/WholeProgramOptimization><MultiProcessorCompilation>true<\/MultiProcessorCompilation>'$2'<\/ClCompile>/g' $i
  sed -i 's/<\/Link>/'$link'<LinkTimeCodeGeneration>UseLinkTimeCodeGeneration<\/LinkTimeCodeGeneration><\/Link>/g' $i
  sed -i 's/<\/Lib>/'$link'<LinkTimeCodeGeneration>true<\/LinkTimeCodeGeneration><\/Lib>/g' $i
  sed -i -E 's/<PlatformToolset>v[^<]+/<PlatformToolset>v'$3'/g' $i
  sed -i -E 's/<Optimization>[^<]+/<Optimization>MaxSpeed/g' $i
  if grep "WindowsTargetPlatformVersion" $i > /dev/null
    then
     sed -i -E 's/<WindowsTargetPlatformVersion>[^<]+/<WindowsTargetPlatformVersion>'$4'/g' $i
    else
     sed -i 's/<\/RootNamespace>/<\/RootNamespace><WindowsTargetPlatformVersion>'$4'<\/WindowsTargetPlatformVersion>/g' $i
  fi
done
/usr/bin/find $1 -type f -name "*.props" -exec sed -i 's/<LinkTimeCodeGeneration>false<\/LinkTimeCodeGeneration>/'$link'<LinkTimeCodeGeneration>true<\/LinkTimeCodeGeneration>/g' {} \;