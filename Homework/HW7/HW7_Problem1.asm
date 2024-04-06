.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:dword

;TITLE Addressing Modes
INCLUDE Irvine32.inc
.data
	negArray SWORD -1, -2, -3, -4
	posArray SWORD 1, 2, 3, 4
	mixArray SWORD 1, -2, 3, -4
	output BYTE "odd integer found.", 0
	output2 BYTE "odd integer not found.", 0

.code
main PROC
	mov esi, OFFSET mixArray
	mov ecx, LENGTHOF mixArray
next:
	test WORD PTR [esi], 8000h
	pushfd
	add esi, TYPE mixArray
	popfd
	loopz next
	jnz quit
	mov edx, OFFSET output2
	call WriteString
	exit
quit:
	mov edx, OFFSET output
	call WriteString
exit

main ENDP
END main

