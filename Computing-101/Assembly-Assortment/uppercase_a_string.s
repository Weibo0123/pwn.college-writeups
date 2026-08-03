.intel_syntax noprefix

.global str_upper

str_upper:
loop:
    mov al, BYTE PTR [rdi]
    cmp al, 0
    je done

    and al, 0xDF
    mov BYTE PTR [rdi], al

    add rdi, 1
    jmp loop


done:
    ret


