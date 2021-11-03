# LINK FLAGS (dll exe)
sed -i -E 's/release" "\/nologo/OPT:REF,ICF/g' $2/build.ninja
# LINK FLAGS (lib)
sed -i -E 's/LINK_ARGS =/LINK_ARGS = "\/LTCG"/g' $2/build.ninja
# C & C++ FLAGS
# warn
sed -i -E 's/ "-wd[0-9]{4}"//g' $2/build.ninja
sed -i 's/\/W3/\/w/g' $2/build.ninja
# opti
sed -i 's/ "\/Zi" / "\/Zi" "\/GL" "\/MP'$3'" "'$1'" "\/DWIN32" "\/D_WINDOWS" "\/DNDEBUG" /g' $2/build.ninja
# found		"/MD" "/nologo" "/showIncludes" "/W3" "/O2" "/Zi"
# result	"/MD" "/nologo" "/showIncludes" "/W3" "/O2" "/Zi" "/GL" "/MP16" "/arch:AVX" "/DWIN32" "/D_WINDOWS" "/DNDEBUG"