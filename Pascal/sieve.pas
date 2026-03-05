program sieve_of_erastothenes;
uses crt;

var
    n, i, j : integer;
	sieve : array[0..1000] of boolean;
	
begin
	n := 1000;

	sieve[0] := false;
	sieve[1] := false;

	for i := 2 to n do
	begin
		sieve[i] := true;
	end;

	for i := 2 to trunc(sqrt(n)) do
	begin
		if sieve[i] then
		begin
		j := i*i;
			while j <= n do
			begin
				sieve[j] := false;
				j := j + i;
			end;
		end;
	end;

	write('The following are all primes up to 1000:');
	for i := 0 to n do
	begin
		if sieve[i] then
		begin
			writeln(i);
		end;
	end;
end.
