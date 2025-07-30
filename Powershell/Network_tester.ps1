Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force


$Site = ‘Site 1’, ‘Site 2’, ‘Site 3’, ‘Site 4’ | Out-GridView -OutputMode Single -Title ‘Select your Site’

$Date = (Get-Date).ToString("MM-dd-yyyy")
$Time = (Get-Date).ToString("hh:mm tt")
# If statement to make Site variable a number

$SiteName = $Site

if ($Site -eq "Site 1") {
    $Site = 1
} if ($Site -eq "Site 2") {
	$Site = 2
} if ($Site -eq "Site 3") {
	$Site = 3
} if ($Site -eq "Site 4") {
	$Site = 4
}


Add-Type -AssemblyName System.Windows.Forms
 
$Form = New-Object System.Windows.Forms.Form
$Form.Text = "Enter Option 1:"
$Form.Size = New-Object System.Drawing.Size(300,200)
$Form.StartPosition = "CenterScreen"
 
$label = New-Object Windows.Forms.Label
$label.Text = "Enter Option 1:"
$label.Location = New-Object Drawing.Point(20, 20)
$form.Controls.Add($label)
 
$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Point(100,75)
$Button.Size = New-Object System.Drawing.Size(100,30)
$Button.DialogResult = [Windows.Forms.DialogResult]::OK
$Button.Text = "OK"
$Form.Controls.Add($Button)
 
$InputBox = New-Object System.Windows.Forms.TextBox
$InputBox.Location = New-Object System.Drawing.Point(50,50)
$InputBox.Size = New-Object System.Drawing.Size(200,20)
$Form.Controls.Add($InputBox)
 
$Result = $Form.ShowDialog()
 
if ($Result -eq [Windows.Forms.DialogResult]::OK) {
    $Opt1 = $InputBox.Text
    Write-Host "You entered: $Opt1"
}
 
$form.Dispose()

$Opt1 = [double]$Opt1
## Turns Option 1 into a number instead of string

$Intcheck = $Opt1 * 10
## Multiplies Option 1 by 10 to check if even or odd

$Opt1Num = $Opt1
## Saves the Option1 as it is e.g 23.1 for log use

$Opt1 = [Math]::Floor($Opt1)
## Rounds Option 1 down for use in IP addresses




## Checks if the number is a whole number
if ($Intcheck % 2 -eq 0) {
    $Opt2 = 1 
} else {
    $Opt2 = 0
}


if ($Opt1 % 1 -eq 0) {
	$Opt2 = 0
}





$Opt1 = [Math]::Floor($Opt1)




$folderPath = "C:\Logs\Network"

if (Test-Path $folderPath -PathType Container) {
    Write-Host "Creating log file C:\Logs\Network\${SiteName} Option 1 ${Opt1Num} ${Date}.txt"
} else {
    New-Item -Path "C:\Logs\Network" -ItemType Directory
}

Add-Type -AssemblyName System.Windows.Forms

# Create Form
$form = New-Object System.Windows.Forms.Form
$form.Text = "Select which items to test"
$form.Size = New-Object System.Drawing.Size(300,300)
$form.StartPosition = "CenterScreen"

# Create CheckedListBox
$listbox = New-Object System.Windows.Forms.CheckedListBox
$listbox.Location = New-Object System.Drawing.Point(10,10)
$listbox.Size = New-Object System.Drawing.Size(260,200)
$listbox.CheckOnClick = $true  # Enable single-click to check/uncheck

# Define options
$options = @("Item1", "Item2", "Item3", "Item4", "Item5", "Item6", "Item7")
$listbox.Items.AddRange($options)

$form.Controls.Add($listbox)

# OK button
$okButton = New-Object System.Windows.Forms.Button
$okButton.Text = "OK"
$okButton.Location = New-Object System.Drawing.Point(100,220)
$okButton.Add_Click({ $form.Close() })
$form.Controls.Add($okButton)

# Show the form
$form.ShowDialog() | Out-Null

# Get selected items
$selectedItems = @()
foreach ($i in 0..($listbox.CheckedItems.Count - 1)) {
    $selectedItems += $listbox.CheckedItems[$i]
}

# Run specific code based on selected options
foreach ($item in $selectedItems) {
    switch ($item) {
        "Item1" {
            Write-Host "Pinging Item1"
            $Item1 = "10.$Site.2${Side}0.$Opt1"

$Item1Result = ping $Item1

"`nResults from Item1 at ${Time}:" | Out-File -FilePath "C:\Logs\Network\${SiteName} Option 1 ${Opt1Num} ${Date}.txt" -Append

$Item1Result | Out-File -FilePath "C:\Logs\Network\${SiteName} Option 1 ${Opt1Num} ${Date}.txt" -Append

cls

        }
        "Item2" {
            Write-Host "Pinging Item2"
            
            $Extr = "10.$Site.2${Side}1.$Opt1"

$ExtrResult = ping $Extr

"`nResults from Item2 at ${Time}:" | Out-File -FilePath "C:\Logs\Network\${SiteName} Option 1 ${Opt1Num} ${Date}.txt" -Append

$ExtrResult | Out-File -FilePath "C:\Logs\Network\${SiteName} Option 1 ${Opt1Num} ${Date}.txt" -Append

cls



        }
        "Item3" {
            Write-Host "Pinging Item3"

            $Cal = "10.$Site.2${Side}2.$Opt1"

$CalResult = ping $Cal

"`nResults from Item3 at ${Time}:" | Out-File -FilePath "C:\Logs\Network\${SiteName} Option 1 ${Opt1Num} ${Date}.txt" -Append

$CalResult | Out-File -FilePath "C:\Logs\Network\${SiteName} Option 1 ${Opt1Num} ${Date}.txt" -Append


cls
        }
        "Item4" {
            Write-Host "Pinging Item4"

            $Puller = "10.$Site.2${Side}3.$Opt1"

$PullerResult = ping $Puller

"`nResults from Item4 at ${Time}:" | Out-File -FilePath "C:\Logs\Network\${SiteName} Option 1 ${Opt1Num} ${Date}.txt" -Append

$PullerResult | Out-File -FilePath "C:\Logs\Network\${SiteName} Option 1 ${Opt1Num} ${Date}.txt" -Append

cls


        }
         "Item5" {
            Write-Host "Pinging Item5"

            
$NatSide = $Opt2 + 3
$Nat = "10.$Site.25${NatSide}.$Opt1"

$NatResult = ping $Nat


"`nResults from Item5 at ${Time}:" | Out-File -FilePath "C:\Logs\Network\${SiteName} Option 1 ${Opt1Num} ${Date}.txt" -Append

$NatResult | Out-File -FilePath "C:\Logs\Network\${SiteName} Option 1 ${Opt1Num} ${Date}.txt" -Append

cls


        }
         "Item6" {
            Write-Host "Pinging Item6"

            $Printer = "10.$Site.2${Side}8.$Opt1"

$PrinterResult = ping $Printer


"`nResults from Item6 at ${Time}:" | Out-File -FilePath "C:\Logs\Network\${SiteName} Option 1 ${Opt1Num} ${Date}.txt" -Append

$PrinterResult | Out-File -FilePath "C:\Logs\Network\${SiteName} Option 1 ${Opt1Num} ${Date}.txt" -Append

cls


        }
         "Item7" {
            Write-Host "Pinging Item7"
            $Tulip = "10.$Site.2${Side}7.$Opt1"

$TulipResult = ping $Tulip

"`nResults from Item7 at ${Time}:" | Out-File -FilePath "C:\Logs\Network\${SiteName} Option 1 ${Opt1Num} ${Date}.txt" -Append

$TulipResult | Out-File -FilePath "C:\Logs\Network\${SiteName} Option 1 ${Opt1Num} ${Date}.txt" -Append

cls
        }
    }
}

Invoke-Item "C:\Logs\Network\${SiteName} Option 1 ${Opt1Num} ${Date}.txt"
