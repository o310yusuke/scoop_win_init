# ========================================
# PythonでAI-OCRを利用するためのツールインストール
# ----------------------------------------
# 特記事項なし
# ========================================

# tesseractをインストール
scoop install tesseract

# tesseractの言語ファイルをインストール
scoop install tesseract-languages

# pyocrをインストール
Write-Output "----------------------------------------"
Write-Output "pyocrをインストールしましょう。そのためにまずPython仮想環境を準備しましょう。"
Write-Output "    $ cd [project directory]" "    $ python -m venv [new venv name]"
Write-Output "    ※[new venv name]は「venv」にしておくと、何のためのディレクトリか後で分かりやすい"
Write-Output "仮想環境を作成後に下記コマンドを実行してpyocrをインストール"
Write-Output "    $ python -m pip install pyocr"
Write-Output "----------------------------------------"

# VSCode拡張機能をインストール
# code --install-extension [name]
