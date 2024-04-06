.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:dword

;TITLE Addressing Modes
INCLUDE Irvine32.inc
.data
	string1 BYTE "Stephen Sallas",0
	string2 BYTE "Homework Ten",0
	string3 BYTE "Call of Duty: Modern Warfare",0
	string4 BYTE "War Eagle",0

	array BYTE 50 DUP(?)

	test1 BYTE "ll",0
	test2 BYTE "om",0
	test3 BYTE "ut",0
	test4 BYTE "gl",0

	stringDisplay BYTE "String: ",0
	charIndex BYTE "the index of ",0
	is BYTE " starts at ",0
	dash BYTE " - ",0
	notFound BYTE " was not found in the string...",0	

.code
main PROC

		mov esi, offset string1
		mov eax, offset test1
		mov ecx, lengthof string1
		call find

		mov esi, offset string2
		mov eax, offset test2
		mov ecx, lengthof string2
		call find

		mov esi, offset string3
		mov eax, offset test3
		mov ecx, lengthof string3
		call find

		mov esi, offset string4
		mov eax, offset test4
		mov ecx, lengthof string4
		call find

		exit
	main endp

	find proc
		mov edx, esi
		call writeString
		mov edx, offset dash
		call writeString

		mov edi, offset array
		mov dl, BYTE PTR([eax])
		mov ebx, ecx
		L1:
			movsb
			cmp dl, BYTE PTR([edi - 1])
			jne next

			mov edi, ebx
			sub edi, ecx
			jmp exitLoop
			
			next:
		loop L1
		mov edi, -1

		exitLoop:
		cmp edi, -1
		je indexNotFound

		mov edx, offset charIndex
		call writeString
		mov edx, eax
		call writeString
		mov edx, offset is
		call writeString
		mov eax, edi
		call writeInt
		jmp return

		indexNotFound:
			mov edx, eax
			call writeString
			mov edx, offset notFound
			call writeString

		return:
			call crlf
			ret
	find endp
end main
	
	




