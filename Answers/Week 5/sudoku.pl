use_module(contestlib, [writeN/2]).

triangle(N) :-
	Stars = 1,
	triangle(N,Stars).
triangle(_).

triangle(Spaces,Stars) :-
	Spaces > 0,
	writeN(Spaces,’ ’),
	writeN(Stars,’* ’),
	nl,
	Spaces1 is Spaces - 1,
	Stars1 is Stars + 1,
	triangle(Spaces1,Stars1).