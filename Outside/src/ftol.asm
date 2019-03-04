
; Implementation of float-to-integer conversion as needed by MSVC.

global __ftol2
global __ftol2_sse

section ftol text

__ftol2:
__ftol2_sse:
	push eax
	fisttp dword [esp]
	pop eax
	cdq
	ret
