.intel_syntax noprefix

.global solve

solve:
    sub rsp, 256
    mov rcx, 0
    mov rdx, 0
    loop:
        cmp rcx, 256
        je loop1
        mov byte ptr [rsp+rcx], 0
        inc rcx
        jmp loop
   loop1:
        cmp rdx, rsi
        je rdx0
        movzx rcx, byte ptr [rdi + rdx]
        mov byte ptr [rsp + rcx], 1
        inc rdx
        jmp loop1
   rdx0:
        mov rdx, 0
        mov rax, 0
        jmp loop2
   loop2:
        cmp rdx, 256
        je done
        movzx rcx, byte ptr [rsp + rdx]
        cmp rcx, 1
        je add1
        inc rdx
        jmp loop2
    add1:
        inc rax
        inc rdx
        jmp loop2

done:
    add rsp, 256
    ret


