/* Greatest Common Divisors */
   
gcd(0,0,_):- write("gcd error"). % handling exception when both numbers are zero
gcd(A,0,A):- A =\=0. % gcd(A,0) = A for nonzero A
gcd(0,A,A):- A =\=0. % gcd(0,A) = A for nonzero A
gcd(A,A,A):- A =\=0. % gcd(A,A) = A for nonzero A
gcd(A,B,Gcd):- % if 0 < A < B, then gcd(A,B) = gcd (A,B-A) (3rd case).
	0 < A,
	A < B,
	C is B-A,
	gcd(A,C,Gcd).
gcd(A,B,Gcd):- % If 0 < B < A, then gcd(A,B) = gcd(A-B,B) (4th case).
	0 < B,
	B < A,
	gcd(B,A,Gcd).

/* Main cases. */


/* The predicate primtriple(A,B,C) which succeeds whenever (A;B;C) are primitive Pythagorean
triple. */

primtriple(A,B,C) :-
	0 < A < B < C,
	A*A + B*B = C*C,
	gcd(A,B,C) = 1.

/* The predicate ptriangle(A,B,C,N) which succeeds whenever (A;B;C) are a primitive
Pythagorean triple of a Pythagorean triangle whose perimeter is equal to N, i.e., A+B +C = N. Notice that at least two of the sides must be no more than bN=2c. */
	
ptriangle(A,B,C,N) :-
	length(_,N),
	between(1,N,A),
	between(1,N,B),
	between(1,N,C),
	C^2 =:= A^2 + B^2.
   
ppt(A,Min,Max) :-
	between(Min,Max,X),
	primtriple(A,B,C).
