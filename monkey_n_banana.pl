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
% M and L are lists, M - transitions (currentMoves) list, L - nextMoves
victory(CurrentState, [CurrentMoveDescription | NextMoves]) :-
    move(CurrentState, CurrentMoveDescription, NextState), % S2 state is that
    victory(NextState, NextMoves). % S2 state is victory


% Add new element to linked-list end
addHead(H, T, [H | T]).

% Add multiple elements to linked-list start, backward recursive step
concat([], L2, L2).
concat([H | T], L2, [H | L3]) :-
    concat(T, L2, L3).

% Check if element is in list
contains(X, [X, _]).
contains(X, [_ | T]) :-
    contains(X, T).

% Show ways how we can delete certain X element in list
showDelete(X, [X | T], T).
showDelete(X, [H | T], [H | T2]) :-
    showDelete(X, T, T2).

