Import-Module ActiveDirectory

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form = New-Object System.Windows.Forms.Form
$Form.ClientSize = New-Object System.Drawing.Point(227,204)
$Form.Text = "BMC Hospital"
$Form.TopMost = $false

$Label1 = New-Object System.Windows.Forms.Label
$Label1.text = "First Name:"
$Label1.AutoSize = $true
$Label1.Width = 25
$Label1.Height = 10
$Label1.Location = New-Object System.Drawing.Point(13,24) 
$Label1.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 10)

$Label2 = New-Object System.Windows.Forms.Label
$Label2.text = "Last Name:"
$Label2.AutoSize = $true
$Label2.Width = 25
$Label2.Height = 10
$Label2.Location = New-Object System.Drawing.Point(15,62) 
$Label2.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 10)

$TextBox1 = New-Object System.Windows.Forms.TextBox
$TextBox1.Multiline = $false
$TextBox1.Width = 100
$TextBox1.Height =20
$TextBox1.Location = New-Object System.Drawing.Point(99,20)
$TextBox1.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 10)

$TextBox2 = New-Object System.Windows.Forms.TextBox
$TextBox2.Multiline = $false
$TextBox2.Width = 100
$TextBox2.Height =20
$TextBox2.Location = New-Object System.Drawing.Point(99,61)
$TextBox2.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 10)

$ComboBox1 = New-Object System.Windows.Forms.ComboBox
$ComboBox1.Text = "comboBox"
$ComboBox1.Width = 184
$ComboBox1.Height = 20
$ComboBox1.Location = New-Object System.Drawing.Point(13,106)
$ComboBox1.Font = New-Object System.Drawing.Font ("Microsoft Sans Serif", 10)
$ComboBox1.Items.Add("IT")
$ComboBox1.Items.Add("Administrator")
$ComboBox1.Items.Add("Radiology")
$ComboBox1.Items.Add("Nursing")
$ComboBox1.Items.Add("Cardiology")
$ComboBox1.Items.Add("Surgery")
$ComboBox1.Items.Add("Pharmacy")
$ComboBox1.Items.Add("Emergency Room")
$ComboBox1.Items.Add("Insurance")
$ComboBox1.Items.Add("Human Resources")
$ComboBox1.Items.Add("Finance")


$Button1 = New-Object System.Windows.Forms.Button
$Button1.text = "Make User"
$Button1.Width = 94
$Button1.Height = 30
$Button1.Location = New-Object System.Drawing.Point(60,146)
$Button1.Font = New-Object System.Drawing.Font ("Microsoft Sans Serif", 10)

$Form.controls.AddRange(@($Label1,$Label2,$TextBox1,$TextBox2,$ComboBox1
,$Button1))

$Button1.Add_Click({
    
    $FirstName = $TextBox1.Text
    $LastName = $TextBox2.Text
    $FirstInitial = $FirstName.Substring(0,1)
    $Name = $FirstName + " " + $LastName
    $SamAccountName = $FirstInitial.ToLower() + $LastName.ToLower()
    $UserPrincipalName = $SamAccountName + "@bmchospital.com"
    $Path = "OU=" + $ComboBox1.Text + ",OU=BMCHospital,DC=bmchospital,DC=com"
    $AccountPassword = $ComboBox1.Text + "123"
    $Initials = $FirstInitial + $LastInitial


    New-ADUser -Name $Name -GivenName $FirstName -Surname $LastName -DisplayName $Name -SamAccountName $SamAccountName -EmailAddress $UserPrincipalName -Initials $Initials -Path $Path -AccountPassword (ConvertTo-SecureString $AccountPassword -AsPlainText -Force) -Enabled $true
 
 
 })

$Form.ShowDialog()
