Add-Type -AssemblyName System.Windows.Forms
$primaryScreen = [System.Windows.Forms.Screen]::PrimaryScreen
# Write-Host $primaryScreen
Write-Host $primaryScreen.Bounds.Width
Write-Host $primaryScreen.Bounds.Height