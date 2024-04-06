.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:dword

;TITLE Addressing Modes
INCLUDE Irvine32.inc
.data
	prompt BYTE "Please input a value: ", 0
	spacing BYTE ", ", 0
	String2 BYTE "The target value is ", 0
	String3 BYTE "and is located at index: ", 0

.code
main PROC
	mov edx, OFFSET prompt
	mov ecx, 6
L1:
	call WriteString
	call ReadInt
	push ax
	loop L1
	call Crlf

	call WriteString
	call ReadInt

	mov edx, OFFSET String2
	call WriteString
	call WriteInt
	mov edx, OFFSET spacing
	call WriteString
	mov edx, OFFSET String3
	call WriteString
	call Search
	call WriteInt
	call Crlf
exit
main ENDP

Search PROC
		pop edx
		mov ecx, 6

	L2: 
		pop bx
		cmp bx, ax
		loopnz L2

		jnz Failed

		mov eax, ecx
		push edx
		ret

	Failed:
		mov eax, -1
		push edx
		ret

	Search ENDP

END main