.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:dword

;TITLE Addressing Modes
INCLUDE Irvine32.inc
.data

.code
main PROC
	call ReadInt
	mov bx, ax
	mov ecx, 16
L1: 
	shl bx, 1
	jc L2
	jnc L3
L2: 
	mov eax, 1
	call WriteDec
	loop L1
	exit
L3:
	mov eax, 0
	call WriteDec
	loop L1
	
	

	
exit
main ENDP
END main

