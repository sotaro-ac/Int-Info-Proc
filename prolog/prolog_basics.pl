% 
% "ELisp Basics" by sotaro-ac@github.com
% 

/* Syntax */
% rule_name(obj1, obj2, ...) [:- fact/rule(obj1, obj2, ...)].

/* Facts */

% 事実：常に"真(true)"である事物やその関係を表したもの
% - 言い換えると「常に真となる規則」

animal(socrates).           % ソクラテスは動物だ 
animal(cat).                % ネコは動物だ
animal(dog).                % イヌは動物だ

loquens(socrates).          % ソクラテスは言葉を話す
loquens(god).               % 神は言葉を話す

knows(socrates, ignorantia).    % ソクラテスは無知を知っている


/* Rules */

% 規則：事物とその関係についての条件をホーン節で表したもの
% - ホーン節(Horn clauses)：ここではゴール節と確定節を指す
% - Prologのプログラムでは確定節(definite_)を宣言していく
% - head :- body <-- bodyを証明するとheadが証明できる

mortal(X) :- animal(X).     % 動物ならば死を免れない

human(me) :- true.          % (常に)私は人間である
% human(me).                % 上と同じ意味

human(X) :-                 % 動物であり言葉を話すならば人間である
    animal(X),
    loquens(X).


/* Questions */

% 質問：プログラム(確定節)から質問(ゴール節:Goal_)を証明する

% ?- human(socrates).       % ソクラテスは人間か？
% true. 

% ?- mortal(socrates).      % ソクラテスは死を免れないか？
% true.

% ?- mortal(god).           % 神は死を免れないか？
% false.

% ?- animal(X).             % 動物とは何か？
% X = socrates ;
% X = cat ;
% X = dog.

% ?- human(X).                  % 人間とは何か？
% X = me.
% X = socrates ;


% ?- human(X), knows(X, ignorantia).        % 無知を知っている人間は誰か？
% X = socrates ;
% false.

% ?- human(X), not(knows(X, ignorantia)).   % 無知を知らない人間は誰か？
% X = me.


/* Data Object */

% - Atom:       tom, socrates, v1, v_1      % 先頭が英小文字
% - Numbers:    100, -5, 3.14
% - Variables:  X, Y, First, _a             % 先頭が英大文字 or '_'
% - Structures: day(31, july, 2022), point(1, 2), [1, 2, 3]
% - String    : 'Hello', 'This is String'


/* Comparison Operators */

/*
% 以下は「値」の比較に使うことができる
- X > Y   | X is greater than Y
- X < Y   | X is less than Y
- X >= Y  | X is greater than or equal to Y
- X =< Y  | X is less than or equal to Y
- X =:= Y | the X and Y values are equal
- X =\= Y | the X and Y values are not equal
*/

% 同じ値を返すかを判定
% ?- 1 + 2 =:= 2 + 1.
% true.

% ?- me =:= me.     % 主語/目的語や述語は値を返さない
% ERROR: Arithmetic: `me' is not a function

% 「= or \=」は「=:= or =\=」と異なる比較を行うので注意
% ?- 1 + 2 = 2 + 1. 
% false.            % '1 + 2' \= '2 + 1'

% ?- 1 + 2 = 1 + 2.
% true.             % '1 + 2' == '1 + 2'

% ?- me = me.
% true.             % 'me' = 'me'


/* Arithmetic Operators */

/*
- +   | Addition
- -   | Subtraction
- *   | Multiplication
- /   | Division
- **  | Power
- //  | Integer Division
- mod | Modulus
*/

calc :-
    A is 1 + 2, write('1 + 2 is '), write(A), nl,   % 3
    B is 5 - 2, write('5 - 2 is '), write(B), nl,   % 3
    C is 3 * 4, write('3 * 4 is '), write(C), nl,   % 12
    D is 7 / 3, write('7 / 3 is '), write(D), nl,   % 2.3333333333333335
    E is 7 // 3, write('7 // 3 is '), write(E), nl, % 2
    F is 10 ** 2, write('10 ** 2 is '), write(F), nl,   % 100
    G is 25 mod 7, write('25 mod 7 is '), write(G), nl. % 4

% ?- calc.
% 1 + 2 is 3
% 5 - 2 is 3
% 3 * 4 is 12
% 7 / 3 is 2.3333333333333335
% 7 // 3 is 2
% 10 ** 2 is 100
% 25 mod 7 is 4
% true.


/* Prolog Loop */

% Prologのループ実装は再帰関数の要領で実現できる
% - 無限ループに注意して実装しましょう

% N個のAを出力して改行する述語
put_n_of_A(0) :- nl, !.
% - "nl" は改行を出力するために使われる
% - "!" はカットと呼ばれる(後述)
put_n_of_A(N) :-
    % 偽が出るまで上から順に評価される
    N > 0,
    M is N - 1,
    write('A'),
    put_n_of_A(M).  % 再帰的なループ実装

% ?- put_n_of_A(5).
% AAAAA
% true.

% ?- put_n_of_A(0).
% 
% true.

% ?- put_n_of_A(-1).
% false.


% Resultがnの階乗であるかを判定する述語(関数ではない！)
% factorial(n, Result), Result =:= n!
factorial(0, 1) :- !.   % 0! = 1
factorial(N, Result) :- % n! = n * (n-1)!
    N > 0,
    M is N - 1,
    factorial(M, NextResult),
    Result is NextResult * N.

% ?- factorial(5, Result).
% Result = 120.

% ?- factorial(0, Result).
% Result = 1.

% ?- factorial(-1, Result).
% false.


/* Prolog Lists */

% Examples of Lists:  [a, b, c], [], [a, b, [c, d], e]

% 
% Representation of Lists:
% 

% ?- [Head, Next|Tail] = [a, b, c, d, e].
% Head = a,
% Next = b,
% Tail = [c, d, e].

% ?- [Head, Next|Tail] = [a, b, c].
% Head = a,
% Next = b,
% Tail = [c].

% ?- [Head, Next|Tail] = [a, b].
% Head = a,
% Next = b,
% Tail = [].

% ?- [Head, Next|Tail] = [a].
% false.


% 
% Basic Operations on Lists
% ---
% For more detail: tutorialspoint | Prolog - Lists
% - https://www.tutorialspoint.com/prolog/prolog_lists.htm

% Is list has X?
list_has(X, [X|_]) :- !.
list_has(X, [_|Tail]) :- list_has(X, Tail).

% ?- list_has(a, [a, b, c, d, e]).
% true.

% ?- list_has(x, [a, b, c, d, e]).
% false.

% ?- list_has(b, [a, [b, c], d]).
% false.


% Length of list.
list_length([], 0) :- !.
list_length([_|Tail], N) :-
    list_length(Tail, N1),
    N is N1 + 1.
    % or "N1 is N - 1"

% ?- list_length([], L).
% L = 0.

% ?- list_length([a, b, c, d, e], L).
% L = 5.

% ?- list_length([a, [b, c], e], L).
% L = 3.


% Append to list.
list_append(A, List, [A|List]).

% ?- list_append(a, [], L).
% L = [a].

% ?- list_append(a, [b, c, d], L).
% L = [a, b, c, d].

% ?- list_append([a], [b, c, d], L).
% L = [[a], b, c, d].


% Delete X from list.
list_delete(X, [X], []) :- !.
list_delete(X, [X|L1], L1) :- !.
list_delete(X, [Y|L2], [Y|L1]) :- list_delete(X, L2, L1).

% ?- list_delete(a, [a, b, c, d], L).
% L = [b, c, d].

% ?- list_delete(c, [a, b, c, d], L).
% L = [a, b, d].

% ?- list_delete(x, [a, b, c, d], L).
% false.


% [Tips]: カット "!" の意味
% 引用：Wikipedia | Prolog_言語仕様 より (2022/08/02)
% - https://ja.wikibooks.org/wiki/Prolog/%E8%A8%80%E8%AA%9E%E4%BB%95%E6%A7%98

% カットは非決定性の述語と定義されたものを決定性に転じるためにも多用される。実例を見よう。

% append() は Prolog の built-in predicate (組み込み述語)
% append(L1, L2, LL): LL = concat(L1, L2)

% > appendの定義であるが、第一引数かつ第二引数に変数が来ると非決定性に働く。
append([],L,L).
append([U|X],Y,[U|Z]) :- append(X,Y,Z).

% ?- append(X,Y,[1,2]).
% X = [], Y = [1,2];
% X = [1], Y = [2];
% X = [1,2], Y = [];
% false.                    % false が出るまですべての解を出力する(非決定性)

% > appendの第一節の本体にカットを加えると、非決定性の性質が事実上消える。
append_a([],L,L) :- !.
append_a([U|X],Y,[U|Z]) :- append_a(X,Y,Z).

% ?- append_a(X,Y,[1,2]).
% X = [], Y = [1,2].        % 最初に導出した解だけを出力する(決定性)
                            % * 厳密には "!" が出現した後に非決定性を失う

% 次に、appendの第二節の末尾にカットが来る場合を考える。
append_b([],L,L).                               % 第一節
append_b([U|X],Y,[U|Z]) :- append_b(X,Y,Z),!.   % 第二節

% このカットも非決定性を決定性に転じる場合に使われるがそう簡単な話ではない。
% これでは決定性述語とはならない。

% ?- append_b(X,Y,[1,2]).
% X = [], Y = [1,2];        % 第一節より導出された(まだ"!"は出現していない)
% X = [1], Y = [2];         % 第二節より導出された(途中で"!"が出現している)

