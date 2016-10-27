# ファイルを Shift-JIS で保存
$str = "あいうえお"
Write-Host $str

# 932 shift_jis Japanese (Shift-JIS) 日本語 (シフト JIS) の byte配列 に変換
$byte = [System.Text.Encoding]::GetEncoding("shift_jis").GetBytes($str)
Write-Host $byte

# byte配列を Base64文字列 に変換
$base64 = [System.Convert]::ToBase64String($byte)
Write-Host $base64

#---

# Base64文字列 を byte配列 に変換
$byte = [System.Convert]::FromBase64String($base64)
Write-Host $byte

# byte配列を Shift-JIS文字列に変換
$str = [System.Text.Encoding]::GetEncoding("shift_jis").GetString($byte)
Write-Host $str