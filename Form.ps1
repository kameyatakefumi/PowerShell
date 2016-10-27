Add-Type -AssemblyName System.Windows.Forms

$frm = New-Object System.Windows.Forms.Form
$frm.Text = "ウィンドウタイトル"

$btn = New-Object System.Windows.Forms.Button
$btn.Text = "終了"
$btn.Add_Click({
    $frm.Close()
})
$btn.Add_Click($block)

$frm.Controls.Add($btn)
$frm.ShowDialog()