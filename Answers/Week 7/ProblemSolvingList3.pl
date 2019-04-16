person(john,smith,45,london).
person(mary,jones,28,edinburgh).
person(michael,wilson,62,bristol).
person(mark,smith,37,cardiff).
person(henry,roberts,23,london).

doubled(L):-
	append(L1,L1,L).
	
palindrome(L):-
	reverse(L,R),
	L=R.
	
putfirst(A,L,[A|L]).