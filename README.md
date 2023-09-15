# 概要
みかん本の勉強リポジトリ

とりあえずやっていき

## セットアップ
ここに成果物の走らせ方を書く
```bash
# この README.md ファイルと同じディレクトリ内で実行
make
```

# 進捗
```
2023/09/15  ch: 10.4 (p.259)
2023/09/14  ch: 10.3 (p.253)
2023/09/03  ch: 9.7 (p.245) (revision done)
2023/08/28  ch:   ? (boot failure caused by bad Makefile recipe resolved)
2023/08/25  ch:   ? (unknown bugs)
2023/08/04  ch: 9.7 (p.245) (from ch 9.5 to be revised)
2023/07/28  ch: 9.3 (p.225)
2023/07/26  ch: 9.2 (p.209)
2023/06/28  ch: 8.7 (p.204)
2023/06/27  ch: 8.6 (p.197)
2023/05/30  ch: 8.5 (p.190)
2023/05/23  ch: 8.2 (p.184)
2023/05/22  ch: 7.6 (p.171)
2023/05/15  ch: 6.4 (p.160)
2023/05/02  ch: 6.4 (p.157)
2023/04/24  ch: 6.4 (p.155)
2023/03/21  ch: 6.4 (p.153)
2023/03/07  ch: 5.6 (p.133)
2023/02/27  ch: 5.6 (p.133)
2023/02/21  ch: 4.5 (p.115)
2023/02/15  ch: 4.4 (p.109)
2023/02/14  ch: 4.3 (p.102)
2022/12/12  ch: 3.3 (p.81)
2022/11/30  ch: 3.1 (p.70)
2022/11/28  ch: 2.4 (p.54)
2022/11/23  ch: 2.1 (p.48)
2022/11/21  ch: 1.3 (p.34)
2021/12/20  ch: 0.5 (p.20) (初日)
```

## やること (TODO)
- とにかく読み進める

## やったこと
- 環境構築
    - ansible, Okteta など
- システムフォントを流用
    - ブートサービスに ASCII を描かせたのを frame_buffer 経由で取得

## やりたいこと
- 備忘録としてやったことについて出来るだけ漏らさず記録したい
    - 記事かレポートでも書くぐらいの姿勢で
- (諸々終わった後)ネットワークインターフェースの実装をしたい
- UEFI のフォントデータを再利用したい (23/02/27)
    - 再利用できた (font.hpp 参照)


# 参考文献
参照サイト増え次第追加していく

## サポートサイト
- 「ゼロからの OS 自作入門」サポートサイト
    - https://zero.osdev.jp/
- GitHub リポジトリ
    - https://github.com/uchan-nos/mikanos-build
- マイナビ出版サポートページ
    - https://book.mynavi.jp/supportsite/detail/9784839975869.html
