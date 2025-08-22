$Random = Get-Random -Minimum 1 -Maximum 50

$Random


if ($Random -eq 27) {
 Start-Process -FilePath "C:\path\to\your\file.exe"
}
