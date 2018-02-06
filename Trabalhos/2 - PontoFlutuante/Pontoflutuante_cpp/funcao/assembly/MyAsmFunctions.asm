;
;  MyAsmFunctions.asm
;
;  Created on: 9 de dez de 2017
;      Author: raffaello
;
section .data
	e	dq	2.71828182846

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
	enter 0, 0
	fld	qword [ebp + 8]
	fld	qword [ebp + 8]
	fmulp
	fld1
	fsubp
	fsqrt
	fld	qword [ebp + 8]
	fpatan
	leave
	ret

_MyAsm_asin:
	enter 0, 0
	fld qword [ebp + 8]
	fld qword [ebp + 8]
	fmul qword [ebp + 8]
	fld1
	fsubp
	fsqrt
	fpatan
	leave
	ret

_MyAsm_atan:
	enter 0, 0
	fld qword [ebp + 8]
	fld1
	fpatan
	leave
	ret

_MyAsm_cos:
	enter 0,0
	fld qword [ebp + 8]
	fcos
	leave
	ret

_MyAsm_exp:
	enter 0, 0
	fld qword [e]
	fld qword [ebp + 8]
	fyl2x
	fld1
	fld ST1
	fprem
	f2xm1
	faddp
	fscale
	fxch ST1
	fstp ST0
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
