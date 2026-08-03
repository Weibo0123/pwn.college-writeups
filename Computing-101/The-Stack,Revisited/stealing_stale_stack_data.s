.intel_syntax noprefix

.global solve

solve:
    call rdi
    mov rax, 1
    mov rdi, 1
    lea rsi, [rsp-0x88]
    mov rdx, 100
    syscall
    ret
