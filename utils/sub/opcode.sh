#!/bin/bash
#
# Last update on Nov 05, 2014.
# https://gist.github.com/rindeal/72af275f05d44e10ebca
# Searches disassembled code for specific instructions.
#

my_dir="$(dirname "$0")"
source "$my_dir/opcode.list"

# return values
EXIT_FOUND=0
EXIT_NOT_FOUND=1
EXIT_USAGE=2

# settings
InstSet_Base=""
Recursive=false
Count_Matching=false
Leading_Separator='\s'
Trailing_Separator='(\s|$)' # $ matches end of line for non-parametric instructions like nop
Case_Insensitive=false
Invert=false
Verbose=false
Stop_After=0
Line_Numbers=false
Leading_Context=0
Trailing_Context=0



# GAS-specific opcodes (unofficial names) belonging to the x64 instruction set.
# They are generated by GNU tools (e.g. GDB, objdump) and specify a variant of ordinal opcodes like NOP and MOV.
# If you do not want these opcodes to be recognized by this script, comment out the following line.
Opcode_X64_GAS="nopw nopl movabs"


# instruction sets
InstSet_X86="8086_Base 186_Base 286_Base 386_Base 486_Base PENT_Base P6_Base KATMAI_Base WILLAMETTE_Base PENTM_Base"
InstSet_IA64="IA64_Base"
InstSet_X64="PRESCOTT_Base X64_Base X86_64_Base NEHALEM_Base X64_GAS"
InstSet_MMX="PENT_MMX KATMAI_MMX X64_MMX"
InstSet_MMX2="KATMAI_MMX2"
InstSet_3DNOW="ATHLON_3DNOW"
InstSet_SSE="KATMAI_SSE P6_SSE X64_SSE"
InstSet_SSE2="SSE2 X64_SSE2"
InstSet_SSE3="PRESCOTT_SSE3"
InstSet_SSSE3="SSSE3"
InstSet_VMX="VMX X64_VMX"
InstSet_SSE4_1="SSE41 X64_SSE41"
InstSet_SSE4_2="SSE42 X64_SSE42"
InstSet_SSE4A="AMD_SSE4A"
InstSet_SSE5="AMD_SSE5"
InstSet_FMA="FUTURE_FMA"
InstSet_AVX="SANDYBRIDGE_AVX"

InstSetDep_X64="X86"
InstSetDep_MMX2="MMX"
InstSetDep_SSE2="SSE"
InstSetDep_SSE3="SSE2"
InstSetDep_SSSE3="SSE3"
InstSetDep_SSE4_1="SSSE3"
InstSetDep_SSE4_2="SSE4_1"
InstSetDep_SSE4A="SSE3"
InstSetDep_SSE5="FMA AVX" # FIXME not reliable

InstSetList="X86 IA64 X64 MMX MMX2 3DNOW SSE SSE2 SSE3 SSSE3 VMX SSE4_1 SSE4_2 SSE4A SSE5 FMA AVX"


# architectures
Arch_8086="8086_Base"
Arch_186="186_Base"
Arch_286="286_Base"
Arch_386="386_Base"
Arch_486="486_Base"
Arch_Pentium="PENT_Base PENT_MMX" # Pentium = P5 architecture
Arch_Athlon="ATHLON_3DNOW"
Arch_Deschutes="P6_Base P6_SSE" # Pentium II
Arch_Katmai="KATMAI_Base KATMAI_MMX KATMAI_MMX2 KATMAI_SSE" # Pentium III
Arch_Willamette="WILLAMETTE_Base SSE2" # original Pentium IV (x86)
Arch_PentiumM="PENTM_Base"
Arch_Prescott="PRESCOTT_Base X64_Base X86_64_Base X64_SSE2 PRESCOTT_SSE3 VMX X64_VMX X64_GAS" # later Pentium IV (x64) with SSE3 (Willamette only implemented SSE2 instructions) and VT (VT-x, aka VMX)
Arch_P6=""
Arch_Barcelona="ATHLON_3DNOW AMD_SSE4A"
Arch_IA64="IA64_Base" # 64-bit Itanium RISC processor; incompatible with x64 architecture
Arch_Penryn="SSSE3 SSE41 X64_SSE41" # later (45nm) Core 2 with SSE4.1
Arch_Nehalem="NEHALEM_Base SSE42 X64_SSE42" # Core i#
Arch_SandyBridge="SANDYBRIDGE_AVX"
Arch_Haswell="FUTURE_FMA"
Arch_Bulldozer="AMD_SSE5"

ArchDep_8086=""
ArchDep_186="8086"
ArchDep_286="186"
ArchDep_386="286"
ArchDep_486="386"
ArchDep_Pentium="486"
ArchDep_Athlon="Pentium" # FIXME not reliable
ArchDep_Deschutes="Pentium"
ArchDep_Katmai="Deschutes"
ArchDep_Willamette="Katmai"
ArchDep_PentiumM="Willamette" # FIXME Pentium M is a Pentium III modification (with SSE2). Does it support also WILLAMETTE_Base instructions?
ArchDep_Prescott="Willamette"
ArchDep_P6="Prescott" # P6 started with Pentium Pro; FIXME Pentium Pro did not support MMX instructions (introduced again in Pentium II aka Deschutes)
ArchDep_Barcelona="Prescott" # FIXME not reliable
ArchDep_IA64=""
ArchDep_Penryn="P6"
ArchDep_Nehalem="Penryn"
ArchDep_SandyBridge="Nehalem"
ArchDep_Haswell="SandyBridge"
ArchDep_Bulldozer="Haswell" # FIXME not reliable

ArchList="8086 186 286 386 486 Pentium Athlon Deschutes Katmai Willamette PentiumM Prescott P6 Barcelona IA64 Penryn Nehalem SandyBridge Haswell Bulldozer"


usage() {
    echo "Usage: $0 OPTIONS"
    echo ""
    echo "  -r      set instruction sets recursively according to dependency tree (must precede -a or -s)"
    echo "  -a      set architecture"
    echo "  -s      set instruction set"
    echo "  -L      show list of available architectures"
    echo "  -l      show list of available instruction sets"
    echo "  -i      show base instruction sets of current instruction set (requires -a and/or -s)"
    echo "  -I      show instructions in current instruction set (requires -a and/or -s)"
    echo "  -c      print number of matching instructions instead of normal output"
    echo "  -f      find instruction set of the following instruction (regex allowed)"
    echo "  -d      set leading opcode separator (default '$Leading_Separator')"
    echo "  -D      set trailing opcode separator (default '$Trailing_Separator')"
    echo "  -C      case-insensitive"
    echo "  -v      invert the sense of matching"
    echo "  -V      print all lines, not just the highlighted"
    echo "  -m      stop searching after n matched instructions"
    echo "  -n      print line numbers within the original input"
    echo "  -B      print n instructions of leading context"
    echo "  -A      print n instructions of trailing context"
    echo "  -h      print this help"
    echo
    echo "Multiple architectures and instruction sets can be used."
    echo
    echo "Typical usage is:"
    echo "  objdump -M intel -d FILE | $0 OPTIONS"
    echo "  objdump -M intel -d FILE | $0 -s SSE2 -s SSE3 -V                    Highlight SSE2 and SSE3 within FILE."
    echo "  objdump -M intel -d FILE | tail -n +8 | $0 -r -a Haswell -v -m 1    Find first unknown instruction."
    echo "  $0 -C -f ADDSD                                                      Find which instruction set an opcode belongs to."
    echo "  $0 -f .*fma.*                                                       Find all matching instructions and their instruction sets."
    echo
    echo "The script uses Intel opcode syntax. When used in conjunction with objdump, \`-M intel' must be set in order to prevent opcode translation using AT&T syntax."
    echo
    echo "BE AWARE THAT THE LIST OF KNOWN INSTRUCTIONS OR INSTRUCTIONS SUPPORTED BY PARTICULAR ARCHITECTURES (ESPECIALLY AMD'S) IS ONLY TENTATIVE AND MAY CONTAIN MISTAKES!"
    kill -TRAP $TOP_PID
}

list_contains() {   # Returns 0 if $2 is in array $1, 1 otherwise.
    local e
    for e in $1; do
        [ "$e" = "$2" ] && return 0
    done
    return 1
}

build_instruction_set() {   # $1 = enum { Arch, InstSet }, $2 = architecture or instruction set as obtained using -L or -l, $3 = "architecture"/"instruction set" to be used in error message
    local e
    list_contains "`eval echo \\\$${1}List`" "$2" || (echo "$2 is not a valid $3."; usage)      # Test if the architecture/instruction set is valid.
    if [ -n "`eval echo \\\$${1}_${2}`" ]; then                                                 # Add the instruction set(s) if any.
        for e in `eval echo \\\$${1}_${2}`; do                                                  # Skip duplicates.
            list_contains "$InstSet_Base" $e || InstSet_Base="$e $InstSet_Base"
        done
    fi
    if [ $Recursive = true ]; then
        for a in `eval echo \\\$${1}Dep_$2`; do
            build_instruction_set $1 $a "$3"
        done
    fi
    InstSet_Base="`echo $InstSet_Base | sed 's/$ *//'`"                                         # Remove trailing space.
}

trap "exit $EXIT_USAGE" TRAP    # Allow usage() function to abort script execution.
export TOP_PID=$$               # PID of executing process.

# Parse command line arguments.
while getopts ":ra:s:LliIcf:Fd:D:CvVm:nB:A:h" o; do
    case $o in
        r) Recursive=true ;;
        a) build_instruction_set Arch "$OPTARG" "architecture" ;;
        s) build_instruction_set InstSet "$OPTARG" "instruction set" ;;
        L) echo $ArchList; exit $EXIT_USAGE ;;
        l) echo $InstSetList; exit $EXIT_USAGE ;;
        i)
            if [ -n "$InstSet_Base" ]; then
                echo $InstSet_Base
                exit $EXIT_USAGE
            else
                echo -e "No instruction set or architecture set.\n"
                usage
            fi
            ;;
        I)
            if [ -n "$InstSet_Base" ]; then
                for s in $InstSet_Base; do
                    echo -ne "\e[31;1m$s:\e[0m "
                    eval echo "\$Opcode_$s"
                done
                exit $EXIT_USAGE
            else
                echo -e "No instruction set or architecture set.\n"
                usage
            fi
            ;;
        c) Count_Matching=true ;;
        f)
            # Unlike architectures, instruction sets are disjoint.
            Found=false
            for s in $InstSetList; do
                for b in `eval echo \\\$InstSet_$s`; do
                    Found_In_Base=false
                    for i in `eval echo \\\$Opcode_$b`; do
                        if [[ "$i" =~ ^$OPTARG$ ]]; then
                            $Found_In_Base || echo -ne "Instruction set \e[33;1m$s\e[0m (base instruction set \e[32;1m$b\e[0m):"
                            echo -ne " \e[31;1m$i\e[0m"
                            Found_In_Base=true
                            Found=true
                        fi
                    done
                    $Found_In_Base && echo ""
                done
            done
            if [ $Found = false ]; then
                echo -e "Operation code \e[31;1m$OPTARG\e[0m has not been found in the database of known instructions." \
                "Perhaps it is translated using other than Intel syntax. If obtained from objdump, check if the \`-M intel' flag is set." \
                "Be aware that the search is case sensitive by default (you may use the -C flag, otherwise only lower case opcodes are accepted)."
                exit $EXIT_NOT_FOUND
            else
                exit $EXIT_FOUND
            fi
            ;;
        d) Leading_Separator="$OPTARG" ;;
        D) Trailing_Separator="$OPTARG" ;;
        C) Case_Insensitive=true ;;
        v) Invert=true ;;
        V) Verbose=true ;;
        m) Stop_After=$OPTARG ;;
        n) Line_Numbers=true ;;
        B) Leading_Context=$OPTARG ;;
        A) Trailing_Context=$OPTARG ;;
        h) usage ;;
        \?)
            echo -e "Unknown option: -$OPTARG\n"
            usage
            ;;
    esac
done
shift $((OPTIND-1))
[ -n "$1" ] && echo -e "Unknown command line parameter: $1\n" && usage
[ -z "$InstSet_Base" ] && usage

# Create list of grep parameters.
Grep_Params="--color=auto -B $Leading_Context -A $Trailing_Context"
[ $Count_Matching = true ] && Grep_Params="$Grep_Params -c"
[ $Case_Insensitive = true ] && Grep_Params="$Grep_Params -i"
[ $Invert = true ] && Grep_Params="$Grep_Params -v"
[ $Stop_After -gt 0 ] && Grep_Params="$Grep_Params -m $Stop_After"
[ $Line_Numbers = true ] && Grep_Params="$Grep_Params -n"

# Build regular expression for use in grep.
RegEx=""
for s in $InstSet_Base; do
    eval RegEx=\"$RegEx \$Opcode_$s\"
done
# Add leading and trailing opcode separators to prevent false positives.
RegEx="$Leading_Separator`echo $RegEx | sed "s/ /$(echo "$Trailing_Separator"|sed 's/[\/&]/\\\&/g')|$(echo "$Leading_Separator"|sed 's/[\/&]/\\\&/g')/g"`$Trailing_Separator"

[ $Verbose = true -a $Count_Matching = false ] && RegEx="$RegEx|\$"

# The actual search.
grep $Grep_Params -E "$RegEx" && exit $EXIT_FOUND || exit $EXIT_NOT_FOUND