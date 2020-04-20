sed -i 's/<\/Link>/<OutputFile>$(OutDir)'$2'.lib<\/OutputFile><\/Link><Lib><OutputFile>$(OutDir)'$2'.lib<\/OutputFile><\/Lib>/g' $1
sed -i 's/<ClCompile>/<ClCompile><ProgramDataBaseFileName>$(OutDir)'$2'.pdb<\/ProgramDataBaseFileName>/g' $1
sed -i 's/<OutDir>/<TargetName>'$2'<\/TargetName><OutDir>/g' $1