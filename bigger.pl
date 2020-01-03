bigger(ant, flea).
bigger(mouse, ant).
bigger(cat, mouse).
bigger(horse, cat).
bigger(whale, horse).

bigger_than(A, B) :-
  bigger(A, B).

bigger_than(A, B) :-
  bigger(A, C),
  bigger_than(C, B).
