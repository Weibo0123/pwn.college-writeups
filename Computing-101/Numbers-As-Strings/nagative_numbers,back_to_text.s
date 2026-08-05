.intel_syntax noprefix

.global itoa

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
    jmp loop

is_negative:
    mov byte ptr [rsi], 0x2d
    inc rsi
    mov r10, 1
    neg rdi
    neg rax

loop:
    div rcx
    push rdx
    xor rdx, rdx
    inc r8
    cmp rax, 0
    je take_answer
    jmp loop

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
    je done
    inc rsi
    jmp take_answer

done:
    mov rax, r9
    cmp r10, 1
    je negative_done
    ret

negative_done:
    add rax, 1
    ret
