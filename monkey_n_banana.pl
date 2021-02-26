% state(where_monkey, on_crate?, where_crate, banana).
% we must specify that transition to win state is possible.

% state(_, _, _, has).          = win state

% creating transition states

% take banana
move(state(at_middle, on_box, at_middle, has_not), 
    grab,
    state(at_middle, on_box, at_middle, has)). % struct with initial state and next state

% climb box
move(state(X, on_floor, X, Y), climb, state(X, on_box, X, Y)).

% push box
move(state(X1, on_floor, X1, Y), push(X1, X2), state(X2, on_floor, X2, Y)).

% walk
move(state(X1, on_floor, XC, Y), walk(X1, X2), state(X2, on_floor, XC, Y)).

% win
victory(state(_, _, _, has), []).
% M and L are lists
victory(S, [M | L]) :-
    move(S, M, S2), % S2 state is that
    victory(S2, L). % S2 state is victory
