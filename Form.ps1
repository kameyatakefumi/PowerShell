Add-Type -AssemblyName System.Windows.Forms

$frm = New-Object System.Windows.Forms.Form
$frm.Text = "�E�B���h�E�^�C�g��"

$btn = New-Object System.Windows.Forms.Button
$btn.Text = "�I��"
$btn.Add_Click({
    $frm.Close()
})
$btn.Add_Click($block)

$frm.Controls.Add($btn)
$frm.ShowDialog()