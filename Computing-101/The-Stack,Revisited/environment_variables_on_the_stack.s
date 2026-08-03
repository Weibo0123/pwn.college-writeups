.intel_syntax noprefix


mov rax, 1          
mov rdi, 1          
mov rsi, [rsp+24]   
mov rdx, 100          
syscall
mov rdi, 42
mov rax, 60
syscall



