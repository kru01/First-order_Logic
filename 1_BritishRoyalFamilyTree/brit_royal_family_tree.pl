/* Everything is defined from top to bottom, left to right */

/* male(Person) */
male(prince_phillip).
male(prince_charles).
male(captain_mark_phillips).
male(timothy_laurence).
male(prince_andrew).
male(prince_edward).
male(prince_william).
male(prince_harry).
male(peter_phillips).
male(mike_tindall).
male(james_viscount_severn).
male(prince_george).

/* female(Person) */
female(queen_elizabeth_II).
female(princess_diana).
female(camilla_parker_bowles).
female(princess_anne).
female(sarah_ferguson).
female(sophie_rhys_jones).
female(kate_middleton).
female(autumn_kelly).
female(zara_phillips).
female(princess_beatrice).
female(princess_eugenie).
female(lady_louise_mountbatten_windsor).
female(princess_charlotte).
female(savannah_phillips).
female(isla_phillips).
female(mia_grace_tindall).

/* parent(Parent, Child) */
parent(queen_elizabeth_II, prince_charles).
parent(queen_elizabeth_II, princess_anne).
parent(queen_elizabeth_II, prince_andrew).
parent(queen_elizabeth_II, prince_edward).
parent(prince_phillip, prince_charles).
parent(prince_phillip, princess_anne).
parent(prince_phillip, prince_andrew).
parent(prince_phillip, prince_edward).

parent(princess_diana, prince_william).
parent(princess_diana, prince_harry).
parent(prince_charles, prince_william).
parent(prince_charles, prince_harry).

parent(captain_mark_phillips, peter_phillips).
parent(captain_mark_phillips, zara_phillips).
parent(princess_anne, peter_phillips).
parent(princess_anne, zara_phillips).

parent(sarah_ferguson, princess_beatrice).
parent(sarah_ferguson, princess_eugenie).
parent(prince_andrew, princess_beatrice).
parent(prince_andrew, princess_eugenie).

parent(sophie_rhys_jones, james_viscount_severn).
parent(sophie_rhys_jones, lady_louise_mountbatten_windsor).
parent(prince_edward, james_viscount_severn).
parent(prince_edward, lady_louise_mountbatten_windsor).

parent(prince_william, prince_george).
parent(prince_william, princess_charlotte).
parent(kate_middleton, prince_george).
parent(kate_middleton, princess_charlotte).

parent(autumn_kelly, savannah_phillips).
parent(autumn_kelly, isla_phillips).
parent(peter_phillips, savannah_phillips).
parent(peter_phillips, isla_phillips).

parent(zara_phillips, mia_grace_tindall).
parent(mike_tindall, mia_grace_tindall).

/* married(Person, Person) */
married(queen_elizabeth_II, prince_phillip).
married(prince_phillip, queen_elizabeth_II).

married(prince_charles, camilla_parker_bowles).
married(camilla_parker_bowles, prince_charles).

married(princess_anne, timothy_laurence).
married(timothy_laurence, princess_anne).

married(sophie_rhys_jones, prince_edward).
married(prince_edward, sophie_rhys_jones).

married(prince_william, kate_middleton).
married(kate_middleton, prince_william).

married(autumn_kelly, peter_phillips).
married(peter_phillips, autumn_kelly).

married(zara_phillips, mike_tindall).
married(mike_tindall, zara_phillips).

/* divorced(Person, Person) */
divorced(princess_diana, prince_charles).
divorced(prince_charles, princess_diana).

divorced(captain_mark_phillips, princess_anne).
divorced(princess_anne, captain_mark_phillips).

divorced(sarah_ferguson, prince_andrew).
divorced(prince_andrew, sarah_ferguson).

/* Rules */
husband(Person, Wife) :- male(Person), female(Wife),
        married(Person, Wife), married(Wife, Person).

wife(Person, Husband) :- female(Person), male(Husband),
        married(Person, Husband), married(Husband, Person).

father(Parent, Child) :- male(Parent), parent(Parent, Child).
mother(Parent, Child) :- female(Parent), parent(Parent, Child).
child(Child, Parent) :- parent(Parent, Child).
son(Child, Parent) :- male(Child), parent(Parent, Child).
daughter(Child, Parent) :- female(Child), parent(Parent, Child).

grandparent(GP, GC) :- parent(GP, X), parent(X, GC).
grandmother(GM, GC) :- female(GM), parent(GM, X), parent(X, GC).
grandfather(GF, GC) :- male(GF), parent(GF, X), parent(X, GC).
grandchild(GC, GP) :- parent(GP, X), parent(X, GC).
grandson(GS, GP) :- male(GS), parent(GP, X), parent(X, GS).
granddaughter(GD, GP) :- female(GD), parent(GP, X), parent(X, GD).

sibling(Person1, Person2) :-
        parent(X, Person1),
        parent(X, Person2),
        female(X),              % The gender here doesn't matter,
        Person1 \= Person2.     % we choose only one to avoid duplication.

brother(Person, Sibling) :-
        male(Person),
        parent(X, Person),
        parent(X, Sibling),
        female(X),              % The gender here doesn't matter,
        Person \= Sibling.      % we choose only one to avoid duplication.

sister(Person, Sibling) :-
        female(Person),
        parent(X, Person),
        parent(X, Sibling),
        female(X),              % The gender here doesn't matter,
        Person \= Sibling.      % we choose only one to avoid duplication.

aunt(Person, NieceNephew) :-
        female(Person),
        parent(X, NieceNephew),
        X \= Person,
        (parent(Y, Person); (parent(Y, Z), husband(Z, Person), X \= Z)),
        female(Y),              % The gender here doesn't matter,
        parent(Y, X).           % we choose only one to avoid duplication.

uncle(Person, NieceNephew) :-
        male(Person),
        parent(X, NieceNephew),
        X \= Person,
        (parent(Y, Person); (parent(Y, Z), wife(Z, Person), X \= Z)),
        female(Y),              % The gender here doesn't matter,
        parent(Y, X).           % we choose only one to avoid duplication.

niece(Person, AuntUncle) :-
        female(Person),
        parent(X, Person),
        X \= AuntUncle,
        (parent(Y, AuntUncle); (parent(Y, Z), married(Z, AuntUncle), X \= Z)),
        female(Y),              % The gender here doesn't matter,
        parent(Y, X).           % we choose only one to avoid duplication.

nephew(Person, AuntUncle) :-
        male(Person),
        parent(X, Person),
        X \= AuntUncle,
        (parent(Y, AuntUncle); (parent(Y, Z), married(Z, AuntUncle), X \= Z)),
        female(Y),              % The gender here doesn't matter,
        parent(Y, X).           % we choose only one to avoid duplication.