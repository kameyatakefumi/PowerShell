# Array
$array = "A", "B", "C"
Write-Host ($array[0] + ", " + $array[1] + ", " + $array[2])

# Array Integer
$array = 1..10
Write-Host ("array = " + $array)

# Loop
foreach ($item in @(1, 2, 3, 4)) {
    Write-Host $item
}

# Associative array
$map = @{hoge="hoge"; fugo="fugo"}
Write-Host ($map["hoge"] + $map["fugo"])

# List
$list = New-Object System.Collections.ArrayList
$list.Add("Hello")
$list.Add("world") > $null
[void] $list.Add("!")
Write-Host ($list[0] + ", " + $list[1])

# for
for ($item = 0;$item -lt 3; $item++) {
    Write-Host $item
}

# If
if ($true) {
    Write-Host "TRUE"
}

# If-ElseIf-Else
if ($false) {
    Write-Host "TRUE"
} elseif ($true) {
    Write-Host "ELSEIF"
} else {
    Write-Host "ELSE"
}

# Compare
