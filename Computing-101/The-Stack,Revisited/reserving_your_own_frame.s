.intel_syntax noprefix

.global solve

solve:
    sub rsp, 256
    mov rcx, 0
    loop:
        cmp rcx, 256
        je done
        mov byte ptr [rsp+rcx], 0
        inc rcx
        jmp loop
done:
    add rsp, 256
    ret


