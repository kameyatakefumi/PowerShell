
# Add-Type で アセンブリを読込
Add-Type -AssemblyName System.Windows.Forms

# クリップボードクラスを変数へ代入
$clipborad = [System.Windows.Forms.Clipboard]

# クリップボードへ値を代入
$clipborad::SetText("Hello World")

# クリップボードの値を出力
Write-Host $clipborad::GetText()

# これでもいける
[System.Windows.Forms.Clipboard]::SetText("IKERU")
Write-Host ([System.Windows.Forms.Clipboard]::GetText())