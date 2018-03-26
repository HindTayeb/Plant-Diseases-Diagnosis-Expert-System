
facts
xpositive(symbol)  
xnegative(symbol)

predicates 
dis(symbol) - nondeterm (o)
ask(symbol,symbol) - determ (i,i) 
remember(symbol,symbol) - determ (i,i)
positive(symbol) - determ (i)
negative(symbol) - determ (i)
clear_facts - determ ()
run - determ ()

clauses
dis(powdery_mildew):-
  positive("are there spots on the plant leafs,stem,or fruits?"),
  positive("are the spots white and look like powder?").


dis(frog_eyed_leaf_spot):-
 xpositive("are there spots on the plant leafs,stem,or fruits?")
 ,positive("are the spots specifically on the leaf?")
 ,positive("do the spots have a brown outline?").

dis(bacterial_Leaf_Spots):-
 xpositive("are there spots on the plant leafs,stem,or fruits?"),
 xpositive("are the spots specifically on the leaf?"),
 positive("are the spots brown?").


dis(black_Spot_Fungus):-
 xpositive("are there spots on the plant leafs,stem,or fruits?"),
 positive("are the spots black?").

dis(septoria):-
 xpositive("are there spots on the plant leafs,stem,or fruits?"),
 positive("are the spots Yellow?")
,positive("Do the spots look like water splashes?").

dis(bacterial_Soft_Rot):-
 xpositive("are there spots on the plant leafs,stem,or fruits?"),
 positive("are the spots specifically on the fruit?"),
 positive("are the spots moist?").

dis(bitter_Pit):-
xpositive("are there spots on the plant leafs,stem,or fruits?"),
xpositive("are the spots specifically on the fruit?"), 
positive("are they brown or dark?"),
positive("are these spots small in size?(2mm or less)").

dis(bactrial_Blight):-
 xpositive("are there spots on the plant leafs,stem,or fruits?"),
 xnegative("are the spots black?"),
 positive("did the spots started as yellow spots then gradually turned brown?").

dis(pests):-
positive("are there holes on the plant leafs,stem,or fruits?").

dis(spider_mites):-
positive("are there fine webs on the underside of the leafs?").

positive(X):-
 xpositive(X),!.
 
positive(X):-
 not(xnegative(X)), ask(X,yes).
 
negative(X):-
 xnegative(X),!.
 
negative(X):-
 not(xpositive(X)), ask(X,no).

ask(X,yes):-
 !, write(X,'\n'), readln(Reply),nl, frontchar(Reply,'y',_), remember(X,yes).
 
ask(X,no):-
 !, write(X,'\n'), readln(Reply),nl, frontchar(Reply,'n',_), remember(X,no).
 
remember(X,yes):-
 assertz(xpositive(X)).
 
remember(X,no):-
 assertz(xnegative(X)).
 
clear_facts:- write("\n\nPlease press the space bar to exit\n"), retractall(_,dbasedom),
readchar(_).

run:-
dis(X),!, write("\nit might be ",X), nl, clear_facts.

run:- 
write("\nUnable to determine "), write("\n\n"), clear_facts.

goal 
run.


