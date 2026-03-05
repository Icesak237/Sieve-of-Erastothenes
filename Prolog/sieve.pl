:- initialization(main, main).

composite(N) :-
    N > 1,
    between(2, N, F),
    F < N,
    N mod F =:= 0,
    !.

prime(N) :-
    N > 1,
    \+ composite(N).

main :-
    write('The following are all primes up to 1000:'), nl,
    forall(
        (between(2, 1000, X), prime(X)),
        (write(X), nl)
    ).
