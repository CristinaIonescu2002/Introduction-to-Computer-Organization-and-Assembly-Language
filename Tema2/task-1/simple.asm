%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY

    mov eax, 0                      ;; imi iau un contor pentru for si il initializez cu 0
    mov ebx, 0                      ;; imi iau o copie si o fac 0

    forloop:
        mov bl, byte [esi+eax]      ;; pun un ebx elementul din plain
        add ebx,edx                 ;; adun adun pasul la elementul pe care l-am retinut 
        cmp ebx,90                  ;; daca s-a sarit peste litera 'Z' mergem in 'daca', daca nu
        jg daca                     ;; mergem in 'continuare'

    continuare:                     ;; acum s-a ajuns la litera buna 
        mov byte[edi+eax], bl       ;; adaugam in enc_string literele schimbate
        add eax,1                   
        cmp eax,ecx                 ;; continuam loop forul daca nu am ajuns la finalul cuvantului
        jl forloop
        jmp exit                    ;; daca am terminat iesim

    daca:                           ;; sunt 26 de litere in alfabet, deci daca am trecut de 'Z'
        sub ebx,26                  ;; scadem 26, apoi menrgem in continuare
        jmp continuare
        
    exit:
    

    ;; Your code starts here




    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY