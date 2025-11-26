link="<EnableCOMDATFolding>true<\/EnableCOMDATFolding><OptimizeReferences>true<\/OptimizeReferences>"

# nssm jemalloc
[[ $7 != nostd ]] && std="<LanguageStandard>stdcpplatest<\/LanguageStandard><LanguageStandard_C>stdclatest<\/LanguageStandard_C>"

for i in `/usr/bin/find $1 -type f -name \*.vcxproj -o -name \*.config -o -name \*.csproj -o -name \*.props 2>/dev/null`
do
  echo $i
  # TASK
    # remove CodeAnalysisRuleSet
    # https://github.com/dotnet/msbuild/issues/5692
    sed -i -E 's/ *<CodeAnalysisRuleSet>[^<]+<\/CodeAnalysisRuleSet>//g' $i

  # MSVC
   sed -i -E 's/<PlatformToolset>[^<]+/<VCToolsVersion>'$5'<\/VCToolsVersion><PlatformToolset>v'$3'/g' $i

  # Windows Kit
   sed -i -E 's/<WindowsTargetPlatformVersion>[^<]+/<WindowsTargetPlatformVersion>'$4'/g' $i

  # .NET
    sed -i -E 's/<TargetFrameworkVersion>[^<]+/<TargetFrameworkVersion>v'$6'/g' $i
    sed -i -E 's/NETFramework,Version=[^"]+/NETFramework,Version=v'$6'/g' $i

  # C CXX Flags
    # remove
    for remove in InlineFunctionExpansion Optimization WarningLevel WholeProgramOptimization FunctionLevelLinking DebugInformationFormat MultiProcessorCompilation; do
      sed -i -E 's/<'$remove'>[^<]+<\/'$remove'>//g' $i
    done
    
    sed -i 's/<\/ClCompile>/  '$2'\
      '$std'\r\n\
      <Optimization>MaxSpeed<\/Optimization>\r\n\
      <WarningLevel>TurnOffAllWarnings<\/WarningLevel>\r\n\
      <WholeProgramOptimization>true<\/WholeProgramOptimization>\r\n\
      <MultiProcessorCompilation>true<\/MultiProcessorCompilation>\r\n\
      <FunctionLevelLinking>true<\/FunctionLevelLinking>\r\n\
      <DebugInformationFormat>ProgramDatabase<\/DebugInformationFormat>\r\n\
      <RuntimeLibrary>MultiThreadedDLL<\/RuntimeLibrary>\r\n\
      <AdditionalOptions>\/FS \/Zf \/Gw \/Ob3 \/cgthreads8 %(AdditionalOptions)<\/AdditionalOptions>\r\n\
    <\/ClCompile>/g' $i

  # LINK Flags
    # remove
    for remove in LinkIncremental LinkTimeCodeGeneration EnableCOMDATFolding TargetMachine GenerateDebugInformation; do
      sed -i -E 's/<'$remove'>[^<]+<\/'$remove'>//g' $i
    done

    sed -i 's/<\/Link>/  '$link'\r\n\
      <GenerateDebugInformation>true<\/GenerateDebugInformation>\r\n\
      <LinkTimeCodeGeneration>UseLinkTimeCodeGeneration<\/LinkTimeCodeGeneration>\r\n\
    <\/Link>/g' $i

  # LIB Flags
    sed -i 's/<\/Lib>/  '$link'\r\n\
      <LinkTimeCodeGeneration>true<\/LinkTimeCodeGeneration>\r\n\
      <TargetMachine>MachineX64<\/TargetMachine>\r\n\
    <\/Lib>/g' $i
 
  # CLEAN
    sed -i -r '/^\s*$/d' $i
  # /cygdrive/C/sdk/release/vs18_x64-avx2/bin/tidy.exe --show-warnings false -xml -i -q "$(cygpath -w $i)" --output-file "$(cygpath -w $i)"
done

# /usr/bin/find $1 -type f -name "*.props" -exec sed -i 's/<LinkTimeCodeGeneration>false<\/LinkTimeCodeGeneration>/'$link'<LinkTimeCodeGeneration>true<\/LinkTimeCodeGeneration><EnableCOMDATFolding>true<\/EnableCOMDATFolding><OptimizeReferences>true<\/OptimizeReferences>/g' {} \;