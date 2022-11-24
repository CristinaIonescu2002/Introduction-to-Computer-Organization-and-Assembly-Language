section .text
	global par

;; int par(int str_length, char* str)
;
; check for balanced brackets in an expression
par:

	;; "(" => 40
	;; ")" => 41

	pop edx
	pop ecx
	pop edi

	push edi			;; sir
	push ecx			;; lungime
	push edx			;; return address

	xor eax, eax					;; fac eax=0
	for:
		push edi					;; urc pe stiva edi, pt a lua in ebx valoarea lui
		pop ebx
		cmp byte[ebx], 40			;; verific daca primul caracter din ebx este "("
		je paranteze_Deschise
		cmp byte[ebx], 41			;; verific daca primul caracter din ebx este ")"
		je paranteze_Inchise

	continuare:
		add eax, 1					;; eax++, eax=contor pentru nr de paranteze din sir
		add edi, 1					;; edi++ sarim peste primul caracter din edi
		cmp eax, ecx				;; daca nu am ajuns la finalul sirului, reluam for-ul
		jl for
		jmp exit_normal				;; daca am terminat de parcurs sirul mergem in "exit_norma"

	paranteze_Deschise:
		push eax					;; pentru fiecare paranteza "(" urcam eax pe stiva
		jmp continuare				;; reluam for-ul

	paranteze_Inchise:
		pop esi						;; pentru fiecare paranteza ")" scoanem ceva de pe stiva
		cmp esi, edx				;; daca am ajuns sa scoatem "adresa de return" inainte de terminarea
		je exit_prost				;; sirului => sirul este prost => mergem in "exit_prost"
		jmp continuare				;; daca nu, continuam

	exit_prost:						;; daca am ajuns aici => sunt mai multe ")" decat "(" => sirul nu e bun
		push edx				    ;; trebuie sa punem inapoi pe stiva "adresa de return" scoasa anterior
		xor eax, eax				;; facem eax=0, pentru ca sirul este prost
		jmp exit					;; si mergem in exit

	exit_fortat:					;; daca am ajuns aici => sirul a fost terminat, dar mai sunt elemente 
		pop esi						;; pestiva => sirul nu este bun
		cmp edx, esi				;; scoatem elemente de pe stiva cat timp nu am ajuns la "return address"
		je exit_prost				;; cand am ajuns la ea mergem in "exit_prost"
		jmp exit_fortat

	exit_normal:					;; daca am ajuns aici => am terminat de parcurs toate elementele sirului
		pop esi						;; scoatem un element de pe stiva pentru a verifica daca suntem la 
		cmp esi, edx				;; "adresa de return" sau nu
		jne exit_fortat				;; daca nu am ajuns la ea => nu am scos toate elementele de pe stiva, deci
									;; sirul este prost => va trebui sa facem un "exit_fortat"
		push esi					;; daca suntem la adresa dereturn, o urcam inapoi pe stiva
		xor eax, eax				;; facem eax=0
		add eax, 1					;; eax++ , facem eax=1 deoarece sirul este bun
		jmp exit					;; apoi mergem in exit
		
	exit:	

	ret
