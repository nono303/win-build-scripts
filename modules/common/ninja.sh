for i in `/usr/bin/find $2 -type f -name "build.ninja" 2>/dev/null` 
do
  # LINK FLAGS (dll exe)
  sed -i 's/LINK_FLAGS = \/machine:X86 \/debug \/INCREMENTAL/LINK_FLAGS = \/LTCG \/OPT:REF,ICF \/DEBUG \/machine:X86/g' $i
  # LINK FLAGS (lib)
  sed -i 's/LINK_FLAGS = \/machine:X86/LINK_FLAGS = \/LTCG \/machine:X86/g' $i
  sed -i 's/\/INCREMENTAL //g' $i
  # RC FLAGS
  sed -i 's/FLAGS = -DWIN32/FLAGS = -DWIN32 -nologo/g' $i
  # C & C++ FLAGS
    # warn
  sed -i -E 's/[\/-]W[0-4]/\/w/g' $i
    # opti
  sed -i 's/ \/O2 \/Ob1 / \/O2 \/GL \/MD \/Zi \/MP'$3' '$1' /g' $i
	# found		/DWIN32 /D_WINDOWS /W4 /MD /Zi /O2 /Ob1 /DNDEBUG
	# result	/DWIN32 /D_WINDOWS /w /MD /Zi /O2 /GL /MD /Zi /MP16 /arch:AVX /DNDEBUG
done