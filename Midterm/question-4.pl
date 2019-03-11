% Simple version of Fibonacci sequence

fib(0,0).
fib(1,1).
fib(F,N) :- 
    N>1,
    N1 is N-1,
    N2 is N-2,
    fib(F1,N1),
    fib(F2,N2),
    F is F1+F2,
    write(F," ,").

/*	
fib(0, 1) :- !.
fib(1, 1) :- !.
fib(N, Result) :-
	N1 is N - 1,
	N2 is N - 2,
	fib(N1, Result1),
	fib(N2, Result2),
	Result is Result1 + Result2.
*/