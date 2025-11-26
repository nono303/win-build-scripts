<?php
/*
		enabled:  dependencies icu jemalloc libiconv libsodium nssm subversion verpatch
		disabled: libxpm
*/
	# https://stackoverflow.com/a/54325258
	function rsearch($folder, $pattern) {
		$dir = new RecursiveDirectoryIterator($folder);
		$ite = new RecursiveIteratorIterator($dir);
		$files = new RegexIterator($ite, $pattern, RegexIterator::MATCH);
		foreach($files as $file)
			 yield $file->getPathName();
	}
	// print_r($argv);
/*
    [0] => C:\sdk\batch\modules\common/msbuild.php
    [1] => /cygdrive/c/sdk/src/libiconv/build-VS2022/libiconv
    [2] => AdvancedVectorExtensions2
    [3] => 145
    [4] => 10.0.26100.0
    [5] => 14.50.35717
    [6] => 4.8
    [7] => nostd
*/
	$std = (array_key_exists(7,$argv) && $argv[7] == "nostd") ? "" : 
		"<LanguageStandard>stdcpplatest</LanguageStandard><LanguageStandard_C>stdclatest</LanguageStandard_C>";
	$link = 
		"<EnableCOMDATFolding>true</EnableCOMDATFolding><OptimizeReferences>true</OptimizeReferences>";
	
	$removes = [
		/* Task */		"CodeAnalysisRuleSet",
		/* MSVC */		"VCToolsVersion",
		/* ClCompile */	"InlineFunctionExpansion", "Optimization", "WarningLevel", "WholeProgramOptimization", "FunctionLevelLinking", "DebugInformationFormat", "MultiProcessorCompilation", "SDLCheck","EnableEnhancedInstructionSet",
		/* Link Lib */	"LinkIncremental", "LinkTimeCodeGeneration", "EnableCOMDATFolding", "GenerateDebugInformation", "OptimizeReferences",
	];
	$replaces = [
		/* MSVC */
			"<PlatformToolset>[^<]+" => "<VCToolsVersion>".$argv[5]."</VCToolsVersion><PlatformToolset>v".$argv[3],
		/* Windows Kit */
			"<WindowsTargetPlatformVersion>[^<]+" => "<WindowsTargetPlatformVersion>".$argv[4],
		/* .NET */
			"<TargetFrameworkVersion>[^<]+" => "<TargetFrameworkVersion>v".$argv[6],
			"NETFramework,Version=[^\"]+" => "NETFramework,Version=v".$argv[6],
		/* C CXX Flags */
			"<\/ClCompile>" =>  $std."
			  <EnableEnhancedInstructionSet>".$argv[2]."</EnableEnhancedInstructionSet>
			  <Optimization>MaxSpeed</Optimization>
			  <WarningLevel>TurnOffAllWarnings</WarningLevel>
			  <WholeProgramOptimization>true</WholeProgramOptimization>
			  <MultiProcessorCompilation>true</MultiProcessorCompilation>
			  <FunctionLevelLinking>true</FunctionLevelLinking>
			  <DebugInformationFormat>ProgramDatabase</DebugInformationFormat>
			</ClCompile>",
			"<RuntimeLibrary>[^<]+" => "<RuntimeLibrary>MultiThreadedDLL",
			"<AdditionalOptions>" => "<AdditionalOptions>/Zc:inline /FS /Zf /Gw /Ob3 /cgthreads8 ",
		/* Link */
			"<\/Link>" => $link."
			  <GenerateDebugInformation>true</GenerateDebugInformation>
			  <LinkTimeCodeGeneration>UseLinkTimeCodeGeneration</LinkTimeCodeGeneration>
			</Link>",
		/* Lib */
			"<\/Lib>" => $link."
			  <LinkTimeCodeGeneration>true</LinkTimeCodeGeneration>
			</Lib>",
	];
	/* files */
	$files = [];
	foreach(explode(";",$argv[1]) as $path)
		$files += iterator_to_array(rsearch($path,"/\.(props|vcxproj|config|csproj)$/i"));
	/* replace */
	foreach($files as $file){
		$in = file_get_contents($file);
		echo "    > patch ".realpath($file).PHP_EOL;
		/* remove */
		foreach($removes as $remove)
			$in = preg_replace("/<".$remove.">[^<]+<\/".$remove.">/","",$in);
		if(!array_key_exists(7,$argv)){
			$in = preg_replace("/<LanguageStandard>[^<]+<\/LanguageStandard>/","",$in);
			$in = preg_replace("/<LanguageStandard_C>[^<]+<\/LanguageStandard_C>/","",$in);
		}
		/* add */
		foreach($replaces as $from => $to)
			$in = preg_replace("/".$from."/",$to,$in);
		/* format */
		$doc = new DOMDocument();
		$doc->preserveWhiteSpace = false;
		$doc->formatOutput = true;
		if (@$doc->loadXML($in) === false)
			throw new Exception(json_encode(libxml_get_last_error(), JSON_PRETTY_PRINT | JSON_THROW_ON_ERROR | JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE));
		$out = $doc->saveXML();
		/* write */
		file_put_contents($file,$out);
	}
?>