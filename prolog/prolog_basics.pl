% 
% "ELisp Basics" by sotaro-ac@github.com
% 

/* Syntax */
% rule_name(obj1, obj2, ...) :- fact/rule(obj1, obj2, ...).

/* Facts */

% 常に"真(true)"である規則(事実)

animal(socrates).           % ソクラテスは動物だ 
animal(cat).                % ネコは動物だ
animal(dog).                % イヌは動物だ

loquens(socrates).          % ソクラテスは言葉を話す
loquens(god).               % 神は言葉を話す

knows(socrates, ignorantia).    % ソクラテスは無知を知っている


/* Rules */

% ホーン節(Horn Clauses)をすべて満たす場合に真となる規則
% rule_name(...) :- clause1(...), clause2(...), ...

mortal(X) :- animal(X).     % 動物ならば死を免れない

human(me) :- true.          % (常に)私は人間である
% human(me).                % 上と同じ意味

human(X) :-                 % 動物であり言葉を話すならば人間である
    animal(X),
    loquens(X).


/* Questions */

% プログラムから質問を証明する

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
