## RISC-V Vector vvadd ASM code

#include "rvv.h"

.text
.align 2

.globl vec_ddot
.type  vec_ddot,@function

# assumes calling convention:
# a0 has int n
# a1 has int* a  <---
# a2 has int* b
# a3 has int* c
vec_ddot:
    # configufations
    # v0-v2: int
    setvcfg(vcfg0, \
			 VECTOR | FP | W64, \
			 VECTOR | FP | W64, \
			 VECTOR | FP | W64, \
			 0)
loop:
    # TODO: write your own code
    # Hint: Use a stripmine loop and a vslide-based reduction loop
    ret
