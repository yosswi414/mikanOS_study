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
        - `--hard` にするとファイルごと遡るため変更が失われるので
        - `HEAD^^`, `HEAD^^^`, ... で 2, 3, ... 個前のコミットまで遡る注意
    - [\[Git\]コミットの取り消し、打ち消し、上書き - Qiita](https://qiita.com/shuntaro_tamura/items/06281261d893acf049ed)
- ステージング (`git add`) の取り消し
    - `git reset HEAD [file]`
        - `[file]` を指定しないとステージングされた全ファイルのインデックスを削除する
        - `[file]` を指定するとそのファイルのインデックスのみを削除する
    - [git add の取り消し方法](https://proengineer.internous.co.jp/content/columnfeature/6969)