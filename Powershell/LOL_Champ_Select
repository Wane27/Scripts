Remove-Item -Path "C:\Temp\Test\File.bat"

$Ipaddr = "10.0.0.2"
$Playernum = ‘Play 1’, ‘Play 2’, ‘Play 3’ | Out-GridView -OutputMode Single -Title ‘Select your number’


$Character = ‘Test 1’, ‘Test 2’, ‘Test 3’ | Out-GridView -OutputMode Single -Title ‘Select your Item’


New-Item -Path "C:\Temp\Test\File.bat" -ItemType File -Value "Echo $Ipaddr $Playernum $Character"

pause

Echo running startup

    & cmd.exe /c "C:\Temp\Test\File.bat"


exit
