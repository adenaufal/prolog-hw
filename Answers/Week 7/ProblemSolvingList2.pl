prefix(P,L):-
	append(P,_,L).
	
suffix(S,L):-
	append(_,S,L).
	
sublist1(Sub,L):-
	prefix(P,L),
	suffix(Sub,L).

sublist2(Sub,L):-
	suffix(S,L),
	prefix(Sub,S).
	
naiveReverse([],[]).
	naiveReverse([H|T],R):-
	naiveReverse(T,RT),
	append(RT,[H],R).
	
accReverse([],A,A). % The base case for the empty list.
accReverse([H|T],A,R):- accReverse(T,[H|A],R).

reverseList(L1,L2):- accReverse(L1,[],L2).