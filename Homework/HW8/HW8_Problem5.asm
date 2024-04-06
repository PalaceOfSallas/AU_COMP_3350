.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:dword

;TITLE Addressing Modes
INCLUDE Irvine32.inc
.data
	Apple QWORD 1111222233334444h
	Berry QWORD 13572468ABCD0000h
	Cherry QWORD ?
	ph WORD 0

.code
main PROC
	mov dx, 0
	mov ax, WORD PTR Apple
	mov bx, WORD PTR Berry
	add ax, bx
	adc dx, 0
	mov WORD PTR Cherry, ax

	mov ax, WORD PTR [Apple + 2]
	mov ax, WORD PTR [Berry + 2]
	add ax, dx
	mov dx, 0
	add ax, bx
	adc dx, 0
	mov WORD PTR [Cherry + 2], ax

	mov ax, WORD PTR [Apple + 4]
	mov ax, WORD PTR [Berry + 4]
	add ax, dx
	mov dx, 0
	add ax, bx
	adc dx, 0
	mov WORD PTR [Cherry + 4], ax

	mov ax, WORD PTR [Apple + 6]
	mov ax, WORD PTR [Berry + 6]
	add ax, dx
	mov dx, 0
	add ax, bx
	adc dx, 0
	mov WORD PTR [Cherry + 6], ax

	mov ebx, TYPE ph
	movzx eax, WORD PTR [Cherry + 6]
	call WriteHexB
	movzx eax, WORD PTR [Cherry + 4]
	call WriteHexB
	movzx eax, WORD PTR [Cherry + 2]
	call WriteHexB
	movzx eax, WORD PTR Cherry
	call WriteHexB
	call Crlf
	
exit
main ENDP
END main

