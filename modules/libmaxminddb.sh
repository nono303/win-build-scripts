link="<EnableCOMDATFolding>true<\/EnableCOMDATFolding><OptimizeReferences>true<\/OptimizeReferences>"
for i in `/usr/bin/find $1 -type f -name "*.vcxproj" -o -name "*.config" -o -name "*.csproj" -o -name "*.props" 2>/dev/null` 
do
  # MSVC
  sed -i -E 's/<PlatformToolset>[<]+/<VCToolsVersion>'$5'<\/VCToolsVersion><PlatformToolset>v'$3'/g' $i
  # Windows Kit
  sed -i -E 's/<WindowsTargetPlatformVersion>[<]+/<WindowsTargetPlatformVersion>'$4'/g' $i
  # C CXX Flags
  sed -i -E 's/<Optimization>[<]+/<Optimization>MaxSpeed/g' $i
  sed -i 's/<\/ClCompile>/<Optimization>MaxSpeed<\/Optimization><MultiProcessorCompilation>true<\/MultiProcessorCompilation>'$2'<\/ClCompile>/g' $i
done