.intel_syntax noprefix

.global solve

solve:
    mov rax, 1
    mov rdi, 1
    lea rsi, [rsp+0x40]
    mov rdx, 100
    syscall
    ret


