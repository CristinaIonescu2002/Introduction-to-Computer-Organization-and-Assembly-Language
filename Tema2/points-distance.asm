%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global points_distance
    extern printf

points_distance:
    ;; DO NOT MODIFY
    
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; points
    mov eax, [ebp + 12]     ; distance
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    movzx ecx, WORD[ebx+point.x]        ;; retinem x-ul primului element
    movzx edx, WORD[ebx+4+point.x]      ;; retinem x-ul celui de-al doilea element 
    cmp ecx, edx                        ;; daca cele 2 x-uri nu sunt egale mergem in 'difx' in care calculam lungimea
    jne difx                            ;; daca cei doi x sunt egali, se va merge in continuare in 'dify'
        
    dify:
        movzx ecx, WORD[ebx+point.y]    ;; daca avem cei doi x egali, aici vom retine primul y
        movzx edx, WORD[ebx+4+point.y]  ;; si aici al doilea y
        mov [eax],edx                   ;; folosim aceeasi idee de calcul ca si la 'difx' din acelasi motiv
        sub [eax],ecx
        jmp exit                        ;; apoi mergem in exit ca sa sarim peste difx, pt ca am calculat deja liungimea

    difx:                               ;; aici calculam lungimea x-urilor (stim ca ambii y sunt egali)
        mov [eax],edx                   ;; punem in rezultat al doilea x
        sub [eax],ecx                   ;; apoi in scadem pe primul (stim din teste ca mereu la doilea e mai mare ca primul)
        jmp exit                        ;; mergem in exit (jmp optional)

    exit:

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret

    ;; DO NOT MODIFY