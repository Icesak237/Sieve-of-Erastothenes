section .bss
    sieve resb 1001 ; Reserve 1001 Bytes
    num_buf resb 20 ; for string conversion

section .data
    newline db 10   ; newline Character

section .text
    global _start


_start:
mov rdx, 1001
mov rax, 0
init_loop:                      ; set all to prime
    mov byte [sieve + rax], 1
    inc rax
    cmp rax, rdx
jl init_loop

dec rax
cvtsi2sd xmm0, rax     ; set square root
sqrtsd xmm0, xmm0
cvttsd2si rcx, xmm0


mov rax, 0
mov byte [sieve + rax], 0   
mov rax, 1
mov byte [sieve + rax], 0  
mov rax, 2
outer_loop:          
    cmp byte [sieve + rax], 0
    je skip
        mov rbx, rax
        imul rbx, rax
        inner_loop:   
            mov byte [sieve + rbx], 0

            add rbx, rax
            cmp rbx, rdx
        jl inner_loop
    skip:
    inc rax
    cmp rax, rcx
jl outer_loop

mov rax, 2
print_loop:
    cmp byte [sieve + rax], 0
    je print_skip

        mov rdi, num_buf
        add rdi, 19
        mov byte [rdi], 0
        mov rbx, rax
        mov r8, rax
        mov rcx, 10

        digit_loop:
            dec rdi
            xor rdx, rdx
            mov rax, rbx
            div rcx
            add dl, '0'
            mov [rdi], dl
            mov rbx, rax
            test rax, rax
        jnz digit_loop

        mov rax, 1
        mov rsi, rdi
        lea rdx, [num_buf + 19]
        sub rdx, rdi
        mov rdi, 1
        syscall

        mov rax, 1
        mov rdi, 1
        mov rsi, newline
        mov rdx, 1
        syscall

        mov rax, r8

    print_skip:
    
    inc rax
    cmp rax, 1001
jl print_loop

mov rax, 60   ; syscall number for exit
mov rdi, 0    ; exit code 0
syscall
