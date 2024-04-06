.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:dword

;TITLE Addressing Modes
INCLUDE Irvine32.inc
.data
	

.code
main PROC
	mov eax, 1234ABCDh
	shr eax, 16
	mov dx, ax
	call writehex
	call crlf
	

	
exit
main ENDP
END main

