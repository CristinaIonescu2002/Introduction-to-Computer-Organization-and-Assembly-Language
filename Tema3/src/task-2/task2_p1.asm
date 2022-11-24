section .text
	global cmmmc

;; int cmmmc(int a, int b)
;
;; calculate least common multiple fow 2 numbers, a and b

cmmmc:	
	pop edx			;; return address (o scot de pe stiva pentru a face rost de a si b)
	pop eax			;; eax=a
	pop ecx			;; ecx=b

	push ecx		;;le pun inapoi pe stiva (mi-am salvat a si b in eax si ecx)
	push eax
	push edx

	push eax		;; le urc inca o data pe stiva pentru a face 2 noi variabile cu aceleasi valori
	push ecx
	pop esi			;; esi=ecx
	pop edi			;; edi=eax

	for: 						;; am facut cmmmc folosing un algoritm de tip Euclid
		cmp edi, esi			;; daca edi si esi nu sunt egale => nu am gasit cmmmc-ul
		jne completare
		jmp exit				;; daca sunt egale => l-am gasit

	completare:					;; aici verificam care dintre cele 2 este mai mare
		cmp edi,esi
		jl completare_1
		jmp completare_2

	completare_1:				;; daca edi este mai mare => edi+=eax
		add edi, eax
		jmp for					;; si reluam pasii

	completare_2:				;; daca esi este mai mare => esi+=ecx
		add esi, ecx
		jmp for					;; si reluam pasii

	exit:
		push edi				;; am iesit din for atunci cand esi si edi sunt egale (cand ambele sunt cmmmc-ul cautat)
		pop eax					;; il urcam pe stiva pentru a muta valoarea din el in eax (valoarea lui fiind returnata de functie)
							
	ret
