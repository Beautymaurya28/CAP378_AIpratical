goal(state(2, _)).
goal(state(_, 2)).

move(state(_, Y), state(4, Y)).              % Fill Jug1
move(state(X, _), state(X, 3)).              % Fill Jug2
move(state(_, Y), state(0, Y)).              % Empty Jug1
move(state(X, _), state(X, 0)).              % Empty Jug2

move(state(X, Y), state(X1, Y1)) :-          % Pour Jug1 -> Jug2
    T is X + Y,
    T =< 3, X1 is 0, Y1 is T.

move(state(X, Y), state(X1, 3)) :-           % Pour Jug1 -> Jug2 till Jug2 full
    T is X + Y,
    T > 3, X1 is T - 3.

move(state(X, Y), state(X1, Y1)) :-          % Pour Jug2 -> Jug1
    T is X + Y,
    T =< 4, X1 is T, Y1 is 0.

move(state(X, Y), state(4, Y1)) :-           % Pour Jug2 -> Jug1 till Jug1 full
    T is X + Y,
    T > 4, Y1 is T - 4.

path(State, _, []) :- goal(State).
path(State, Visited, [Move|Moves]) :-
    move(State, Move),
    \+ member(Move, Visited),
    path(Move, [Move|Visited], Moves).

solve :-
    path(state(0, 0), [state(0, 0)], Moves),
    write('Moves: '), nl,
    print_moves(Moves).

print_moves([]).
print_moves([H|T]) :-
    write(H), nl,
    print_moves(T).
