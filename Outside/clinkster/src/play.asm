
%include "src/clinkster.inc"

global _main

extern __imp__fopen
extern __imp__fwrite
extern __imp__fclose
extern __imp__printf
extern __imp__GetAsyncKeyState@4
extern __imp__ExitProcess@4
extern __imp__Sleep@4

	section main text align=1

_main:
	push	message
	push	messageformat
	call	[__imp__printf]
	add		esp, byte 2*4

	call	Clinkster_GenerateMusic

%ifdef WRITE_WAV
	push	wavname
	push	wavformat
	call	[__imp__printf]
	add		esp, byte 2*4

	push	filemode
	push	wavname
	call	[__imp__fopen]
	add		esp, byte 2*4

	push	eax
	push	eax
	push	eax
	push	byte 44
	push	byte 1
	push	Clinkster_WavFileHeader
	call	[__imp__fwrite]
	add		esp, byte 3*4

	push	dword [Clinkster_WavFileHeader+40]
	push	byte 1
	push	Clinkster_MusicBuffer
	call	[__imp__fwrite]
	add		esp, byte 3*4

	call	[__imp__fclose]
	add		esp, byte 1*4
%endif

	call	Clinkster_StartMusic

.playloop:
	mov		ebx, 60

	fild	dword [Clinkster_MusicLength]
	fdiv	dword [Clinkster_TicksPerSecond]
	push	eax
	fistp	dword [esp]
	pop		eax ; music length in seconds

	xor		edx, edx
	div		ebx
	push	edx
	push	eax

	call	Clinkster_GetPosition
	fdiv	dword [Clinkster_TicksPerSecond]
	push	eax
	fistp	dword [esp]
	pop		eax ; play position in seconds

	xor		edx, edx
	div		ebx
	push	edx
	push	eax

	push	timeformat
	call	[__imp__printf]
	add		esp, byte 5*4

	push	byte 100
	call	[__imp__Sleep@4]

	push	byte 27
	call	[__imp__GetAsyncKeyState@4]
	test	ax, ax
	je		.playloop

	push	byte 0
	call	[__imp__ExitProcess@4]

	section mformat rdata align=1

messageformat:
	db "%s",0

	section wformat rdata align=1

wavformat:
	db "Writing music to %s...",10,10,0

	section wname rdata align=1

wavname:
	db "music.wav",0

	section wb rdata align=1
filemode:
	db "wb",0

	section tformat rdata align=1

timeformat:
	db 13,"Playing %d:%02d / %d:%02d",0

	section message rdata align=1

message:
	incbin "music.txt"
	db 0
