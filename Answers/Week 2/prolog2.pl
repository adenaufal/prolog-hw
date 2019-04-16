% male(x) states that x is a male.
/* Bob, Charlie, David, Hans, & Jim are male */
male(bob).
male(charlie).
male(david).
male(hans).
male(jim).

% female(x) states that x is a female.
/* Alice, Emma, Fiona, Grace, Irene, Kelly, & Lily are female */
female(alice).
female(emma).
female(fiona).
female(grace).
female(irene).
female(kelly).
female(lily).

% parent(x,y) states that x is a parent of y
parent(alice,charlie).
parent(bob,charlie).
parent(bob,emma).
parent(charlie,fiona).
parent(charlie,grace).
parent(emma,irene).
parent(fiona,david).
parent(fiona,lily).
parent(grace,jim).
parent(grace,kelly).
parent(hans,jim).
parent(hans,kelly).

% adult(x) states that x is an adult.
% Alice, Bob, Charlie, Emma, Fiona, Grace, & Hans are adults.
adult(alice).
adult(bob).
adult(charlie).
adult(emma).
adult(fiona).
adult(grace).
adult(hans).

% teen(x) states that x is a teenager.
% Irene, David, & Lily are teenagers.
teen(irene).
teen(david).
teen(lily).

% kid(x) states that x is a little child.
% Jim & Kelly are little children.
kid(jim).
kid(kelly).

gentleman(X):- male(X),adult(X).
gentleman2(X):- adult(X),male(X).

lady(X):- female(X),adult(X).

teen_boy(X):- male(X),teen(X).
teen_girl(X):- female(X),teen(X).

little_boy(X):- male(X),kid(X).
little_girl(X):- female(X),kid(X).

loves_FIFA17(X):- teen_boy(X); little_boy(X).
loves_CandyCrush(X):- teen_girl(X); little_girl(X).

child(X,Y):- parent(Y,X).

father(X,Y):- parent(X,Y),male(X).
mother(X,Y):- parent(X,Y),female(X).

grandparent(X,Y):- parent(X,Z), parent(Z,Y).

has_a_child(X):- parent(X,_Y).

is_a_daddy(X):- father(X,Y),(male(Y);female(Y)).
is_a_mommy(X):- mother(X,_Y).

sibling(X,Y):- parent(Z,X),parent(Z,Y),X \== Y.

brother(X,Y):- sibling(X,Y),male(X).
sister(X,Y):- sibling(X,Y),female(X).

cousin(X,Y):- sibling(Z,W),parent(Z,X),parent(W,Y).