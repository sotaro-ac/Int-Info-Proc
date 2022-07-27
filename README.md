# 知識情報処理 with LISP / Prolog

LISPやPrologを使って基本的な知識情報処理(主にグラフ探索)を行いましょう！


## 実行環境

### LISPの実行環境：
- LISPの数ある方言の中でも「**Emacs Lisp** (ELisp)」を使います．
- GNU Emacs（テキストエディタ）を用意してください．
> ELispは主流なLISP方言群であるSchemeやCommom Lispとは大きく異なる部分がある(らしいです)が，ここでは**純LISP**で使用される最も基本的な関数(`car`, `cdr`, `cons`, `eq`, `atom`)や特殊形式(`cond`, `quote`, etc.)，シンボル（`t`, `nil`）のみを利用してプログラムを記述しています．

### Prologの実行環境：
- Prologの数ある処理系の中でも「**SWI-Prolog**」を使います．
- 任意のWebブラウザから「[SWISH -- SWI-Prolog for SHaring](https://swish.swi-prolog.org/)」に接続してください（今回はこちらを利用）．
- Linux環境であれば `swi-prolog` パッケージをインストールすることでSWI-Prologの処理系を用意できます．
> ちなみに，Prologは述語論理に基づいた宣言型言語であり，関数ではなく**述語**をプログラムで定義していきます．


## 実行方法

### Emacs Lispの場合：
- `***.el` で終わるテキストファイルにELispのコードを書きます．
- その他のテキストファイルでも `M-x emacs-lisp-mode` コマンドを実行することでEmacs-Lispモードに切り替えられます（ELispとしてテキストを認識します）．
  > 多くの場合，`M-x` は `Alt-x` に相当します．
- 実行したい行末にポイント(カーソル)を合わせて `C-x C-e` を実行することで，直前のLisp式を評価できます（結果はミニバッファに表示されます）．
  > `lispxmp` を導入できると実行結果を非常に確認しやすくなるのでオススメです．
- 参考になりそうなサイト：
  - [Emacs Wiki | [Home] Lisp Xmp](https://www.emacswiki.org/emacs/LispXmp) 
  - [Zenn | [Emacs] M-; の連続タイプで => を入力する方法](https://zenn.dev/megeton/articles/583bee3ec04403)
  - [Zenn | Emacs-Lisp入門 2021](https://zenn.dev/zenwerk/scraps/d7c991acd30d40)

### SWI-Prologの場合：
- ここではWebブラウザで「SWISH」を利用する方法を説明します．
  > コマンドラインシェルからSWI-Prologを利用する場合，`<file_name>.pl` というファイルにPrologのプログラムを記述し，`prolog` のCLIを起動してから `consult(<file_name>).` または `[<file_name>].` と入力することでファイル内の式を読み込むことができます（`true`が表示されたら成功です！）．
  > ちなみに `prolog` を終了するには `halt.` と入力してください．
- 直感的な画面設計なので，特に解説は必要ないかもしれません．
- 画面左のタブに `[Program]` か `[Notebook]` を追加して，そこにPrologのプログラムを記述します．
- 右下のテキストボックス(左枠に"?-"と書かれている入力欄)に質問(評価したい式)を入力します．
- 参考になりそうなサイト：
  - [Qiita | Prolog入門](https://qiita.com/a163236/items/c99cd16ddf77e2228719#%E3%81%8A%E3%82%8F%E3%82%8A%E3%81%AB)
  - [SWI-Prolog | Manual](https://www.swi-prolog.org/pldoc/doc_for?object=manual)
  - [library(lists): List Manipulation](https://www.swi-prolog.org/pldoc/man?section=lists)


## 作成したプログラム

### Emacs Lisp

- **Hello Lisp!**：[`elisp/hello_world.el`](elisp/hello_world.el)
  - 最初の儀式．`"Hello World!"` を出力します．

- Coming Soon...

### SWI-Prolog

- **Hello Prolog!**：[`prolog/hello_world.pl`](prolog/hello_world.pl)
  - 最初にやる定番．`"Hello World!"` を出力します．

- Coming Soon...

<!-- 
## ライセンス表記 (Lisence)

This product is NOT under lisence in this version.
-->
