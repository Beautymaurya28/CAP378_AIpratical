% TOWER OF HANOI - PROLOG IMPLEMENTATION

% Base Rule:
% Move 1 disk from source to destination directly
hanoi(1, Source, Destination, _) :-
    write('Move disk from '), write(Source),
    write(' to '), write(Destination), nl.

% Recursive Rule:
% Move N disks from Source to Destination using Auxiliary
hanoi(N, Source, Destination, Auxiliary) :-
    N > 1,
    M is N - 1,

    % Step 1: Move top N-1 disks from Source to Auxiliary
    hanoi(M, Source, Auxiliary, Destination),

    % Step 2: Move last disk from Source to Destination
    hanoi(1, Source, Destination, _),

    % Step 3: Move N-1 disks from Auxiliary to Destination
    hanoi(M, Auxiliary, Destination, Source).

# How to Run (Step-by-step):
# Open your terminal or SWI-Prolog.
# Load the file:
# ?- consult('tower.pl').
# Call the predicate (for example, with 3 disks):
# ?- hanoi(3, left, right, center).
