.intel_syntax noprefix

.global atoi

atoi:
    mov rdx, 0
    mov r8, 0
    loop:
        movzx rsi, byte ptr [rdi]
        cmp rsi, 0
        je done
        cmp rsi, 0x2d
        je negative
        sub rsi, 0x30
        imul rdx, 10
        add rdx, rsi
        add rdi, 1
        jmp loop

negative:
    mov r8, 1
    add rdi, 1
    jmp loop

add_negative:
    neg rdx
    mov rax, rdx
    ret

done:
    cmp r8, 1
    je add_negative
    mov rax, rdx
    ret

