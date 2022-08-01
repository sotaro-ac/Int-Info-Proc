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

