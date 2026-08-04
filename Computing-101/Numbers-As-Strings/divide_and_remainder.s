.intel_syntax noprefix

.global itoa

itoa:
    mov rax, rdi
    xor rdx, rdx
    mov rcx, 10
    div rcx
    add rax, 0x30
    mov [rsi], al
    add rdx, 0x30
    mov [rsi + 1], dl
    mov rax, 2
    ret






