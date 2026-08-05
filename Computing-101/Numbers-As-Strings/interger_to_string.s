.intel_syntax noprefix

.global itoa

itoa:
    mov rax, rdi
    xor rdx, rdx
    mov rcx, 10
    cmp rax, 0
    mov r8, 0
    mov r9, 0
    je zero_done
    jmp loop

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
    ret



