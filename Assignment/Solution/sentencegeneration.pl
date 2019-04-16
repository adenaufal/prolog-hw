word(article,a).
word(article,every).
word(noun,criminal).
word(noun,'beef burger').
word(verb,eats).
word(verb,likes).

sentence(Word1,Word2,Word3,Word4,Word5):-
	word(article,Word1),
	word(noun,Word2),
	word(verb,Word3),
	word(article,Word4),
	word(noun,Word5).
	
sentence:-
	sentence(Word1,Word2,Word3,Word4,Word5),
	write(Word1),write(' '),
	write(Word2),write(' '),
	write(Word3),write(' '),
	write(Word4),write(' '),
	write(Word5).