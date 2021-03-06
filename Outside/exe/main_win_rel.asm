; Listing generated by Microsoft (R) Optimizing Compiler Version 19.00.24215.1 

	TITLE	D:\!!Scene\rw2018\Outside\src\main_win_rel.cpp
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

PUBLIC	__fltused
_BSS	SEGMENT
__fltused DD	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
?screenSettings@@3U_devicemodeA@@A DB 00H		; screenSettings
	ORG $+31
	DW	00H
	DW	00H
	DW	09cH
	DW	00H
	DD	01c0000H
	DW	00H
	ORG $+14
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DB	00H
	ORG $+31
	DW	00H
	DD	020H
	DD	0780H
	DD	0438H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
_DATA	ENDS
CONST	SEGMENT
?pfd@@3UtagPIXELFORMATDESCRIPTOR@@B DW 028H		; pfd
	DW	01H
	DD	025H
	DB	00H
	DB	020H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	08H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	020H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DD	00H
	DD	00H
	DD	00H
CONST	ENDS
PUBLIC	?music@@YGXXZ					; music
PUBLIC	?entrypoint@@YGXXZ				; entrypoint
PUBLIC	__real@3f50624dd2f1a9fc
PUBLIC	__real@41a00000
PUBLIC	__real@4e6e6b28
PUBLIC	__real@4f800000
EXTRN	__imp__ExitProcess@4:PROC
EXTRN	__imp__CreateThread@24:PROC
EXTRN	__imp__ChoosePixelFormat@8:PROC
EXTRN	__imp__SetPixelFormat@12:PROC
EXTRN	__imp__wglCreateContext@4:PROC
EXTRN	__imp__wglMakeCurrent@8:PROC
EXTRN	__imp__wglSwapLayerBuffers@8:PROC
EXTRN	__imp__CreateWindowExA@48:PROC
EXTRN	__imp__GetAsyncKeyState@4:PROC
EXTRN	__imp__GetDC@4:PROC
EXTRN	__imp__ShowCursor@4:PROC
EXTRN	__imp__ChangeDisplaySettingsA@8:PROC
EXTRN	__imp__sndPlaySoundA@8:PROC
EXTRN	__imp__timeGetTime@0:PROC
EXTRN	?intro_init@@YGXXZ:PROC				; intro_init
EXTRN	?intro_pre_init@@YGXXZ:PROC			; intro_pre_init
EXTRN	?intro_do@@YGXM@Z:PROC				; intro_do
EXTRN	_Clinkster_GenerateMusic@0:PROC
EXTRN	_Clinkster_StartMusic@0:PROC
EXTRN	_Clinkster_GetPosition@0:PROC
EXTRN	?musicStarted@@3_NA:BYTE			; musicStarted
EXTRN	_Clinkster_TicksPerSecond:DWORD
EXTRN	_Clinkster_MusicLength:DWORD
EXTRN	__fltused:DWORD
;	COMDAT __real@4f800000
CONST	SEGMENT
__real@4f800000 DD 04f800000r			; 4.29497e+09
CONST	ENDS
;	COMDAT __real@4e6e6b28
CONST	SEGMENT
__real@4e6e6b28 DD 04e6e6b28r			; 1e+09
CONST	ENDS
;	COMDAT __real@41a00000
CONST	SEGMENT
__real@41a00000 DD 041a00000r			; 20
CONST	ENDS
;	COMDAT __real@3f50624dd2f1a9fc
CONST	SEGMENT
__real@3f50624dd2f1a9fc DQ 03f50624dd2f1a9fcr	; 0.001
CONST	ENDS
; Function compile flags: /Ogspy
; File d:\!!scene\rw2018\outside\src\main_win_rel.cpp
;	COMDAT ?entrypoint@@YGXXZ
_TEXT	SEGMENT
_maxT$1$ = -16						; size = 4
tv207 = -12						; size = 4
_start_time$1$ = -12					; size = 4
tv204 = -8						; size = 4
tv196 = -8						; size = 4
tv185 = -8						; size = 8
?entrypoint@@YGXXZ PROC					; entrypoint, COMDAT

; 49   : {

	sub	esp, 16					; 00000010H

; 50   :     // full screen
; 51   :     if( ChangeDisplaySettings(&screenSettings,CDS_FULLSCREEN)!=DISP_CHANGE_SUCCESSFUL) return;

	push	4
	push	OFFSET ?screenSettings@@3U_devicemodeA@@A
	call	DWORD PTR __imp__ChangeDisplaySettingsA@8
	test	eax, eax
	jne	$LN1@entrypoint

; 52   :     ShowCursor( 0 );

	push	ebp
	xor	ebp, ebp
	push	ebp
	call	DWORD PTR __imp__ShowCursor@4

; 53   :     // create window
; 54   :     //HWND hWnd = CreateWindow( "static",0,WS_POPUP|WS_VISIBLE,0,0,XRES,YRES,0,0,0,0);
; 55   :     HWND hWnd = CreateWindow( (LPCSTR)0xC018,0,WS_POPUP|WS_VISIBLE,0,0,XRES,YRES,0,0,0,0);

	push	ebp
	push	ebp
	push	ebp
	push	ebp
	push	1080					; 00000438H
	push	1920					; 00000780H
	push	ebp
	push	ebp
	push	-1879048192				; 90000000H
	push	ebp
	push	49176					; 0000c018H
	push	ebp
	call	DWORD PTR __imp__CreateWindowExA@48

; 56   :     if( !hWnd ) return;

	test	eax, eax
	je	$LN16@entrypoint

; 57   :     HDC hDC = GetDC(hWnd);

	push	esi
	push	eax
	call	DWORD PTR __imp__GetDC@4
	mov	esi, eax

; 58   :     // initalize opengl
; 59   :     if( !SetPixelFormat(hDC,ChoosePixelFormat(hDC,&pfd),&pfd) ) return;

	mov	eax, OFFSET ?pfd@@3UtagPIXELFORMATDESCRIPTOR@@B
	push	eax
	push	eax
	push	esi
	call	DWORD PTR __imp__ChoosePixelFormat@8
	push	eax
	push	esi
	call	DWORD PTR __imp__SetPixelFormat@12
	test	eax, eax
	je	$LN17@entrypoint

; 60   :     wglMakeCurrent(hDC,wglCreateContext(hDC));

	push	esi
	call	DWORD PTR __imp__wglCreateContext@4
	push	eax
	push	esi
	call	DWORD PTR __imp__wglMakeCurrent@8

; 61   :     //setFont(hDC);
; 62   :     // init intro
; 63   :     intro_pre_init();

	call	?intro_pre_init@@YGXXZ			; intro_pre_init

; 64   :     intro_init();

	call	?intro_init@@YGXXZ			; intro_init

; 65   : 
; 66   :     //intro_do(0);
; 67   :     //wglSwapLayerBuffers(hDC, WGL_SWAP_MAIN_PLANE); 
; 68   :     //intro_do(0);
; 69   :     //wglSwapLayerBuffers(hDC, WGL_SWAP_MAIN_PLANE);
; 70   : 
; 71   :     CreateThread(0, 0, (LPTHREAD_START_ROUTINE)music, 0, 0, 0);

	push	ebp
	push	ebp
	push	ebp
	push	OFFSET ?music@@YGXXZ			; music
	push	ebp
	push	ebp
	call	DWORD PTR __imp__CreateThread@24

; 72   :    // music();
; 73   : 	//musicStarted = true;
; 74   : 	//Sleep(20000);
; 75   : 	//Clinkster_StartMusic();
; 76   : 
; 77   :     float t = 0;
; 78   : 	float start_time = timeGetTime();

	mov	ebp, DWORD PTR __imp__timeGetTime@0
	call	ebp
	mov	DWORD PTR tv207[esp+24], eax
	fild	DWORD PTR tv207[esp+24]
	test	eax, eax
	jns	SHORT $LN25@entrypoint
	fadd	DWORD PTR __real@4f800000
$LN25@entrypoint:
	fstp	DWORD PTR _start_time$1$[esp+24]

; 79   : 	BYTE stage;
; 80   : 	float maxT = 1e9;

	fld	DWORD PTR __real@4e6e6b28
	fstp	DWORD PTR _maxT$1$[esp+24]
$LL4@entrypoint:

; 81   :     do 
; 82   :     {       
; 83   : 	    //maxT = Clinkster_MusicLength / Clinkster_TicksPerSecond;
; 84   : 		t = (timeGetTime() - start_time) / 1000.;// +5.485714 * 31.5;

	call	ebp
	mov	DWORD PTR tv204[esp+24], eax
	fild	DWORD PTR tv204[esp+24]
	test	eax, eax
	jns	SHORT $LN26@entrypoint
	fadd	DWORD PTR __real@4f800000
$LN26@entrypoint:

; 85   : 
; 86   : 		if (!musicStarted && t > 20) {

	cmp	BYTE PTR ?musicStarted@@3_NA, 0		; musicStarted
	fsub	DWORD PTR _start_time$1$[esp+24]
	fmul	QWORD PTR __real@3f50624dd2f1a9fc
	fst	QWORD PTR tv185[esp+24]
	jne	SHORT $LN19@entrypoint
	fld	DWORD PTR __real@41a00000
	fcomp	ST(1)
	fnstsw	ax
	test	ah, 5
	jp	SHORT $LN9@entrypoint

; 87   : 			Clinkster_StartMusic();

	fstp	ST(0)
	call	_Clinkster_StartMusic@0

; 88   : 			maxT = Clinkster_MusicLength / Clinkster_TicksPerSecond;

	mov	eax, DWORD PTR _Clinkster_MusicLength
	fild	DWORD PTR _Clinkster_MusicLength
	test	eax, eax
	jns	SHORT $LN27@entrypoint
	fadd	DWORD PTR __real@4f800000
$LN27@entrypoint:
	fdiv	DWORD PTR _Clinkster_TicksPerSecond

; 89   : 			musicStarted = true;

	mov	BYTE PTR ?musicStarted@@3_NA, 1		; musicStarted
	fstp	DWORD PTR _maxT$1$[esp+24]
	jmp	SHORT $LN8@entrypoint
$LN19@entrypoint:
	fstp	ST(0)
$LN8@entrypoint:

; 90   : 		}
; 91   : 
; 92   : 		if (musicStarted) 
; 93   : 		{
; 94   : 			t = Clinkster_GetPosition() / Clinkster_TicksPerSecond;// +5.485714 * 32.;

	call	_Clinkster_GetPosition@0
	fdiv	DWORD PTR _Clinkster_TicksPerSecond
	fst	QWORD PTR tv185[esp+24]
$LN9@entrypoint:

; 95   : 		}
; 96   : 
; 97   :         intro_do(t);

	push	ecx
	fstp	DWORD PTR [esp]
	call	?intro_do@@YGXM@Z			; intro_do

; 98   :         wglSwapLayerBuffers(hDC, WGL_SWAP_MAIN_PLANE);        

	push	1
	push	esi
	call	DWORD PTR __imp__wglSwapLayerBuffers@8

; 99   :     } while (!GetAsyncKeyState(VK_ESCAPE) && t < maxT);

	push	27					; 0000001bH
	call	DWORD PTR __imp__GetAsyncKeyState@4
	test	ax, ax
	jne	SHORT $LN10@entrypoint
	fld	QWORD PTR tv185[esp+24]
	fcomp	DWORD PTR _maxT$1$[esp+24]
	fnstsw	ax
	test	ah, 5
	jnp	$LL4@entrypoint
$LN10@entrypoint:

; 100  : 
; 101  :     #ifdef CLEANDESTROY
; 102  :     sndPlaySound(0,0);

	xor	esi, esi
	push	esi
	push	esi
	call	DWORD PTR __imp__sndPlaySoundA@8

; 103  :     ChangeDisplaySettings( 0, 0 );

	push	esi
	push	esi
	call	DWORD PTR __imp__ChangeDisplaySettingsA@8

; 104  :     ShowCursor(1);

	push	1
	call	DWORD PTR __imp__ShowCursor@4

; 105  :     #endif
; 106  : 
; 107  :     ExitProcess(0);

	push	esi
	call	DWORD PTR __imp__ExitProcess@4
$LN30@entrypoint:
$LN17@entrypoint:
	pop	esi
$LN16@entrypoint:
	pop	ebp
$LN1@entrypoint:

; 108  : }

	add	esp, 16					; 00000010H
	ret	0
$LN29@entrypoint:
?entrypoint@@YGXXZ ENDP					; entrypoint
_TEXT	ENDS
; Function compile flags: /Ogspy
; File d:\!!scene\rw2018\outside\src\main_win_rel.cpp
;	COMDAT ?music@@YGXXZ
_TEXT	SEGMENT
?music@@YGXXZ PROC					; music, COMDAT

; 43   :     Clinkster_GenerateMusic();    

	jmp	_Clinkster_GenerateMusic@0
?music@@YGXXZ ENDP					; music
_TEXT	ENDS
END
