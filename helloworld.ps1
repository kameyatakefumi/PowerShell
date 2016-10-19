# Comment
Write-Host "Hello world!"

# Variable
$msg = "hello world!!"
Write-Host $msg

# Variable Types
[string] $str = "String"
[int] $int = 999
Write-Host $str.GetType()
Write-Host $int.GetType()

# String literal
$msg = "world"
Write-Host "hello $msg"
Write-Host "hello ${msg}!"

# String append
Write-Host ("hello" + " " + "world")

# Heredocument
Write-Host @"
One
Two
Three
"@