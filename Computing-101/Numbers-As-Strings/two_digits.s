.intel_syntax noprefix

.global atoi_digit
.global atoi

atoi:
    push rdi
    push rcx
    call atoi_digit
    pop rcx
    imul rcx, rax, 10
    push rcx
    add rdi, 1
    call atoi_digit
    pop rcx
    pop rdi
    add rcx, rax
    mov rax, rcx
    ret

atoi_digit:
    movzx rax, byte ptr [rdi]
    sub rax, 0x30
    ret



