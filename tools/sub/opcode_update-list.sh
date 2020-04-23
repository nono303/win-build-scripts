echo '#!/bin/bash' > Opcode_list
echo '# ` date '+%Y-%m-%d %H:%M:%S'`' >> Opcode_list
wget -q -O- https://raw.githubusercontent.com/Shirk/vim-gas/master/syntax/gas.vim \
 | grep -B1 -E 'syn keyword gasOpcode_|syn match   gasOpcode' | \
 sed -e '/^--$/d' -e 's/"-- Section:/\n#/g' \
 -e 's/syn keyword gasOpcode_\([^\t]*\)*\(\t\)*\(.*\)/Opcode_\1="\${Opcode_\1} \3"/g' \
 -e 's/Opcode_PENT_3DNOW/Opcode_ATHLON_3DNOW/g' -e 's/\\//g' \
 -e 's/syn match   gasOpcode_\([^\t]*\)*.*\/<\(.*\)>\//Opcode_\1="\${Opcode_\1} \2"/g' \
 >> Opcode_list

# Modify file Opcode_list replacing all occurrences of:
#   * Opcode_Base within the section "Tejas New Instructions (SSSE3)" with Opcode_SSSE3
#   * Opcode_Base within the section "Willamette MMX instructions (SSE2 SIMD Integer Instructions)" with Opcode_WILLAMETTE_Base

# reg replace
# 1)
# } "
# "
# 2)
# Opcode_ARM_THUMB(.*)="\$\{Opcode_ARM_THUMB *
# Opcode_ARM_THUMB="${Opcode_ARM_THUMB} 
# 3)
# Opcode_AVR(.*)="\$\{Opcode_AVR *
# Opcode_AVR="${Opcode_AVR} 