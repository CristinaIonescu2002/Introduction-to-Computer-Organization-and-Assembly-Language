%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global road
    extern printf

road:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]      ; points
    mov ecx, [ebp + 12]     ; len
    mov ebx, [ebp + 16]     ; distances
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    mov edx,0                                       ;; contor pentru for
    
    for:
        movzx esi, WORD[eax+4*edx+point.x]          ;; folosesc acelasi principiu ca la 'points-distance' doar ca am gija
        movzx edi, WORD[eax+4*edx+4+point.x]        ;; sa iau structura la care am ajuns (acum fiind mai mult de 2)
        cmp esi, edi                                ;; pentru x diferiti lungimea se afla prin ei si mergem in 'difx'
        jne difx
        cmp esi, edi                                ;; daca x sun t egali, lungimea se calculeaza cu y, deci mergem in 'fify'
        je dify

    continuare_for:
        add edx, 1                                  ;; creste contorul
        cmp edx,ecx                                 ;; verificam daca am ajuns la finalul punctelor
        jle for                                     ;; in caz contrar reluam for-ul
        jmp exit                                    ;; in caz afirmativ iesim din el

    dify:                                           ;; dupa cum am zis folosim acelasi principiu ca la 'points-distance' doar ca am 
        movzx esi, WORD[eax+4*edx+point.y]          ;; grija sa scad din valoarea mai mare, valoarea mai mica
        movzx edi, WORD[eax+4*edx+4+point.y]
        cmp esi,edi                                 ;; daca esi > edi => se merge in 'dify_r'
        jg dify_r
        mov [ebx+4*edx],edi                         ;; diferentele se fac la fel doar ca le schimbam ordinea
        sub [ebx+4*edx],esi                         ;; edi-esi si se pune si valoarea in vectorul de lungimi
        jmp continuare_for                         ;; apoi se reintra in for (in continuarea lui)

    dify_r                                          ;; esi-edi
        mov [ebx+4*edx],esi
        sub [ebx+4*edx],edi
        jmp continuare_for                         ;; se reintra in for

    difx:                                           ;; facem acelasi lucru dar pentru x
        cmp esi,edi
        jg difx_r
        mov [ebx+4*edx],edi                         ;; edi-esi
        sub [ebx+4*edx],esi
        jmp continuare_for                         ;; se reintra in for 

    difx_r:
        mov [ebx+4*edx],esi                         ;; esi-edi
        sub [ebx+4*edx],edi
        jmp continuare_for                         ;; se reintra in for

    exit:

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY