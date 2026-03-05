variable n
variable rootn
1001 constant MAX_N
create sieve MAX_N allot

: PRIMES
    sieve MAX_N 1 fill
    0 sieve 0 + c!
    0 sieve 1 + c!

    MAX_N 2 do
        i i * MAX_N < if
            sieve i + c@ 1 = if
                MAX_N i i * do
                    0 sieve i + c!
                j +loop
            then
        else
        then
    loop

    MAX_N 2 do
        sieve i + c@ 1 = if i . cr then
    loop ;

PRIMES
bye