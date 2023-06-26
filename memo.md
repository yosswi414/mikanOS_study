# メモ
作業の過程で知っておくべき事項 (及び付随する不明点) とかをまとめる

分類出来る程度に分量が増えたら見出しを作る

## git
- 初回に叩いたコマンド
    - `git add <file>`
    - `git commit -m <message>`
    - `git remote add <new_remote> <URL>`
    - `git branch -M <new_local>`
    - `git push -u <remote> <local>`
        - `-u` の意味は？
- コミットメッセージを書く
    - `Update README.md`
    - `Update memo.md to add links`
    - [\[転載\] gitにおけるコミットログ/メッセージ例文集100](https://gist.github.com/mono0926/e6ffd032c384ee4c1cef5a2aa4f778d7)
- 直前のコミットの取り消し
    - `git reset --soft HEAD^`
        - `--soft` はファイルに変更は加えずコミット自体のみ削除
        - `--hard` にするとファイルごと遡るため変更が失われる
        - `HEAD^^`, `HEAD^^^`, ... で 2, 3, ... 個前のコミットまで遡る注意
    - [\[Git\]コミットの取り消し、打ち消し、上書き - Qiita](https://qiita.com/shuntaro_tamura/items/06281261d893acf049ed)
- ステージング (`git add`) の取り消し
    - `git reset HEAD [file]`
        - `[file]` を指定しないとステージングされた全ファイルのインデックスを削除する
        - `[file]` を指定するとそのファイルのインデックスのみを削除する
    - [git add の取り消し方法](https://proengineer.internous.co.jp/content/columnfeature/6969)
    - `git restore --staged <file>` でもよい
- ファイルの追跡停止
    - `git rm --cached <file>`
        - `--cached` を省くとファイルの実体も削除される

## ansible
- 環境構築時
    - "Distribution Ubuntu 20.04 on host localhost should use /usr/bin/python3, ..." の警告
        - https://qiita.com/latin1/items/98212c81ba8f5e83b6ca
    - "Skipping plugin (...) as it seems to be invalid: cannot import name 'environmentfilter' from 'jinja2.filters'"
        - よくわからんまま解決 (アプデで直る？)

## debug
- gdb
    - `run_image.sh` で `qemu-system-x86_64` のオプションに `-s -S` を付ける
    - 起動後、`gdb` で `target remote :1234` で接続
    - `file workspace/mikanos/kernel/kernel.elf` でイメージ読み込み
    - [qemu上のmikanOSをgdbでデバッグする方法](https://tomiylab.com/2021/09/gdb-mikanos/)
    - [GDBの使い方メモ](https://nkon.github.io/Gdb-basic/)