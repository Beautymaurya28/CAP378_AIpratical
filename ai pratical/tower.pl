% Base Case: Move 1 disk directly
hanoi(1, Source, Destination, _) :-
    write('Move disk 1 from '), write(Source),
    write(' to '), write(Destination), nl.

% Recursive Case: Move N disks
hanoi(N, Source, Destination, Auxiliary) :-
    N > 1,
    M is N - 1,
    hanoi(M, Source, Auxiliary, Destination),     % Move N-1 from Source to Aux
    hanoi(1, Source, Destination, _),             % Move last disk to Destination
    hanoi(M, Auxiliary, Destination, Source).     % Move N-1 from Aux to Destination
