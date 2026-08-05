.intel_syntax noprefix

.global _start

_start:
    mov rdi, [rsp]
    lea rsi, [rsp + 16]
    mov rdx, 0
    jmp loop

loop:
    cmp rdi, 1
    je program_done
    push rdi
    mov rdi, [rsi]
    push rsi
    push rdx
    call atoi
    pop rdx
    add rdx, rax
    pop rsi
    pop rdi
    add rsi, 8
    sub rdi, 1
    jmp loop

program_done:
    sub rsp, 32
    mov rdi, rdx
    mov rsi, rsp
    push rsi
    call itoa
    pop rsi
    mov rdx, rax
    mov rax, 1
    mov rdi, 1
    syscall
    
    mov rax, 60
    mov rdi, 42
    syscall

atoi:
    mov rdx, 0
    mov r8, 0
    movzx rsi, byte ptr [rdi]
    cmp rsi, 0x2d
    je negative
    atoi_loop:
        movzx rsi, byte ptr [rdi]
        sub rsi, 0x30
        cmp rsi, 9
        ja atoi_done
        imul rdx, 10
        add rdx, rsi
        add rdi, 1
        jmp atoi_loop

negative:
    mov r8, 1
    add rdi, 1
    jmp atoi_loop

add_negative:
    neg rdx
    mov rax, rdx
    ret

atoi_done:
    cmp r8, 1
    je add_negative
    mov rax, rdx
    ret
        

itoa:
    mov rax, rdi
    xor rdx, rdx
    mov rcx, 10
    cmp rax, 0
    mov r8, 0
    mov r9, 0
    mov r10, 0
    je zero_done
    cmp rdi, 0
    jl is_negative
    jmp itoa_loop

is_negative:
    mov byte ptr [rsi], 0x2d
    inc rsi
    mov r10, 1
    neg rdi
    neg rax

itoa_loop:
    div rcx
    push rdx
    xor rdx, rdx
    inc r8
    cmp rax, 0
    je take_answer
    jmp itoa_loop

zero_done:
    mov rdx, 0
    add rdx, 0x30
    mov [rsi], dl
    mov rax, 1
    ret

take_answer:
    pop rdx
    inc r9
    add rdx, 0x30
    mov [rsi], dl
    cmp r8, r9
    je itoa_done
    inc rsi
    jmp take_answer

itoa_done:
    mov rax, r9
    cmp r10, 1
    je negative_done
    ret

negative_done:
    add rax, 1
    ret

