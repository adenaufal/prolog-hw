/* Animals Database */
animal(mammal,tiger,carnivore,stripes).
animal(mammal,hyena,carnivore,ugly).
animal(mammal,lion,carnivore,mane).
animal(mammal,zebra,herbivore,stripes).
animal(bird,eagle,carnivore,large).
animal(bird,sparrow,scavenger,small).
animal(reptile,snake,carnivore,long).
animal(reptile,lizard,scavenger,small).

mammal(X) :- animal(mammal,X,_,_).
mammal_carnivore(X) :- animal(_,X,carnivore,_).
mammal_stripes(X) :- animal(_,X,_,stripes).
reptile_mane(X) :- animal(reptile,X,_,mane).