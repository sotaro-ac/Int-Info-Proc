# 知識情報処理 with LISP / Prolog

LISPやPrologを使って基本的な知識情報処理(主にグラフ探索)を行いましょう！

> 当ドキュメントは初歩的なプログラミングの知識がある方向けに作成しています．
> 例えば，四則演算(`+,-,*,/,%[mod]`)や条件式の解釈および制御(`if (...) else ...`)，関数の定義(e.g.,`def func (args...) {...}`)，特にデータ構造(配列やリスト)による**有向/無向グラフの表現**についての理解が必要です．

## 実行環境

### LISPの実行環境：
- LISPの数ある方言の中でも「**Emacs Lisp** (ELisp)」を使います．
- GNU Emacs（テキストエディタ）を用意してください．
> ELispは主流なLISP方言群であるSchemeやCommom Lispとは大きく異なる部分があるようですが，ここでは多くのLISPで使用される最も基本的な関数(`car`, `cdr`, `cons`, `eq`, `atom`)や特殊形式(`cond`, `quote`, etc.)，シンボル（`t`, `nil`）をベースにプログラムを記述しています．

### Prologの実行環境：
- Prologの数ある処理系の中でも「**SWI-Prolog**」を使います．
- 任意のWebブラウザから「[SWISH -- SWI-Prolog for SHaring](https://swish.swi-prolog.org/)」に接続してください（今回はこちらを利用）．
- Linux環境であれば `swi-prolog` パッケージをインストールすることでSWI-Prologの処理系を用意できます．
- Prologファイルの拡張子は「`.pl`」がよく使われますが，別のプログラミング言語であるPerlも同じ拡張子を使うことがあるため，競合する場合は「`.pro`」「`.prolog`」を代わりに使う手もあります（特にSWI-Prologの場合は`.swi`を使うことがあるみたいです）．
> ちなみに，Prologは述語論理に基づいた宣言型言語であり，関数ではなく**述語**をプログラムで定義していきます．SWI-Prolog以外の処理系ではGNU Prologが有名です．


## 実行方法

### Emacs Lispの場合：
- `***.el` で終わるテキストファイルにELispのコードを書きます．
- その他のテキストファイルでも `M-x emacs-lisp-mode` コマンドを実行することでEmacs-Lispモードに切り替えられます（ELispとしてテキストを認識します）．
  > 多くの場合，`M-x` は `Alt-x` に相当します．
- 実行したい行末にポイント(カーソル)を合わせて `C-x C-e` を実行することで，直前のLisp式を評価できます（結果はミニバッファに表示されます）．
  > `lispxmp` を導入できると実行結果を非常に確認しやすくなるのでオススメです．
- 参考になりそうなサイト：
  - [GNU Emacs Lisp Reference Manual [日本語]](https://ayatakesi.github.io/lispref/28.1/elisp-ja.html)
  - [Emacs Wiki | [Home] Lisp Xmp](https://www.emacswiki.org/emacs/LispXmp) 
  - [Zenn | [Emacs] M-; の連続タイプで => を入力する方法](https://zenn.dev/megeton/articles/583bee3ec04403)
  - [Zenn | Emacs-Lisp入門 2021](https://zenn.dev/zenwerk/scraps/d7c991acd30d40)

### SWI-Prologの場合：
- ここではWebブラウザで「SWISH」を利用する方法を説明します．
- 直感的な画面設計なので，特に解説は必要ないかもしれません．
- 画面左のタブに `[Program]` か `[Notebook]` を追加して，そこにPrologのプログラムを記述します．
- 右下のテキストボックス(左枠に"?-"と書かれている入力欄)に質問(評価したい式)を入力します．
- コマンドラインシェルからSWI-Prologを利用する場合：
  - `<file_name>.pl` というファイルにPrologのプログラムを記述し，`prolog` のCLIを起動してから `consult(<file_name>).` または `[<file_name>].` と入力することでファイル内の式を読み込むことができます（`true`が表示されたら成功です！）．
  - Ex.) `?- [filename]  % filename.pl の場合`
  - `[<file_name>].`で読み込める拡張子としては`.pl`の他に`.prolog`があります
  - 他の拡張子を持つ場合は `['<file_name>.txt']` のように拡張子まで含めたファイル名を`' '`で囲いましょう
  - `prolog` を終了するには `halt.` と入力してください
  - クエリ(質問)を強制終了するには`Ctrl+C`の後に`a`を入力することでabortできます
- 参考になりそうなサイト：
  - [Prolog - Quick Guide](https://www.tutorialspoint.com/prolog/prolog_quick_guide.htm)
  - [Qiita | Prolog入門](https://qiita.com/a163236/items/c99cd16ddf77e2228719#%E3%81%8A%E3%82%8F%E3%82%8A%E3%81%AB)
  - [SWI-Prolog | Manual](https://www.swi-prolog.org/pldoc/doc_for?object=manual)
  - [library(lists): List Manipulation](https://www.swi-prolog.org/pldoc/man?section=lists)


## 作成したプログラム

### Emacs Lisp

- **Hello Lisp!**：[`elisp/hello_world.el`](elisp/hello_world.el)
  - 最初の儀式．`"Hello World!"` を出力します．

- **ELisp Basics**：[`elisp/elisp_basics.el`](elisp/elisp_basics.el)
  - Lispの基本的なプログラムを書いてみよう．
    - 純LISPのデータ型, 関数, 特殊形式
    - ELispの組み込み関数/特殊形式
    - 別のファイルを読み込む(`load-file`)
    - ELispのコメントアウト方法
    > ELispの詳しい解説：[GNU Emacs Lisp Reference Manual [日本語]](https://ayatakesi.github.io/lispref/28.1/elisp-ja.html)


<!--

参考：https://jinnaiyuu.github.io/pdf/textbook.pdf

- **Blind Search**：[`elisp/blind_search.el`]()
  - 系統的な探索
  - 盲目的探索(i.e.力任せ探索：brute force_)
    - 木探索アルゴリズム：Tree Search Algorithm
    - グラフ探索アルゴリズム：Graph Search Algorithm
    - 深さ優先(縦型)探索：Depth-First Search
    - 幅優先(横型)探索：Breadth-First Search
    - ダイクストラ法：Dijkstra Algorithm

- **Heuristic Search**：[`elisp/heuristic_search.el`]()
  - 最適解の探索
  - 発見的探索(i.e., ヒューリスティク探索)
    - A*アルゴリズム：A* Algorithm
    - 貪欲最良優先探索：Greedy Best-First Search
    - 山登り法：Hill Climbing
    - 強制山登り法：Enforced Hill Climbing
-->

### SWI-Prolog

- **Hello Prolog!**：[`prolog/hello_world.pl`](prolog/hello_world.pl)
  - 最初にやる定番．`"Hello World!"` を出力します．

- **Prolog Basics**：[`prolog/prolog_basics.el`](prolog/prolog_basics.pl)
  - Prologの基本的なプログラムを書いてみよう．
    - 確定節：プログラムによる事実(Fact)の宣言, 規則(Rule)の定義
    - ゴール節：質問(Question/Query)による事実/規則の証明
    - データ型, 演算子(比較, 算術計算)
    - 再帰によるループ実装
    - リストの使い方
    - カット(`!`)について
    - Prologのより詳しい入門：[Prolog - Quick Guide](https://www.tutorialspoint.com/prolog/prolog_quick_guide.htm)

<!-- 
- **AND/OR Tree Search**：
  - 問題の分割
    - AND/ORグラフ(ツリー)
    - ハノイの塔

- **Game Tree Search**：
  - ゲーム木探索
  - 完全情報ゲーム
    - アルファ・ベータ法：Alpha-Beta pruning
    - ミニマックス法：Minimax
-->


## ライセンス表記 (Lisence)

The source codes in this repository are provided under the MIT License, see [LICENSE](LICENSE).
