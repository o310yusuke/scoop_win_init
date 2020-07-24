# ========================================
# VSCodeでMarkdownを利用する環境を構築する
# ----------------------------------------
# PlantUMLを利用できるようにする
# ========================================

# Javaのインストール
## Java Bucketを追加
scoop bucket add java
## OracleJavaをインストール
scoop install oraclejdk

# Graphvizのインストール
scoop install graphviz

# VSCode拡張機能をインストール
code --install-extension jebbs.plantuml
code --install-extension shd101wyy.markdown-preview-enhanced
code --install-extension yzhang.markdown-all-in-one
