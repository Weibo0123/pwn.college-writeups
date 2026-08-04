.intel_syntax noprefix

.global atoi

atoi:
    mov rdx, 0
    loop:
        movzx rsi, byte ptr [rdi]
        cmp rsi, 0
        je done
        sub rsi, 0x30
        imul rdx, 10
        add rdx, rsi
        add rdi, 1
        jmp loop

done:
    mov rax, rdx
    ret


