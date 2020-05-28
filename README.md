# Windows環境構築
## 目的
- Windowsで開発を行うために必要となるツールをコードベースで管理したい。
- Chocolateyは管理者権限が必要で好みではないと思っていたら、scoopが管理者権限なしで利用できることを知る。
- やってみたら結構良くて、powershellベースでバッチ化もできそう。

## 方針
- Windowsのユーザフォルダは汚さないようにし、削除するときに分かりやすくしておく（特定のディレクトリをごっそり削除とか）

## ファイルと目的
- 00_scoop_preparation.bat : scoopをインストールするスクリプトを実行（05までは実行）
- 01_scoop_install.ps1 : インストールディレクトリを設定し、インストール
- 02_sccop_utils.ps1 : gitなどscoopを利用するために最低限必要な物をインストール
- 05_vscode.ps1 : IDEとしてMicrosoftのVSCodeを使いたいめ、インストール
    - 拡張機能のディレクトリをユーザフォルダにしたく、ポータル版を利用
- 10_markdown.ps1 : VSCodeでmarkdownを利用するためのツールをインストール
- 20_java_middle.ps1 : tomcatでWebアプリを開発できるようにjdkとtomcatをインストール
    - JDK： OracleJDK
    - VSCodeExtensionも必要に応じて
- 21_java_springboot.ps1 : SpringBootを用いた開発ができるようにVSCodeExtension含め関連ツールをインストール
- 30_python_middle.ps1 : pythonの開発環境をインストール（pipのupgradeも）
- 40_ruby_middle.ps1 : rubyの開発環境をインストール
- 50_powershell.ps1 : Powershellの開発環境をインストール
- 90_other.ps1 : その他、便利ツールのインストール
- README.md : 本ファイル

## 利用方法
- コマンドプロンプトを起動し、「00_scoop_preparation.bat」を実行
    - 01_scoop_install.ps1
    - 02_sccop_utils.ps1
    - 05_vscode.ps1
- 必要に応じて、他のスクリプトをpowershellで実行
    - 下記のように実行する
        ```sh
        powershell -NoProfile -ExecutionPolicy remotesigned .\xxxx.ps1
        ```