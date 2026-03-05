INT n = 1000;
INT i := 2;
[0:1000] BOOL sieve;
sieve[0] := FALSE;
sieve[1] := FALSE;
FOR i FROM 2 TO n DO
	sieve[i] := TRUE
OD;
FOR i FROM 2 TO ENTIER sqrt(n) DO
	IF sieve[i] THEN
		FOR j FROM i*i BY i TO n DO
			sieve[j] := FALSE
		OD
	FI
OD;
print(("THe following are all primes up to 1000:"));
print(newline);
FOR i FROM 0 TO n DO
	IF sieve[i] THEN
		print(i);
		print(newline)
	FI
OD
