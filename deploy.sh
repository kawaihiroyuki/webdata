#!/bin/bash
echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# サイトをビルド
hugo

# 変更ファイルをgitに追加
git add -A

# コミット（引数があればそれをコミットメッセージにする）
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# 親フォルダ（全ファイル）をプッシュ
git push origin master

# 公開用フォルダ（サブモジュール）をプッシュ
git subtree push --prefix=public https://github.com/kawaihiroyuki/kawaihiroyuki.github.io.git master
