.intel_syntax noprefix

mov rax, [rsp+16]
cmp BYTE PTR [rax], 'p'
jne fail

mov rdi, 0
mov rax, 60
syscall

fail:
    mov rdi, 1
    mov rax, 60
    syscall



