# Add-Type -AssemblyName System.Windows.Markup
Add-Type -AssemblyName PresentationFramework

# [xml] $xaml = @'
$xaml = @'
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    Title="�{�^�������̃E�B���h�E"
    Width="250" Height="100">

    <Button Name="button">����</Button>
</Window>
'@

# $reader = New-Object System.Xml.XmlNodeReader($xaml)
# $frm = [System.Windows.Markup.XamlReader]::Load($reader)
$frm = [System.Windows.Markup.XamlReader]::Parse($xaml)

$btn = $frm.FindName("button")
$btn.Add_Click({
    $frm.Close()
})

$frm.ShowDialog()