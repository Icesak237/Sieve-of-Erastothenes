#include <iostream>
#include <vector>
#include <ranges>
#include <algorithm>
#include <print>

int main()
{
    constexpr int N = 1000;
    std::vector<char> sieve(N + 1, 1);
    sieve[0] = sieve[1] = 0;

    for (int i = 2; i * i <= N; i++)
        if (sieve[i])
            for (int j = i * i; j <= N; j += i)
                sieve[j] = 0;

    std::println("The following are all primes up to 1000:");

    auto primes = std::views::iota(2, N + 1)
                | std::views::filter([&](int i){ return sieve[i]; });

    std::ranges::for_each(primes, [](int p){ std::println("{}", p); });
}
