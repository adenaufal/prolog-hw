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

% parent(X,Y) denotes that X is one of Y’s parent.
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

% birth(X,Y) explains the birth year of person X.
birth(anya,1938). birth(benjamin,1929).
birth(clara,1959). birth(david,1950).
birth(edward,1963).
birth(fiona,1965). birth(george,1962).
birth(hannah,1980).
birth(ira,1982). birth(james,1979).
birth(kiana,1990). birth(lucas,1986).
birth(mike,1991).
birth(nancy,1994). birth(oscar,1992).
birth(peter,2005). birth(quincy,2008).
birth(raymond,2013). birth(sarah,2015). birth(tina,2018).
birth(umberto,2016). birth(victoria,2019).

% writing queries here

child(X,Y) :- parent(Y,X).
spouse(X,Y) :- child(P,X), child(P,Y).
husband(X,Y) :- male(X), spouse(X,Y).
wife(X,Y) :- female(X), spouse(X,Y).
son(X,Y) :- male(X), child(X,Y).
daughter(X,Y) :- female(X), child(X,Y).
mother(X,Y) :- female(X), parent(X,Y).
father(X,Y) :- male(X), parent(X,Y).
sibling(X,Y) :- parent(P,X), parent(P,Y), X\=Y.
brother(X,Y) :- male(X), sibling(X,Y).
sister(X,Y) :- female(X), sibling(X,Y).
grandmother(X,Y) :- mother(X,P), parent(P,Y).
grandfather(X,Y) :- father(X,P), parent(P,Y).
grandson(X,Y) :- son(X,P), parent(Y,P).
granddaughter(X,Y) :- daughter(X,P), parent(Y,P).
aunt(X,Y) :- sister(X,P), parent(P,Y).
aunt(X,Y) :- wife(X,P), sibling(P,Q), parent(Q,Y).
uncle(X,Y) :- brother(X,P), parent(P,Y).
uncle(X,Y) :- husband(X,P), sibling(P,Q), parent(Q,Y).
niece(X,Y) :- daughter(X,P), sibling(P,Y).
niece(X,Y) :- daughter(X,P), sibling(P,Q), spouse(Q,Y).
nephew(X,Y) :- son(X,P), sibling(P,Y).
nephew(X,Y) :- son(X,P), sibling(P,Q), spouse(Q,Y).
cousin(X,Y) :- parent(P,X), sibling(P,Q), parent(Q,Y).
matGrandma(X,Y) :- mother(X,P), mother(P,Y).
patGrandma(X,Y) :- mother(X,P), father(P,Y).
matGrandpa(X,Y) :- father(X,P), mother(P,Y).
patGrandpa(X,Y) :- father(X,P), father(P,Y).

brother_in_law(X,Y) :- male(X),spouse(Y,Z),brother(X,Z).
brother_in_law(X,Y) :- male(X),sister(Z,Y),husband(X,Z).
brother_in_law(X,Y) :- male(X),spouse(Y,Z),sister(S,Z),husband(X,S).

sister_in_law(X,Y) :- female(X),spouse(Y,Z),sister(X,Z).
sister_in_law(X,Y) :- female(X),brother(Z,Y),wife(X,Z).
sister_in_law(X,Y) :- female(X),spouse(Y,Z),brother(S,Z),wife(X,S).

son_in_law(X,Y) :- male(X), spouse(X,Z), parent(Y,Z).
daughter_in_law(X,Y) :- female(X), spouse(X,Z), parent(Y,Z).

father_in_law(X,Y) :- male(X), spouse(P,Y), child(P,X).
mother_in_law(X,Y) :- female(X), spouse(P,Y), child(P,X).

older(X,Y) :- birth(X,P), birth(Y,Q), P<Q. 
younger(X,Y) :- birth(X,P), birth(Y,Q), P>Q.

xiaodidi(X,Y) :- brother(X,Y), birth(X,P), birth(Y,Q), P>Q.
xiaomeimei(X,Y) :- sister(X,Y), birth(X,P), birth(Y,Q), P>Q.