# UTF-16 LE
$str = "あいうえお"
Write-Host $str

$byte = [System.Text.Encoding]::GetEncoding("shift_jis").GetBytes($str)
Write-Host $byte

$base64 = [System.Convert]::ToBase64String($byte)
Write-Host $base64

#---

$byte = [System.Convert]::FromBase64String($base64)
Write-Host $byte

$str = [System.Text.Encoding]::GetEncoding("shift_jis").GetString($byte)
Write-Host $str