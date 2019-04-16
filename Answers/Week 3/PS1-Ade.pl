% male(X) denotes that X is a male.
male(benjamin).
male(david). male(edward). male(george).
male(james). male(lucas). male(mike). male(oscar).
male(peter). male(raymond). male(umberto).

% female(X) denotes that X is female.
female(anya).
female(clara). female(fiona).
female(hannah). female(ira). female(kiana). female(nancy).
female(quincy). female(sarah). female(tina). female(victoria).

% parent(X,Y) denotes that X is one of Y's parent.
parent(anya,clara). parent(anya,edward). parent(anya,fiona).
parent(benjamin,clara). parent(benjamin,edward). parent(benjamin,fiona).

parent(clara,hannah). parent(clara,ira). parent(clara,lucas).
parent(david,hannah). parent(david,ira). parent(david,lucas).

parent(fiona,mike). parent(fiona,nancy).
parent(george,mike). parent(george,nancy).

parent(ira,peter). parent(ira,quincy).
parent(james,peter). parent(james,quincy).

parent(kiana,raymond). parent(kiana,sarah). parent(kiana,tina).
parent(lucas,raymond). parent(lucas,sarah). parent(lucas,tina).

parent(nancy,umberto). parent(nancy,victoria).
parent(oscar,umberto). parent(oscar,victoria).

% my own code
married(X,Y):- parent(X,Z), parent(Y,Z).

child(X,Y) :- parent(Y,X).
spouse(X,Y) :- child(P,X), child(P,Y).
husband(X,Y) :- male(X), spouse(X,Y).
wife(X,Y) :- female(X), spouse(X,Y).

son(X,Y) :- male(X), child(X,Y).
daughter(X,Y) :- female(X), child(X,Y).

is_a_grandson(X):- male(X), parent(Z,X), parent(Y,Z).
is_a_granddaughter(X):- female(X), parent(Z,X), parent(Y,Z).

brother(X,Y):- male(X), parent(Z,X), parent(Z,Y), X \== Y.
sister(X,Y):- female(X), parent(Z,X), parent(Z,Y), X \== Y.

uncle(X,Y):- brother(X,Z), parent(Z,Y).
uncle(X,Y) :- husband(X,P), sibling(P,Q), parent(Q,Y).
aunt(X,Y):- sister(X,Z), parent(Z,Y).
aunt(X,Y) :- wife(X,P), sibling(P,Q), parent(Q,Y).

sibling(X,Y) :- parent(Z,X), parent(Z,Y), X \== Y.

is_a_niece(X):- female(X), daughter(X,Z), sibling(Z,Y).
is_a_nephew(X):- male(X), son(X,Z), sibling(Z,Y).