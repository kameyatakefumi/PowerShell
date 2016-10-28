Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName System.Windows.Forms

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

$frm.FindName("EncodeButton").Add_Click({

    $str = $frm.FindName("InputTextBox").Text

    $byte = [System.Text.Encoding]::GetEncoding("shift_jis").GetBytes($str)
    $base64 = [System.Convert]::ToBase64String($byte)

    $frm.FindName("OutputTextBox").Text = $base64
})

$frm.FindName("DecodeButton").Add_Click({

    $base64 = $frm.FindName("InputTextBox").Text

    $byte = [System.Convert]::FromBase64String($base64)
    $str = [System.Text.Encoding]::GetEncoding("shift_jis").GetString($byte)

    $frm.FindName("OutputTextBox").Text = $str
})

$frm.FindName("CopyToClipboardFromOutputButton").Add_Click({

    # Change to SJIS
    $OutputEncoding = [Console]::OutputEncoding
    $frm.FindName("OutputTextBox").Text | Clip
})

$frm.FindName("ClearButton").Add_Click({

    $frm.FindName("InputTextBox").Clear()
    $frm.FindName("OutputTextBox").Clear()
})

$frm.FindName("InputTextBox").Focus()

$primaryScreen = [System.Windows.Forms.Screen]::PrimaryScreen
$frm.Top  = ($primaryScreen.Bounds.Height / 2) - ($frm.Height / 2)
$frm.Left = ($primaryScreen.Bounds.Width  / 2) - ($frm.Width  / 2)
$frm.ShowDialog()