% Victory condition:
% On dacha or in company office, Camera shot taken

move(state(dacha, has_equipment, no_picture), take_picture, state(dacha, has_equipment, has_picture)).
%move(state(company_office, has_equipment, no_picture), take_picture, state(company_office, has_equipment, has_picture)).
move(state(garage, no_equipment, B), take_equipment, state(garage, has_equipment, B)).
move(state(X1, A, B), walk(X1, X2), state(X2, A, B)).

victory(state(_, _, has_picture), []).
%victory(state(dacha, _, has_picture), []).
%victory(state(company_office, _, has_picture), []).
victory(CurrentState, [CurrentMoveDescription | NextMoves]) :-
    move(CurrentState, CurrentMoveDescription, NextState),
    victory(NextState, NextMoves).
