%include "../include/io.mac"

section .text
    global is_square
    extern printf

is_square:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; dist
    mov eax, [ebp + 12]     ; nr
    mov ecx, [ebp + 16]     ; sq
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    mov edx, 0                              ;; contor pentru for

    for:
        mov edi,0                           ;; contor pentru numerele care vor fi verificate
        jmp verificare                      ;; mergem in verificare
        
    verificare:                             ;; pentru fiecare edi se calculeaza patratul lui => esi
        mov esi, edi
        imul esi,edi        
        add edi,1                           ;; crestem edi
        cmp esi, DWORD[ebx+4*edx]           ;; cand timp esi e sub elementul din vector se reintra in verificare
        jl verificare
        cmp esi, DWORD[ebx+4*edx]           ;; daca esi==elem din vector => elem e patrat perfect => mergem in da
        je da       
        jmp nu                              ;; mergem in nu cada am depasit cu esi elem vectorului
        
    da:
        mov DWORD[ecx+4*edx],1              ;; daca e patrat perfect punem 1 in vetorul cerut
        jmp continuare                      ;; continuam for-ul
    nu:
        mov DWORD[ecx+4*edx],0              ;; daca nu e patrat perfect punem0 in vector
        jmp continuare                      ;; continuam for-ul

    continuare:                             
        add edx, 1                          ;; crestem edx (contotul)
        cmp edx,eax                         ;; cat timp nu am verificat toate elementele din vectorul de distante
        jl for                              ;; reluam forul

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY