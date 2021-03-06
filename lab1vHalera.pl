% state(_, _, _, has).

% Places:
% dachaGeneral
% garageOutCity
% officeCompany
% officeOfYellowPapper
%
% Camera:
% has, hasNot
%
% Actions:
% move(onLimuzin)
% state(where)
% grab(Camera)
% film(scene)
% victory(at dacha, at office, film)


% first version

% описание состояния
% state(гдеСьемачнаяГруппа, сниматьСцену, естьКамера).

% переход из локаций
% move(place1, place2).


% При выполнении
move(state(officeOfYellowPapper, noFilm, noCamera), go1, state(garageOutCity, noFilm, noCamera)).
move(state(garageOutCity, noFilm, noCamera), grab1, state(garageOutCity, noFilm, camera)).

move(state(garageOutCity, noFilm, noCamera), go2_1, state(dachaGeneral, noFilm, camera)).
move(state(dachaGeneral, noFilm, camera), shootTheFilm1_1, state(dachaGeneral, film, camera)).

move(state(garageOutCity, noFilm, noCamera), go2_2, state(officeCompany, noFilm, camera)).
move(state(officeCompany, noFilm, camera), shootTheFilm1_1, state(officeCompany, film, camera)).

move(state(X1, A, B), go(X1, X2), state(X2, A, B)).
move(state(X, A1, B), grab(A1, A2), state(X, A2, B)).
move(state(X, A, B1), shootTheFilm(B1, B2), state(X, A, B1)).

victory(state(dachaGeneral, film, camera), []).
victory(state(officeCompany, film, camera), []).

victory(CurrentState, [CurrentMoveDescription | NextMoves]) :-
        move(CurrentState, CurrentMoveDescription, NextState),
        victory(NextState, NextMoves).
