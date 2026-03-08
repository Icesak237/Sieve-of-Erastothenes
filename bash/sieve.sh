n=1000
declare -a sieve

sieve[0]=0
sieve[1]=0

for ((i=2; i<=n; i++)); do
	sieve[i]=1
done

sqrt_n=$(echo "scale=0; sqrt($n)" | bc)

for ((i=2; i<=sqrt_n; i++)); do
	if [[ ${sieve[i]} -eq 1 ]]; then
		for ((j=((i * i)); j<=n; j+=i)); do
			sieve[j]=0
		done
	fi
done

echo "The following are all primes up to 1000"

for ((i=0; i<=n; i++)); do
	if [[ ${sieve[i]} -eq 1 ]]; then
		echo $i
	fi
done
