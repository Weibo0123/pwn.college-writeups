.intel_syntax noprefix

.global str_swapcase

str_swapcase:
loop:
    mov al, BYTE PTR [rdi]
    cmp al, 0
    je done

    xor al, 0x20
    mov BYTE PTR [rdi], al

    add rdi, 1
    jmp loop


done:
    ret


