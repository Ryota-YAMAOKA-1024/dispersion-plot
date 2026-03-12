# dispersion-plot

HRC の分散プロット用 `gnuplot` スクリプト集です。

## ディレクトリ構成

- `00L/`
  - `q_E.gp`
  - `E_q_w.txt`
- `HH0/`
  - `q_E.gp`
  - `E_q_w_q1q2.txt`
- `K-K0/`
  - `q_E.gp`
  - `E_q_w.txt`
- `list.txt`（共通パラメータ）

## 共通パラメータ

`list.txt` に以下を定義し、各 `q_E.gp` から `load '../list.txt'` で読み込みます。

- `SJ1`
- `SJc`

例:

```txt
SJ1 = 1.80008
SJc = -4.30179
```

## 実行方法

実行前に、必ず対象ディレクトリへ移動してから `gnuplot` を実行してください。

### K-K0

```bash
cd K-K0
gnuplot
load 'q_E.gp'
```

### HH0

```bash
cd HH0
gnuplot
load 'q_E.gp'
```

### 00L

```bash
cd 00L
gnuplot
load 'q_E.gp'
```

## 出力

各 `q_E.gp` は PDF を出力します。

- `K-K0/q_E.pdf`
- `HH0/q_E.pdf`
- `00L/q_E.pdf`

## 注意

- `load '../list.txt'` は相対パスです。`00L` / `HH0` / `K-K0` の中から実行する前提です。
- 一部スクリプトでは `fit` 行がコメントアウトされています。必要に応じて有効化してください。
