# �t�@�C���� Shift-JIS �ŕۑ�
$str = "����������"
Write-Host $str

# 932 shift_jis Japanese (Shift-JIS) ���{�� (�V�t�g JIS) �� byte�z�� �ɕϊ�
$byte = [System.Text.Encoding]::GetEncoding("shift_jis").GetBytes($str)
Write-Host $byte

# byte�z��� Base64������ �ɕϊ�
$base64 = [System.Convert]::ToBase64String($byte)
Write-Host $base64

#---

# Base64������ �� byte�z�� �ɕϊ�
$byte = [System.Convert]::FromBase64String($base64)
Write-Host $byte

# byte�z��� Shift-JIS������ɕϊ�
$str = [System.Text.Encoding]::GetEncoding("shift_jis").GetString($byte)
Write-Host $str