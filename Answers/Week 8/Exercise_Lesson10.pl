parity_test(N,Type):-
	mod(N,2) =:= 0 ->
	Type = even
;	Type = odd.

parity:-
	repeat,
	write('Enter next number: '), read(N),
	parity_test(N,Type),
	write(N), write(' is '), write(Type), nl, N =:= 9999.