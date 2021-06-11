/* Tree representation: 
 *                           /--------------------------- root ----------------------------\
 *                          /                              |                                \
 *              /----------a---------\               /-----b----\               /------------c-----------\
 *             /           |          \             /            \             /             |            \
 *        /--aa--\        ab      /---ac---\       ba        /---bb---\       ca     /------cb-----\       cc
 *       /        \       |      /    |     \               /    |     \            /     /   \     \
 *     aaa       aab     aba   aca   acb   acc            bba   bbb   bbc         cba  cbb   cbc   cbd
 */

tree(root(
    a(aa(aaa, aab), ab(aba), ac(aca, acb, acc)), 
    b(ba, bb(bba, bbb, bbc)), 
    c(ca, cb(cba, cbb, cbc, cbd), cc))).

find(X, Path) :-                        % Returns all occurrences of X in Tree using Depth-first search.
    tree(Tree),                         % concretizing Tree
    checkChildren(X, [Tree], Path).     % checking all children

check(X, [Node | Kids], Path) :-        % Depth-first search.
    checkHead(X, Node, Path);           % first checking if head (Node) contains X,
    checkChildren(X, Kids, KidsPath),   % then children, recursively
    Path = [Node | KidsPath].           % combining Node search path and Kids search path into Path after exit from checkChildren

checkHead(X, Node, [Node]) :-           % Checks head and returns it as a Path list.
    Node == X.                          % checking if head (Node) equals X
    %isSubstr(X, Node).                  % checking if head (Node) has substring we are searching for

checkChildren(X, [Kid | _], Path) :-    % Checks children of Kid. Fails if Kid term don't have any parameters (if we have reached the leaf). (going down)
    Kid =.. Vertices,                   % decomposing Vertices - turning it into list with term's name as Head and it's params as Tail
                                        % e.g. if [Kid | _ ] == aa(aaa, aab) then Vertices = [aa | (aaa, aab)]                                       
    check(X, Vertices, Path).           % checking Vertices list we got

checkChildren(X, [_ | Tail], Path) :-   % Checks children of a tail. Used to go back (up) in the tree when we have reached the leaf. (going up)
    checkChildren(X, Tail, Path).       % checking each children we got in Tail of a list

%isSubstr(Substr, Str) :-                % Checks if Str (Node) contains Substr (X) we are searching for
%    sub_atom(Str, _, _, _, Substr).     % Succeeds if Substr can be deducted from the Str
