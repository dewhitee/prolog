% Facts
parent(luke, darth_vader).
parent(luke, padme).
parent(leia, darth_vader).
parent(leia, padme).
parent(darth_vader, shmi).

% Facts
male(dart_vader).
male(luke).

% Facts
female(shmi).
female(padme).
female(leia).

% Rule
mother(Child, Parent) :-
    parent(Child, Parent),
    female(Parent).

% Rule
father(Child, Parent) :-
    parent(Child, Parent),
    male(Parent).

% Rule
grandmother(Child, Grandparent) :-
    parent(Child, Parent),
    mother(Parent /* Fact */, Grandparent).

% Rule
grandfather(Child, Grandparent) :-
    parent(Child, Parent), % Predicate
    father(Parent /* Fact */, Grandparent). % Predicate

% End condition (Rule)
ancestor(Child, Ancestor) :-
    parent(Child, Ancestor).

% If first ancestor's parent predicate is false - then going to recursive part

% Recursive part (Rule)
ancestor(Child, Ancestor) :-
    parent(Child, Parent), % If ancester is placed here - infinite loop.
    ancestor(Parent, Ancestor).