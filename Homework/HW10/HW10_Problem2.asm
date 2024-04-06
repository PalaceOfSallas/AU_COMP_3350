.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:dword

;TITLE Addressing Modes
INCLUDE Irvine32.inc
.data
	string1 BYTE "testnumber2", 0

.code
main PROC
		INVOKE Str_length,
			ADDR string1
			
		
		exit
		main endp

		Str_length PROC USES edi,
			pString:PTR BYTE
			
			mov edi, pString
			mov eax, 0

		L1:
			cmp byte ptr [edi], 0
			je L2
			inc edi
			inc eax
			jmp L1
		L2:
			ret
		Str_length ENDP
end main
	
	




