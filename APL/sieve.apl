∇ SIEVE N
  sieve ← (N+1)⍴1
  sieve[1] ← 0
  i ← 2
OUTER:
  →(i > ⌊N*0.5) ⍴ DONE
  →(sieve[i] = 0) ⍴ SKIP
  →(i×i > N) ⍴ SKIP
  sieve[i×1+⍳⌊(N-i)÷i] ← 0
SKIP:
  i ← i+1
  →OUTER
DONE:
  ⎕ ← (sieve[⍳N])/⍳N
∇

SIEVE 1000