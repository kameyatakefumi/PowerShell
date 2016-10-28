Add-Type -AssemblyName PresentationFramework

$xaml = @'
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    Title="パネルレイアウト" Width="640" Height="400">

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
        <TextBox Name="InputTextBox" Grid.Row="1" Grid.Column="0" AcceptsReturn="True" VerticalScrollBarVisibility="Auto" HorizontalScrollBarVisibility="Auto" />

        <Label Content="Output" Grid.Row="0" Grid.Column="1" />
        <TextBox Name="OutputTextBox" Grid.Row="1" Grid.Column="1" AcceptsReturn="True" VerticalScrollBarVisibility="Auto" HorizontalScrollBarVisibility="Auto" />

        <StackPanel Grid.Row="2" Grid.Column="0" Grid.ColumnSpan="2" Orientation="Horizontal">
            <Button Name="EncodeButton" Margin="3" Padding="5" Content="Encode" />
            <Button Name="DecodeButton" Margin="3" Padding="5" Content="Decode" />
        </StackPanel>
    </Grid>
</Window>
'@

$frm = [System.Windows.Markup.XamlReader]::Parse($xaml)
$frm.ShowDialog()