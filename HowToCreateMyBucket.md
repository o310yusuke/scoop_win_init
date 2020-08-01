# 独自Bucketの作り方

## 目的
社内で許可されたアプリを設定できるように、独自のBucketを作りたかった。
そのため、ファイルサーバ上に独自Bucketを作る方法を調査した。
なお、作業は全てPowershell上で実行する。

- リモートリポジトリパス
  - \\\sharedhost\myBucket\
- ローカルリポジトリパス
  - C:\usr\local\workspace\myBucket
- テスト用アプリ格納ディレクトリ
  - \\\sharedhost\archive\

## 手順
### ファイルサーバにリモートリポジトリを作成する
#### ローカルにて、リモートリポジトリを作成する
1. リポジトリ用のディレクトリ「C:\usr\share\gitrepo\scoop\mybucket」を作成する
   ```bash
   > mkdir C:\usr\share\gitrepo\scoop\myBucket
   ```
2. 共有リポジトリ（bareリポジトリ）を作成する
   ```bash
   > cd C:\usr\share\gitrepo\scoop\myBucket
   > git init --bare --shared
   ```
3. ローカルに作成したリポジトリをファイルサーバにアップして、リモートリポジトリとする
    - 例：\\\sharedhost\myBucket\
4. リモートリポジトリをクローンする
   ```bash
   > cd C:\usr\local\workspace
   > git clone \\sharedhost\myBucket
   ```

### リモートリポジトリにテストアプリを登録する
#### テストアプリ「scoopbuckettest」を作成する
1. 「scoopbuckettest.bat」を作成する
   ```bash
   > echo 'hello scoop myBucket test.'
   ```
2. 「scoopbuckettest.bat」を圧縮し、ZIPファイル化する（今回は7zで）
   ```bash
   > 7z a .\scoopbuckettest.zip .\scoopbuckettest.bat
   ```
3. 作成した「scoopbuckettest.zip」「scoopbuckettest.bat」をテスト用アプリ格納ディレクトリにアップする

#### マニフェストファイルを作成し、ローカルリポジトリにコミットする
1. クローンしたローカルリポジトリに移動する
   ```bash
   > cd C:\usr\local\workspace\myBucket
   ```
2. テストアプリのマニフェストファイル「scoopbuckettest.json」を作成する
   - パスの区切り文字は「\」ではなく「/」に置き換えが必要
   ```json
   {
        "version": "1.0",
        "url": "file:////sharedhost/archive/scoopbuckettest.zip",
        "bin": "scoopbuckettest.bat"
   }
   ```
3. 作成したマニュフェストファイルをローカルリポジトリにコミット
   - 事前にgitの設定として、ユーザ名、メアドが登録済みであること
   ```bash
   > git add .\scoopbuckettest.json
   > git commit -m "first commit"
   ```
#### テストアプリのマニュフェストファイルをリモートリポジトリにプッシュする
1. リモートリポジトリにプッシュする
   ```bash
   > git push origin master
   ```
### テストアプリをscoopでインストールする
#### scoopに独自Bucketを追加する
1. リモートリポジトリとして準備した独自Bucketを追加する
   ```bash
   > scoop bucket add myBucket \\sharedhost\myBucket

   Checking repo... ok
   The myBucket bucket was added successfully.
   ```
2. 登録されたことを確認する
   ```bash
   > scoop bucket list

   main
   myBucket
   ```
#### scoopを使って、テストアプリをインストール・起動してみる
1. 検索して、テストアプリ「scoopbuckettest」が検索できるか確認する
   ```bash
   > scoop search scoopbuckettest

    'myBucket' bucket:
        scoopbuckettest (1.0)
   ```
2. テストアプリ「scoopbuckettest」をインストールする
   - マニフェストファイルに、チェックサムの設定をしていないため、警告が出るが無視
   ```bash
   > scoop install scoopbuckettest

    Updating 'myBucket' bucket...
    Scoop was updated successfully!
    Installing 'scoopbuckettest' (1.0) [64bit]
    scoopbuckettest.zip (205 B) [===========================================] 100%
    WARN  Warning: No hash in manifest. SHA256 for 'scoopbuckettest.zip' is:
        7b88d970561df7721841560b4d84f1b0e19fc3f3df2718920309773c85a2474c
    Extracting scoopbuckettest.zip ... done.
    Linking C:\usr\local\scoop\apps\scoopbuckettest\current => C:\usr\local\scoop\apps\scoopbuckettest\1.0
    Creating shim for 'scoopbuckettest'.
    'scoopbuckettest' (1.0) was installed successfully!
   ```
3. インストールを確認する
   ```bash
   > scoop list

      scoopbuckettest 1.0 [myBucket]
   ```
4. 起動してみる
   ```bash
   > scoopbuckettest

    >echo 'hello scoop myBucket test.'
    'hello scoop myBucket test.'
   ```

### 既に公開されているアプリを独自Bucketに追加する
extras bucketで公開されている「eclipse-java」を追加してみる

#### Githubに公開されているBucketに登録されているか調査する
1. 下記のサイトにアクセスし「bucket」ディレクトリ内で対象アプリを検索する
   - [Main Bucket](https://github.com/ScoopInstaller/Main)
   - [Extras Bucket](https://github.com/lukesampson/scoop-extras)
   - [Versions Bucket](https://github.com/ScoopInstaller/Versions)
   - [Java Bucket](https://github.com/ScoopInstaller/Java)

#### マニフェストファイルを取得し、独自Backetに追加する
1. マニフェストを表示し、RowボタンをGithub上で右クリックし、名前を付けて保存し、ダウンロードする
   - https://github.com/lukesampson/scoop-extras/blob/master/bucket/eclipse-java.json
   - 保存先： C:\usr\local\workspace\myBucket
2. ダウンロードしたマニフェストを、ローカルリポジトリにコミットする
   ```bash
   > git add eclipse-java.json
   > git commit -m "add eclipse-java from extra bucket"
   ```
3. リモートリポジトリにプッシュする
    ```bash
    > git push origin master
    ```
#### 独自Bucketからインストールする
1. scoopでBucketの更新を取得する
   ```bash
   > scoop update

    Updating Scoop...
    Updating 'main' bucket...
    Updating 'myBucket' bucket...
    * 9784ddf add eclipse-java from extra bucket                            7 minutes ago
    Scoop was updated successfully!
   ```
2. 対象アプリをBucketから検索する
   ```bash
   > scoop search eclipse

    'myBucket' bucket:
        eclipse-java (2020-06)
   ```
3. 対象アプリをインストールする
   ```bash
   > scoop install eclipse-java

    Installing 'eclipse-java' (2020-06) [64bit]
    eclipse-java-2020-06-R-win32-x86_64.zip (208.1 MB) [=======================================] 100%
    Checking hash of eclipse-java-2020-06-R-win32-x86_64.zip ... ok.
    Extracting eclipse-java-2020-06-R-win32-x86_64.zip ... done.
    Linking C:\usr\local\scoop\apps\eclipse-java\current => C:\usr\local\scoop\apps\eclipse-java\2020-06 Creating shortcut for Eclipse IDE for Java Developers (eclipse.exe)
    'eclipse-java' (2020-06) was installed successfully!
   ```


## 参考サイト
### Scoop関連
- [共有フォルダでScoop bucketを運用（超お手軽）](https://qiita.com/Teramonte4/items/d7efa004ae2fa1cc4ecd)
- [Scoopを使ったWindows環境構築のススメ - Super!!](https://qiita.com/Dooteeen/items/12dc8fb14042888113d0)

### GIｔ関連
- [Gitリポジトリを共有フォルダ・ファイルサーバに置く](https://syon.github.io/til/2018/11/18/git-fileserver/)
- [共有フォルダで始めるGit](https://qiita.com/fukasawah/items/64ccbdab761012aa12a6)
