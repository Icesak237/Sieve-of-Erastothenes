section .bss
    sieve resb 1001

section .data


section .text
    global _start

_start:

mov rax, 0
mov byte [sieve + rax], 0   ;set 0 false
mov rax, 1
mov byte [sieve + rax], 0   ;set 1 false


mov rax, 60   ; syscall number for exit
mov rdi, 0    ; exit code 0
syscall