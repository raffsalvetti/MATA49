;
;  MyAsmFunctions.asm
;
;  Created on: 9 de dez de 2017
;      Author: raffaello
;

section .text
global _MyAsm_dummy, _MyAsm_abs, _MyAsm_acos, _MyAsm_asin, _MyAsm_atan, _MyAsm_cos, _MyAsm_exp, _MyAsm_ln, _MyAsm_sin, _MyAsm_sqrt, _MyAsm_tan

_MyAsm_dummy:
	enter 0,0
	fld qword [ebp + 8]
	leave
	ret

_MyAsm_abs:
	enter 0,0
	fld qword [ebp + 8]
	fabs
	leave
	ret

_MyAsm_acos:
	enter 0,0
	fld qword [ebp + 8]
	leave
	ret

_MyAsm_asin:
	enter 0,0
	fld qword [ebp + 8]
	leave
	ret

_MyAsm_atan:
	enter 0,0
	fld qword [ebp + 8]
	leave
	ret

_MyAsm_cos:
	enter 0,0
	fld qword [ebp + 8]
	fcos
	leave
	ret

_MyAsm_exp:
	enter 0,0
	fld qword [ebp + 8]
	leave
	ret

_MyAsm_ln:
	enter 0,0
	fld qword [ebp + 8]
	leave
	ret

_MyAsm_sin:
	enter 0,0
	fld qword [ebp + 8]
	fsin
	leave
	ret

_MyAsm_sqrt:
	enter 0,0
	fld qword [ebp + 8]
	fsqrt
	leave
	ret

_MyAsm_tan:
	enter 0,0
	fld qword [ebp + 8]
	ftan
	leave
	ret
