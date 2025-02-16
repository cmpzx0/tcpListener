section .data
    ip_address db "127.0.0.1", 0
    port dw 8080

section .text
    global _start

_start:
    mov rax, 41          
    mov rdi, 2      
    mov rsi, 1        
    mov rdx, 0   
    syscall
    mov rdi, rax     

    mov rax, 49        
    lea rsi, [address]   
    mov rdx, 16          
    syscall

    mov rax, 50          ; sys_listen
    mov rsi, 10         
    syscall

    mov rax, 51        
    xor rsi, rsi       
    xor rdx, rdx         
    syscall
    mov rax, 3         
    syscall
    mov rax, 60          ; sys_exit
    xor rdi, rdi         
    syscall

section .bss
    address resb 16      ;sockaddr_in
