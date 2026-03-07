#include <math.h>
#include <stdio.h>


int main() 
{
	int N = 1000;
	int sieve[N+1];
	for(int i=0; i<=N; i++){
		sieve[i] = 1;
	}

	sieve[0]=0;
	sieve[1]=0;

	int i_end = (int)sqrt(N);
	
	for (int i = 2; i <= i_end; i++)
	{
		if (sieve[i]==1)
		{
			for (int j = i*i; j<=N; j+=i)
			{
				sieve[j] = 0;
			}
		}
	}

printf("\nThe following are all primes up to 1000:\n");

for (int i=0; i<=N; i++) 
{
	if (sieve[i]==1)
	{
		printf("%d\n", i);
	}
}	
}
