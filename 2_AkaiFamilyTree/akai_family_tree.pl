/* Akai Family */
male(akai_grandpa).
male(atsushi_miyano).
male(tsutomu_akai).
male(shuichi_akai).
male(shukichi_haneda).
male(yasuharu_haneda).
male(kohji_haneda).

female(akai_grandma).
female(elena_miyano).
female(akemi_miyano).
female(shiho_miyano).
female(mary_akai).
female(masumi_sera).
female(ichiyo_haneda).

parent(akai_grandpa, elena_miyano).
parent(akai_grandpa, mary_akai).
parent(akai_grandma, elena_miyano).
parent(akai_grandma, mary_akai).
parent(atsushi_miyano, akemi_miyano).
parent(atsushi_miyano, shiho_miyano).
parent(elena_miyano, akemi_miyano).
parent(elena_miyano, shiho_miyano).
parent(mary_akai, shuichi_akai).
parent(mary_akai, masumi_sera).
parent(mary_akai, shukichi_haneda).
parent(tsutomu_akai, shuichi_akai).
parent(tsutomu_akai, masumi_sera).
parent(tsutomu_akai, shukichi_haneda).
parent(yasuharu_haneda, kohji_haneda).
parent(ichiyo_haneda, kohji_haneda).

married(akai_grandpa, akai_grandma).
married(atsushi_miyano, elena_miyano).
married(tsutomu_akai, mary_akai).
married(yasuharu_haneda, ichiyo_haneda).
married(akai_grandma, akai_grandpa).
married(elena_miyano, atsushi_miyano).
married(mary_akai, tsutomu_akai).
married(ichiyo_haneda, yasuharu_haneda).


dating(shuichi_akai, akemi_miyano).
dating(akemi_miyano, shuichi_akai).
non_blood_brother(shukichi_haneda, kohji_haneda).
non_blood_brother(kohji_haneda, shukichi_haneda).

was_black_organization(atsushi_miyano).
was_black_organization(elena_miyano).
was_black_organization(akemi_miyano).
was_black_organization(shiho_miyano).
was_black_organization(shuichi_akai).

is_fbi_agent(shuichi_akai).
is_cia_agent(tsutomu_akai).
is_mi6_agent(mary_akai).

is_alive(shiho_miyano).
is_alive(shuichi_akai).

shrank(shiho_miyano).
shrank(mary_akai).

is_bristish(elena_miyano).
is_bristish(mary_akai).
is_japanese(atsushi_miyano).
is_japanese(tsutomu_akai).

is_biochemist(atsushi_miyano).
is_biochemist(elena_miyano).
is_biochemist(shiho_miyano).


/* Family relationship */
husband(Person,Wife) :- married(Person,Wife), male(Person).
wife(Person,Husband) :- married(Person,Husband), female(Person).

father(Parent, Child) :- parent(Parent, Child), male(Parent).
mother(Parent,Child) :- parent(Parent,Child), female(Parent).

child(Child,Parent) :- parent(Parent,Child).
son(Child,Parent) :- child(Child,Parent), male(Child).
daughter(Child,Parent) :- child(Child,Parent), female(Child).

grandparent(GP,GC) :- parent(GP,Parent), parent(Parent,GC).
grandmother(GM,GC) :- grandparent(GM,GC), female(GM).
grandfather(GF,GC) :- grandparent(GF,GC), male(GF).

grandchild(GC,GP) :- grandparent(GP,GC).
grandson(GS,GP) :- grandchild(GS,GP),male(GS).
granddaughter(GD,GP) :- grandchild(GD,GP), female(GD).

sibling(Person1,Person2) :- father(Father, Person1), father(Father, Person2), mother(Mother, Person1), mother(Mother, Person2), Person1 \= Person2.
brother(Person,Sibling) :- sibling(Person, Sibling), male(Person).
sister(Person,Sibling) :- sibling(Person, Sibling), female(Person).

aunt(Person, NieceNephew) :- female(Person), parent(Parent, NieceNephew),(sister(Person, Parent);(brother(Uncle, Parent), wife(Person, Uncle))).

uncle(Person, NieceNephew) :- male(Person), parent(Parent, NieceNephew),(brother(Person, Parent);(sister(Aunt, Parent), husband(Person, Aunt))).

niece(Person, AuntUncle) :- female(Person),(aunt(AuntUncle, Person); uncle(AuntUncle, Person)).

nephew(Person, AuntUncle) :- male(Person),(aunt(AuntUncle, Person); uncle(AuntUncle, Person)).

boyfriend(Person, Girlfriend) :- dating(Person, Girlfriend), male(Person).

girlfriend(Person, Boyfriend) :- dating(Person, Boyfriend), female(Person).


/* Non-blood relationship */
aunt(Person, P1, P2) :- female(Person), non_blood_brother(P1, P2), (parent(Person, P1); parent(Person, P2)).

uncle(Person, P1, P2) :- male(Person), non_blood_brother(P1, P2), (parent(Person, P1); parent(Person, P2)).

brother(Person, P1, P2) :- male(Person), non_blood_brother(P1, P2), (brother(Person, P1); brother(Person, P2)).

sister(Person, P1, P2) :- female(Person), non_blood_brother(P1, P2), (sister(Person, P1); sister(Person, P2)).


/* Black Organization */
research_APTX_4869(Person) :- is_biochemist(Person),  was_black_organization(Person).

took_APTX_4869(Person) :- shrank(Person).

infiltrator(Person) :- was_black_organization(Person), is_fbi_agent(Person).

hunted(Person) :- took_APTX_4869(Person), is_alive(Person).

is_police(Person) :- is_fbi_agent(Person); is_cia_agent(Person); is_mi6_agent(Person).

police_family(Person, Parent) :- is_police(Person), is_police(Parent).

scientist_family(Person, Parent) :- is_biochemist(Person), is_biochemist(Parent).

has_antidote_APTX_4869(Person) :- research_APTX_4869(Person), is_alive(Person).

british_japanese(Person, Parent1, Parent2) :- parent(Parent1, Person), is_bristish(Parent1), parent(Parent1, Person), is_japanese(Parent2).












