.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:dword

;TITLE Addressing Modes
INCLUDE Irvine32.inc
.data
PromptUser BYTE "Please enter a value:", 0

.code
main PROC
	mov ecx, 5

L1:
	mov edx, OFFSET PromptUser
	call WriteString
	call ReadInt
	push eax
	loop L1

	mov ecx, 5

L2:
	pop eax
	call WriteInt
	call Crlf
	loop L2



exit
main ENDP
END main