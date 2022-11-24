section .text
	global sort

; struct node {
;     	int val;
;    	struct node* next;
; };

;; struct node* sort(int n, struct node* node);
; 	The function will link the nodes in the array
;	in ascending order and will return the address
;	of the new found head of the list
; @params:
;	n -> the number of nodes in the array
;	node -> a pointer to the beginning in the array
; @returns:
;	the address of the head of the sorted list
sort:
    enter 0, 0
        
    ;;[ebp+12] => sirul
    ;;[ebp+8] => n

    mov edi, [ebp+12]               ;;sirul
    mov ecx, [ebp+8]                ;;un contor cu care vom gasi numerele
    mov ebx, 1                      ;;contor pentru parcurgerea sirului

    for:
        cmp [edi+ebx*8-8], ecx           ;; comparam daca elem din sir e n
        je ultimul
        add ebx, 1                       ;; crestem contorul
        cmp ebx, ecx                     ;; daca nu am terminat de trecut prin sir reluam for-ul
        jle for
        jmp for_2                        ;; cand am terminat iesim din for

    ultimul:
        lea eax, [edi+ebx*8-8]           ;; daca da mutam in eax aadresa elementului
        mov ebx, 1                       ;; contor => 1 (pentru a parcurge sirul de la inceput)
        sub ecx, 1                       ;; ecx=n-1

            ;; primul for a fost doar pentru cautarea lui n in sir si retinerea adresei lui
            ;; al doilea for este pentru a lega elementele intre ele

    for_2:
        lea esi, [edi+ebx*8-8]            ;; retinem adresa elementului curent in esi
        cmp [esi], ecx                    ;; comparam elem din sir cu elem pe care il vrem ([esi] => luam valoarea de la adresa pe care o contine esi)
        je completare
        add ebx, 1                        ;; cont++
        cmp ebx, [ebp+8]                  ;; daca nu am ajuns la final de sir reluam for_2-ul
        jle for_2

    completare:                           ;; daca am gasit elementul cautat
        mov [esi+4], eax                  ;; mutam in campul next al elem gasit, ce e in eax (adresa elementului gasit inainte)
        mov eax, esi                      ;; eax ia elem gasit (dresa lui, deoarece esi retine o adresa)   
        mov ebx, 1                        ;; contor => 1 (pentru a relua parcurgerea sirului de la inceput)
        sub ecx, 1                        ;; ecx-1 (pentru ca cauta urm element)
        cmp ecx, 1                        ;; daca am legat toate elementele din sir = > iesim din for_2
        jge for_2 

    exit:
        
    leave
    ret
