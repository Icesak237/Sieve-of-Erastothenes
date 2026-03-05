# Sieve of Erastothenes through the Ages
A personal project where I implement the [Sieve of Eratosthenes](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes) in as many old programming languages as I can. I started this because I thought it would be fun to see how the same algorithm looks and feels across very different languages from different eras of computing.
## How to Run Each

**Odin**
```bash
odin run .
```

**Fortran**
```bash
gfortran sieve.f90 -o sieve && ./sieve
```

**LISP**
```bash
sbcl --script sieve.lisp
```

**COBOL**
```bash
cobc -free -x sieve.cob -o sieve && ./sieve
```

**Assembly**
```bash
nasm -f elf64 sieve.asm -o sieve.o && ld sieve.o -o sieve && ./sieve
```

**BASIC**
```bash
fbc sieve.bas && ./sieve
```

**APL**
```bash
apl -s --OFF -f sieve.apl
```

**Forth**
```bash
gforth sieve.fs
```

**Pascal**
```bash
fpc sieve.pas && ./sieve
```

**Prolog**
```bash
swipl -s sieve.pl
```