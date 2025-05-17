goal(has_banana). 

move(state(on_floor, middle, middle, has_not),
     move_to_box,
     state(on_floor, box, middle, has_not)).

move(state(on_floor, box, middle, has_not),
     push_box,
     state(on_floor, banana, banana, has_not)).

move(state(on_floor, banana, banana, has_not),
     climb_box,
     state(on_box, banana, banana, has_not)).

move(state(on_box, banana, banana, has_not),
     grab,
    has_banana).

solve :-
    path(state(on_floor, middle, middle, has_not), [], Moves),
    write('Steps:'), nl,
    print(Moves).


path(State, _, []) :- goal(State).
path(State, Visited, [Act | Rest]) :-
    move(State, Act, Next),
    \+ member(Next, Visited),
    path(Next, [Next | Visited], Rest).


print([]).
print([H|T]) :- write(H), nl, print(T).
