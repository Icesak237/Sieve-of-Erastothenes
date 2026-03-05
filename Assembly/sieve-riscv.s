.bss
	sieve: 	.space 1001

.data
	msg: 	.string "The following are all primes up to 1000:\n"
	n:		.half	1000

.section .text
.global _start

_start:
    .option push
    .option norelax
    la      gp, __global_pointer$   
    .option pop
    
									#t0 limit inner loops 
	lh 	t0, n						
	la 	t6, sieve
	li 	t1, 0

	li t4, 1
	li t5, 2
	
	init_loop:
		add		t3, t6, t1
		sb 		t4, 0(t3)
		addi	t1, t1, 1
		bltu	t1, t0, init_loop

	fcvt.s.w	ft0, t0
	fsqrt.s 	ft1, ft0
	fcvt.w.s 	t1, ft1, rtz		#t1 is limit outer loop

	sb 	zero, 0(t6)
	sb 	zero, 1(t6)



	outer_loop:						#t5 as i, t2 as j, t3 free
		add 	t3, t6, t5
		lb		t3, 0(t3)
		bne		t3, t4, skip

		mul 	t2, t5, t5
		inner_loop:
			add 	t3, t6, t2
			sb 		zero, 0(t3)
			add 	t2, t2, t5			
			bltu	t2, t0, inner_loop

		skip:
		addi	t5, t5, 1
		bltu	t5, t1, outer_loop


	# Print message	
	li      a0, 1           
	la      a1, msg         
	li      a2, 41          
	li      a7, 64          
	ecall
	

	li      t5, 2
print_loop:
    add     t3, t6, t5
    lb      t3, 0(t3)
    bne     t3, t4, print_skip

# push newline
    addi    sp, sp, -1
    li      t2, 10
    sb      t2, 0(sp)
    li      a4, 1               # byte counter = 1 (newline)
    mv      t3, t5
    li      t1, 10
    digit_loop:
        remu    t2, t3, t1
        addi    t2, t2, 48
        addi    sp, sp, -1
        sb      t2, 0(sp)
        addi    a4, a4, 1       # inc byte counter
        divu    t3, t3, t1
        bnez    t3, digit_loop
    # print exactly a4 bytes
    li      a0, 1
    mv      a1, sp
    mv      a2, a4        
    li      a7, 64
    ecall
    # restore sp to a4 bytes
    add     sp, sp, a4

    print_skip:
        addi    t5, t5, 1
        bltu    t5, t0, print_loop

    # exit
    li      a0, 0
    li      a7, 93
    ecall
