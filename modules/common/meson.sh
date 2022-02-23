avx=$(echo $1| sed 's#/#\\/#g')
# LINK FLAGS (dll exe)
sed -i -E 's/release" "\/nologo/OPT:REF,ICF/g' $2/build.ninja
# LINK FLAGS (lib)
sed -i -E 's/LINK_ARGS =/LINK_ARGS = "\/LTCG"/g' $2/build.ninja
# C & C++ FLAGS
# warn
sed -i -E 's/ "-wd[0-9]{4}"//g' $2/build.ninja
sed -i 's/\/W3/\/w/g' $2/build.ninja
# add quote for AVX - https://www.cyberciti.biz/faq/unix-linux-bash-script-check-if-variable-is-empty/
[ ! -z "$avx" ] && avx="\"$avx\""
# opti
sed -i 's/ "\/Zi" / "\/O2" "\/Zf" "\/Zi" "\/FS" "\/GL" "\/MP'$3'" '$avx' "\/DWIN32" "\/D_WINDOWS" "\/DNDEBUG" /g' $2/build.ninja
# found		"/MD" "/nologo" "/showIncludes" "/W3" "/O2" "/Zi"
# result	"/MD" "/nologo" "/showIncludes" "/W3" "/O2" "/Zf" "/Zi" "/FS" "/GL" "/MP16" "/arch:AVX" "/DWIN32" "/D_WINDOWS" "/DNDEBUG"
