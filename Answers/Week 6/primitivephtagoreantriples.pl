ppt(A,B,C):-
	D is C*C - A*A - B*B,
	D = 0.

ppt_gcd(A,B,C,N):-
	length(_,N),
	between(1,N,A),
	between(1,N,B),
	between(1,N,C),
	A*A =:= C*C - B*B.