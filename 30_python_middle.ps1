# ========================================
# Pythonに関するミドルウェアをインストールする
# ----------------------------------------
# 特記事項なし
# ========================================

# Pythonのインストール
scoop install python

# # Python2のインストール
# scoop bucket add versions
# scoop install python27

# pipのバージョンアップ
python -m pip install --upgrade pip

# pylintをインストール
python -m pip pylint


# VSCode拡張機能をインストール
# code --install-extension [name]
code --install-extension ms-python.python

