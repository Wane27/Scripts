$UserInput = ‘Site1’, ‘Site2’, ‘Site3’ | Out-GridView -OutputMode Single -Title ‘Select your Site’

$Site1 = "Site1"
$Site2 = "Site2"
$Site3 = "Site3"


if ($UserInput -eq $Site1) {
$UserInput = "Site1_PrintServer"
} elseif ($UserInput -eq $Site2) {
$UserInput = "Site2_Printserver"

} elseif ($UserInput -eq $Site3) {
$UserInput = "Site3_Printserver"
}
 else {
    Write-Output "Error on line 17."
}

$Site1 = "Site1_Printserver"
$Site2 = "Site2_Printserver"
$Site3 = "Site3_Printserver"


if ($UserInput -eq $Site1) {
$Printer = ‘US01_FishBowl_Hall’, ‘Site1_Printer_1’, ‘Site1_Printer_2’, ‘Site1_Printer_3’ | Out-GridView -OutputMode Single -Title ‘Select your Printer’
} elseif ($UserInput -eq $Site2) {
$Printer = ‘Site1_Printer_1’, ‘Site2_Printer_2’, ‘Site3_Printer_3’ | Out-GridView -OutputMode Single -Title ‘Select your Printer’

} elseif ($UserInput -eq $Site3) {
$Printer = ‘Site3_Printer_1’, ‘Site3_Printer_2’, ‘Site3_Printer_3’ | Out-GridView -OutputMode Single -Title ‘Select your Printer’
}
 else {
    Write-Output "Error on line 34."
}

Write-Output "Adding Printer"
Add-Printer -ConnectionName \\$UserInput\$Printer

 $response = Read-Host -Prompt "Do you want to cadd another printer? (Y/N)"
    if ($response -eq 'y') {
        Write-Output "Re-run the printer selection."
    } else {
        Exit
    }
