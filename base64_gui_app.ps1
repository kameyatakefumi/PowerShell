Add-Type -AssemblyName PresentationFramework

$xaml = @'
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    Title="Base64_GUI_App" Width="1024" Height="600">

    <Grid>
        <Grid.RowDefinitions>
            <RowDefinition Height="Auto" />
            <RowDefinition Height="*" />
            <RowDefinition Height="Auto" />
        </Grid.RowDefinitions>
        <Grid.ColumnDefinitions>
            <ColumnDefinition Width="*" />
            <ColumnDefinition Width="*" />
        </Grid.ColumnDefinitions>

        <Label Content="Input" Grid.Row="0" Grid.Column="0" />
        <TextBox Name="InputTextBox" Grid.Row="1" Grid.Column="0" AcceptsReturn="True" TextWrapping="Wrap" VerticalScrollBarVisibility="Auto" />

        <Label Content="Output" Grid.Row="0" Grid.Column="1" />
        <TextBox Name="OutputTextBox" Grid.Row="1" Grid.Column="1" AcceptsReturn="True" TextWrapping="Wrap" VerticalScrollBarVisibility="Auto" />

        <StackPanel Grid.Row="2" Grid.Column="0" Grid.ColumnSpan="2" Orientation="Horizontal">
            <Button Name="EncodeButton" Margin="3" Padding="5" Content="Encode" />
            <Button Name="DecodeButton" Margin="3" Padding="5" Content="Decode" />
            <Button Name="CopyToClipboardFromOutputButton" Margin="3" Padding="5" Content="Copy to clipboard from output" />
            <Button Name="ClearButton" Margin="3" Padding="5" Content="Clear" />
        </StackPanel>
    </Grid>
</Window>
'@

$frm = [System.Windows.Markup.XamlReader]::Parse($xaml)

$encodeButton = $frm.FindName("EncodeButton")
$encodeButton.Add_Click({

    $inputTextBox = $frm.FindName("InputTextBox")

    $byte = [System.Text.Encoding]::GetEncoding("shift_jis").GetBytes($inputTextBox.Text)
    $base64 = [System.Convert]::ToBase64String($byte)

    $outputTextBox = $frm.FindName("OutputTextBox")
    $outputTextBox.Text = $base64
})

$decodeButton = $frm.FindName("DecodeButton")
$decodeButton.Add_Click({

    $inputTextBox = $frm.FindName("InputTextBox")

    $byte = [System.Convert]::FromBase64String($inputTextBox.Text)
    $str = [System.Text.Encoding]::GetEncoding("shift_jis").GetString($byte)

    $outputTextBox = $frm.FindName("OutputTextBox")
    $outputTextBox.Text = $str
})

$copyToClipboardFromOutputButton = $frm.FindName("CopyToClipboardFromOutputButton")
$copyToClipboardFromOutputButton.Add_Click({

    $outputTextBox = $frm.FindName("OutputTextBox")
    $outputTextBox.Text | Clip
})

$clearButton = $frm.FindName("ClearButton")
$clearButton.Add_Click({

    $inputTextBox = $frm.FindName("InputTextBox")
    $inputTextBox.Clear()

    $outputTextBox = $frm.FindName("OutputTextBox")
    $outputTextBox.Clear()
})

# $frm.Top  = 0
# $frm.Left = 0
$frm.ShowDialog()