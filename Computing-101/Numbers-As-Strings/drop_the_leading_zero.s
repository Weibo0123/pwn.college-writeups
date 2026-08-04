.intel_syntax noprefix

.global itoa

itoa:
    mov rax, rdi
    xor rdx, rdx
    mov rcx, 10
    div rcx
    cmp rax, 0
    je leading_zero
    add rax, 0x30
    mov [rsi], al
    add rdx, 0x30
    mov [rsi + 1], dl
    mov rax, 2
    ret


leading_zero:
    cmp rdx, 0
    je done
    add rdx, 0x30
    mov [rsi], dl
    mov rax, 1
    ret

done:
    mov rdx, 0
    add rdx, 0x30
    mov [rsi], dl
    mov rax, 1
    ret


