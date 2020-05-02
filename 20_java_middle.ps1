# ========================================
# Javaに関するミドルウェアをインストールする
# ----------------------------------------
# 特記事項なし
# ========================================

# Javaのインストール
## Java Bucketを追加
scoop bucket add java
## OracleJavaをインストール
scoop install oraclejdk

# Tomcatのインストール
scoop install tomcat

# # Tomcat8のインストール
# scoop bucket add versions
# scoop install tomcat8

# VSCode拡張機能をインストール
# code --install-extension [name]
code --install-extension vscjava.vscode-java-pack
code --install-extension adashen.vscode-tomcat
