# ========================================
# VSCodeをインストールする
# ----------------------------------------
# ポータブル版を利用する
# ========================================

Write-Output VSCode（ポータブル版）をインストールする。
scoop install vscode-portable

# shell:sendtoにショートカットを作成
$WsShell = New-Object -ComObject WScript.Shell
$Shortcut = $WsShell.CreateShortcut("${env:userprofile}\AppData\Roaming\Microsoft\Windows\SendTo\code.lnk")
$Shortcut.TargetPath = 'C:\usr\local\scoop\shims\code.cmd'
$Shortcut.Save()

# VSCode拡張機能をインストール
# code --install-extension [name]

# カッコの開始と終了を自動で色分けし、開始と終了を線で繋いでくれる
code --install-extension CoenraadS.bracket-pair-colorizer

# csvデータを色付け
# code --install-extension mechatroner.rainbow-csv

# logデータを色付け
# code --install-extension emilast.LogFileHighlighter

# 関連付けられた外部アプリで開く
# code --install-extension YuTengjing.open-in-external-app
