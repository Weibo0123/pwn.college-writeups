.intel_syntax noprefix

.global _start

_start:
    mov rdi, [rsp + 16]
    call atoi
    mov rdi, rax
    mov rax, 60
    syscall

atoi:
    mov rdx, 0
    mov r8, 0
    movzx rsi, byte ptr [rdi]
    cmp rsi, 0x2d
    je negative
    loop:
        movzx rsi, byte ptr [rdi]
        sub rsi, 0x30
        cmp rsi, 9
        ja done
        imul rdx, 10
        add rdx, rsi
        add rdi, 1
        jmp loop

negative:
    mov r8, 1
    add rdi, 1
    jmp loop

add_negative:
    neg rdx
    mov rax, rdx
    ret

done:
    cmp r8, 1
    je add_negative
    mov rax, rdx
    ret


