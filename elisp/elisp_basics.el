;;
;; "ELisp Basics" by sotaro-ac@github.com
;;

;;;; Pure LISP: 純LISP

;;; Atom と List

;; Atomの例
123                                     ; integer
3.141592                                ; float
nil                                     ; symbol
'hello                                  ; symbol
"This is string"                        ; string

;; Listの作り方
;; (...) はすべてListである
(quote (1 2 3 4))                       ; Pure LISPの記法
'(1 2 3 4)                              ; quoteの省略記法

;; Listの例
'(1 2 3 4)                              ; 数字のリスト
'(this is 'list)                        ; シンボルのリスト
'(1 (0.2 0.3) () (("foo") t))           ; 複合＋ネストしたリスト
'()                                     ; 空のリスト

;; Lispの真偽値
;; Lispにはboolean型は存在しないが, t/nilがこれに相当する
t                                       ; true  に相当
nil                                     ; false に相当


;;; Lispの評価
;; Lispプログラムでは評価可能なオブジェクトをS式と呼ぶ
;; 単に(...)を書くと内部まで評価されてしまう
;; (function arg1 arg2 ...) のように解釈される
;; 先頭に'を付けることで評価を抑止できる

;; (1 2 3 4) => "1" という関数は存在しないというエラー

"Hello world!"                          ; "Hello world!"を評価(表示される
;; => "Hello world!"

fill-column                             ; シンボル"fill-column"を評価
;; => 80

(* (+ 3 4) 2)                           ; (3 + 4 * 2 を評価
;; => 14

(atom "string")                         ; atom関数: "string"がatomかを評価
;; => t


;;; Listの構造（ペアとリスト）

;; ペアとは２つの要素の組み合わせである
(cons 'A 'B)                            ; cons: ペアを作る関数
;; => (A . B)
'(A . B)                                ; ペアの省略記法
;; => (A . B)
'(A . (B . nil))                        ; リストの最後は暗黙にnilがペアとなる
;; => (A B)

;; リストはペアの再帰的な組み合わせで作られる
'(1 2 3)                                ; => (1 2 3)
'(1 . (2 . (3 . nil)))                  ; => (1 2 3)
(equal '(1 2 3) '(1 . (2 . (3 . nil)))) ; => t
;;* equal関数はELispの組み込み関数(built-in function). Pure Lispにはない


;;; Lispの基本的な関数

;; atom: 引数がatomかどうかを判定する
(atom "Hello Lisp!")                    ; => t
(atom '(1 2 3))                         ; => nil
;; 例外的に空のリストはatomとなる
(atom '())                              ; => t

;; eq: 2つの要素が同じ実体であるかを判定する
(eq 1 1)                                ; => t
(eq 'a 'b)                              ; => nil
;; 異なる実体のリスト同士の比較では判定がtにならない.
;; 例外的に空のリストはnil(シンボル)と同等の扱いになる
(setq obj '(1 2 3) emp '()) ;; obj = '(1 2 3), emp = '()
;;* setq はELispの特殊形式. Pure Lispにはない
(eq 1 '(1))                             ; => nil
(eq '(1 2 3) '(1 2 3))                  ; => nil
(eq obj '(1 2 3))                       ; => nil
(eq obj obj)                            ; => t
(eq '() '())                            ; => t
(eq emp '())                            ; => t

;; car: リスト先頭の要素を取得する
(car '(1 2 3 4))                        ; => 1
(car '(CAR . CDR))                      ; => CAR

;; cdr: リスト先頭以外の要素たちを取得する
(cdr '(1 2 3 4))                        ; => (2 3 4)
(cdr '(CAR . CDR))                      ; => CDR

;; cons: ペアを作る
(cons 'a '(b c d))                      ; => (a b c d)
(cons '(1 2 3 4) '(5 6 7 8))            ; => ((1 2 3 4) 5 6 7 8)
;; (cons 1 2 3 4 '(5 6 7 8))            ; こうはできない(Error!)


;;; Lispの基本的な特殊形式

;; if: 条件式で制御する
(if (= 1 2) "1 == 2" "1 != 2")          ; => "1 != 2"
;; ELSEはなくてもよい(その場合nilを返す)
(if t 'THEN)                            ; => THEN
(if nil 'THEN)                          ; => nil

;; cond: 条件式を上から順に評価/tなら実行する
(cond
 ;; ((条件式) 実行されるS式)
 ((= 1 2) "1 == 2")
 ((not (= 1 2)) "1 != 2")               ; 上がnilだったら評価される
 (nil "never")                          ; 絶対に実行されない
 (t "always")                           ; 評価されると必ず実行される
 (t "no chance")                        ; ここが実行されることはない
 )                                      ; => "1 != 2"

;; defun: 関数を定義する
;; * Pure Lispではdefineという名前であった
(defun factorial (n)
  "factorial of n: n * (n-1) * ..."     ; 関数の説明(任意)
  (cond
   ((= n 0) 1)                          ; (if (= n 0) 1) と同じ
   (t (* n (factorial (- n 1))))        ; 再帰関数となっている
   ))                                   ; => factorial

(factorial 5)                           ; => 120

;; lambda: ラムダ式(無名関数)を利用する
((lambda (a b c) ;; 仮引数
   "a + b + c"   ;; 関数の説明(任意)
   (+ a b c))    ;; 実行内容
 1 2 3)                                 ; => 6


;;; ELisp: Built-in functions

;; リストを作成する(可変引数)
(list 1 2 '(3 4) 5)                     ; => (1 2 (3 4) 5)

;; リスト同士を連結する
(append '(1 2) '(3 4 5) '(6))           ; => (1 2 3 4 5 6)
(append '(1 2) '((3 4) 5) 6)            ; => (1 2 (3 4) 5 . 6)

;; リストの要素数を取得する
(length '(a b c d))                     ; => 4

;; リストのn番目を取得する
(nth 2 '(1 2 3 4 5))                    ; => 3

;; リストのn番目以降のリストを取得する
(nthcdr 2 '(1 2 3 4 5))                 ; => (3 4 5)

;; リストの最後の要素(を持つリスト)を取得する
(last '(1 2 3 4 5))                     ; => (5)
;; リストの後ろからn要素までを含むリストの取得もできる
(last '(1 2 3 4 5) 2)                   ; => (4 5)

;; リスト内を平坦に並べる
(flatten-list '(1 (2 (3 4) () 5) (6)))  ; => (1 2 3 4 5 6)

;; リスト構造が同じかを判定する
(equal '(a b c) '(a . (b . (c . nil)))) ; => t
;; eqとは違い, 構造が同じなら判定がtとなる
(setq obj '(1 2 3))
(equal obj '(1 2 3))                    ; => t
(eq obj '(1 2 3))                       ; => nil

;; ミニバッファ(EmacsのUI下部)にメッセージを出力する
(message "Hello World!")                ; => "Hello World!"
(message "0.1 + 0.2 = %.4f" (+ .1 .2))  ; 文字列整形もできる
;; => "0.1 + 0.2 = 0.3000"


;; setq: 大域変数(Global Variable)を定義
(setq val '(1 (2 . a) "i am string"))
;; 連続で変数を定義することもできる
(setq S1 "this is string."              ; => "this is string."
      ;; S式の評価結果を代入することもできる
      S2 (car (cdr (cdr val)))          ; => "i am string"
      L1 '(1 2 3)                       ; => (1 2 3)
      L2 '(4 5 6))                      ; => (4 5 6)

;; 引き続き変数の値を利用できる
(list S1 L2) ;; => ("this is string." (4 5 6))

;; let: 局所変数(Local Variable)を定義
(let ((L1 '(a b c))
      (L2 '(d e f)))
  ;; L1, L2 の値は(1 2...)から(a b...)にセットされた(Local)
  (append L1 L2)) ;; => (a b c d e f)

;; L1, L2 の値は(1 2...)に戻された(Global)
(append L1 L2) ;; => (1 2 3 4 5 6)
;; setqで値を置き換えると変更が保持されている
(setq L1 '(a b c) L2 '(d e f))
(append L1 L2) ;; => (a b c d e f)

;; 複数のS式を順次実行
(progn
  (setq x 100 y 200)                    ; => 200
  (setq ans (+ x y))                    ; => 300
  (if (<= x y) (setq st "smaller") (setq st "larger"))
  ;; => "smaller"
  (message "x + y = %d, and x is %s than y." ans st)
  ;; => "x + y = 300, and x is smaller than y."
  )

;; 別のファイルを読み込む
;; "hello_world.el"からhello-world関数をインポート
(load-file "hello_world.el")            ; => t
(hello-world)                           ; => "Hello World!"


;;; emacsのコメント

"
Emacs Lispには複数行コメントが存在しないが,
文字列を代わりに使うことがある
"

;;;; High-Level Hedding comment
"大きな区切りで使われる傾向にある"

;;; Middle-Level Hedding comment
"セクション名として使われる傾向にある"

;; Indent level comment
"一般的なコメントの用途で使われる"

; End-line comment
"基本的に右側の同じ列に揃えられる"

;;; コメントの使用例

((lambda (start end)
   "summand of start to end"            ; Documentation String
   ;; Body
   (/ (- (* end (+ end 1))
         (* start (- start 1))) 2))
 ;; startからendまでの整数和
 50 100)                                ; => 3825


;; For more details: GNU Emacs Lisp Documentation
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/index.html

(emacs-version)
;; => "GNU Emacs 27.1 (build 1, x86_64-pc-linux-gnu, GTK+ Version 3.24.20, cairo version 1.16.0)
;;     of 2020-09-20"

