@echo off
cd /d %~dp0

rem ========================================
rem scoopを用いて開発環境を準備するためのバッチ
rem ----------------------------------------
rem 特記事項なし
rem ========================================

rem Scoopインストール用のバッチファイルを呼び出す
powershell -NoProfile -ExecutionPolicy remotesigned .\01_scoop_install.ps1

rem ユーティルをインストール
powershell .\02_scoop_utils.ps1

rem VScodeをインストール
powershell .\05_vscode.ps1
