.intel_syntax noprefix

.global solve

solve:
    mov rax, 1
    and rdi, 1
    xor rax, rdi
    ret



