# ========================================
# VSCodeでSpringBootの開発ができるようにする
# ----------------------------------------
# Gradleを利用できるようにする
# ========================================

# Javaのインストール
## Java Bucketを追加
scoop bucket add java
## OracleJavaをインストール
scoop install oraclejdk

# gradleのインストール
scoop install gradle

# mavenのインストール
# scoop install maven

# VSCode拡張機能をインストール
# code --install-extension [name]
code --install-extension pivotal.vscode-boot-dev-pack
