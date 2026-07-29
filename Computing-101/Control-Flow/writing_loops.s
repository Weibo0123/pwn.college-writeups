.intel_syntax noprefix
mov rdi,QWORD PTR [rsp+0x10]
xor rax, rax
loop:
    cmp BYTE PTR [rdi], 0
    je done
    inc rax
    inc rdi
    jmp loop

done:
    mov rdi, rax
    mov rax, 60

syscall


