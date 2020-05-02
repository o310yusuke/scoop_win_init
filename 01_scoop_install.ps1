# ========================================
# Scoopをインストールするためのバッチ
# ----------------------------------------
# インストール場所： C:\usr\local\scoop
# ========================================

# Powershellバッチファイルの実行権限を変更する
set-executionpolicy remotesigned -scope currentuser

# Scoopのインストールディレクトリを環境変数に設定する
$env:SCOOP='C:\usr\local\scoop'
[environment]::setEnvironmentVariable('SCOOP',$env:SCOOP,'User')

# Scoopをインストールする
Write-output Scoopのインストールを開始します。
iwr -useb get.scoop.sh | iex
