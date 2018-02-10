Set-ExecutionPolicy -ExecutionPolicy Bypass

$file = (get-item "C:\Users\username\Pictures\earth.jpg")

$img = [System.Drawing.Image]::Fromfile($file);

Add-Type -AssemblyName System.Windows.Forms
$form = New-Object Windows.Forms.Form
$form.text = "Data Entry Form"
$form.Size = New-Object Drawing.Size @(600,400)
$form.StartPosition = "CenterScreen"

$dataGridView = New-Object System.Windows.Forms.DataGridView
$dataGridView.Size=New-Object System.Drawing.Size(600,200)
#$dataGridView.RowCount = 5

$data = @(("2012-06-15", "175.45.178.223", "34564", "212.45.123.15", "380"), ("2012-06-16", "175.45.178.223", "14564", "112.85.23.9", "380"))

$form.Controls.Add($dataGridView)
$dataGridView.ColumnCount = 5
$dataGridView.ColumnHeadersVisible = $true
$dataGridView.Columns[0].Name = "Date"
$dataGridView.Columns[1].Name = "TO IP"
$dataGridView.Columns[2].Name = "TO AP"
$dataGridView.Columns[3].Name = "FM IP"
$dataGridView.Columns[4].Name = "FM AP"

$cryptdisplay = New-Object System.Windows.Forms.TextBox 
$cryptdisplay.Location = New-Object System.Drawing.Size(10,210) 
$cryptdisplay.Size = New-Object System.Drawing.Size(200,115)
$cryptdisplay.Multiline = $True 
$form.Controls.Add($cryptdisplay) 

$known_button_decode = New-Object System.Windows.Forms.Button 
$known_button_decode.Location = New-Object System.Drawing.Size(220,220) 
$known_button_decode.Size = New-Object System.Drawing.Size(70,20)
$known_button_decode.Text = "Grab"
$known_button_decode.add_click({
    #[System.Windows.Forms.MessageBox]::Show($data)
    #$infodisplay.text = "Attempting Decode for " + $TreeView.Selectednode.Parent.Text + $TreeView.SelectedNode.Text
    
    $dataGridView.Rows.Add($data3)
    write-host $data[1][2]
})
$form.Controls.Add($known_button_decode) 

$pictureBox = new-object Windows.Forms.PictureBox
$pictureBox.Location = New-Object System.Drawing.Size(300,210)
$pictureBox.Size =   New-Object System.Drawing.Size(270, 150)
$pictureBox.SizeMode = "StretchImage"

$pictureBox.Image = $img;
$form.controls.add($pictureBox)



$form.showdialog()
