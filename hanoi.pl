ascending([]).
ascending([_]).
ascending([H | [ S | T ]]) :-
  H < S,
  ascending([S | T]),
  !.

valid([P1, P2, P3]) :-
  ascending(P1),
  ascending(P2),
  ascending(P3),
  !.

make_a_move([[H|R], P2,    P3],       [R,      [H|P2], P3],     [H,1,2]).
make_a_move([[H|R], P2,    P3],       [R,      P2,     [H|P3]], [H,1,3]).
make_a_move([P1,    [H|R], P3],       [[H|P1], R,      P3],     [H,2,1]).
make_a_move([P1,    [H|R], P3],       [P1,     R,      [H|P3]], [H,2,3]).
make_a_move([P1,    P2,    [H|R]],    [[H|P1], P2,     R],      [H,3,1]).
make_a_move([P1,    P2,    [H|R]],    [P1,     [H|P2], R],      [H,3,2]).

hanoi(Goal, Goal, _, []).
hanoi(From, To, AlreadyTried, [ Move | Rest ]) :-
  make_a_move(From, Intermediate, Move),
  not(member(Intermediate, AlreadyTried)),
  valid(Intermediate),
  hanoi(Intermediate, To, [ Intermediate | AlreadyTried ], Rest).

h(Stack, Moves) :-
  hanoi([Stack, [], []], [[], Stack, []], [ [Stack, [], []] ], Moves).
