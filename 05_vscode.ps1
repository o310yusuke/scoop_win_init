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

