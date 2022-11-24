%include "../include/io.mac"

section .text
    global beaufort
    extern printf

; void beaufort(int len_plain, char *plain, int len_key, char *key, char tabula_recta[26][26], char *enc) ;
beaufort:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; len_plain
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; len_key
    mov edx, [ebp + 20] ; key (address of first element in matrix)
    mov edi, [ebp + 24] ; tabula_recta
    mov esi, [ebp + 28] ; enc
    ;; DO NOT MODIFY
    ;; TODO: Implement spiral encryption
    ;; FREESTYLE STARTS HERE
   
    mov eax, 0                      ;; variabila in care retinem litera din 'plain'
    mov ecx, 0                      ;; contor pentru hey
    mov edi, 0                      ;; contor pentru for

    for:
        mov eax, [ebx+edi]
        cmp eax, [edx+ecx]
        jle reverse
        jg normal

    continuare_1:
        add edi, 1
        add ecx, 1
        mov eax, [ebp+16]
        cmp ecx, eax
        jl continuare_2
        jmp resetare_ct

    resetare_ct:
        mov ecx, 0
        jmp continuare_2

    continuare_2:
        cmp edi, [ebp+8]
        jle for
        jmp exit

    normal:
        push eax
        mov eax, 0
        add eax, 65
        mov [esi+edi], eax
            ;PRINTF32 `%d \x0`, [esi+edi]
        pop eax
            ;PRINTF32 `%d \x0`, eax
        add [esi+edi], eax
            ;PRINTF32 `%d \x0`, [esi+edi]
        mov al, [edx+ecx]
            ;PRINTF32 `%c \x0`, eax
        sub [esi+edi], eax
            ;PRINTF32 `%c\x0`, [esi+edi]
        jmp continuare_1
        
        
    reverse:
        mov al, byte[ebx+edi]
            ;PRINTF32 `%c\n\x0`, eax
        push eax
        mov eax, 0
        add eax, 65
        mov [esi+edi], eax
            ;PRINTF32 `%d \x0`, [esi+edi]
        pop eax
            ;PRINTF32 `%d \x0`, eax
        sub [esi+edi], eax
            ;PRINTF32 `%d \x0`, [esi+edi]
        mov al, [edx+ecx]
            ;PRINTF32 `%d \x0`, eax
        add [esi+edi], eax
            ;PRINTF32 `%c\n\x0`, [esi+edi]
        jmp continuare_1


    exit:    




;PRINTF32 `%d\n\x0`, edi

    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
