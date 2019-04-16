enjoys(albert,X):- movie(X), not(horror(X)).
movie(X):- action(X).
movie(X):- drama(X).
movie(X):- horror(X).
movie(X):- scifi(X).
action('The Avengers').
drama('La La Land').
horror('The Conjuring').
scifi('The Martian').

enjoys1(albert,X):- not(horror(X)), movie(X).
enjoys2(albert,X):- movie(X), not(horror(X)).

bird(sparrow). bird(eagle). bird(duck).
bird(crow). bird(ostrich). bird(puffin).
bird(swan). bird(albatross). bird(starling).
bird(owl). bird(kingfisher). bird(thrush).
can_fly1(ostrich):- fail.
can_fly1(X):- bird(X).
can_fly2(ostrich):- !, fail.
can_fly2(X):- bird(X).

wizard(harry).
wizard(hermione).
muggle(dudley).
muggle(vernon).

attend(ridhwan,formal_methods).
attend(satria,formal_methods).
attend(zakaria,formal_methods).
attend(yunita,formal_methods).
attend(anggita,formal_methods).
attend(ridhwan,logic_programming).
attend(satria,logic_programming).
attend(zakaria,logic_programming).
attend(fathur,logic_programming).
attend(isma,logic_programming).

attendBoth(X):-attend(X,formal_methods),attend(X,logic_programming).
attendFMonly(X):-attend(X,formal_methods),not(attend(X,logic_programming)).
attendLPonly(X):-attend(X,logic_programming),not(attend(X,formal_methods)).
attendOneonly(X):-attendFMonly(X);attendLPonly(X).

numeral(0).
numeral(s(X)) :- numeral(X).

even(0).
even(s(s(X))):- even(X).

odd(0).
odd(s(s(s(X)))):- odd(X).