:: This script gathers user input for manufacturing lines. In this example, the netowrking inforamtion follows a pattern based on site and line information


@echo off
set /p site=Enter the site number, 1 for Site 1, 2 for Site 2, 3 for Site 3 and 4 for Site 4:

set /p line=Enter the line number:

set /p side=Enter the line side number:


setlocal enabledelayedexpansion


set /a side=%side%-1

IF "%site%"=="4" (
  set /a site=%site%+158
) ELSE (
  set /a site=%site%+36
)


set ECSPC=10.%site%.2%side%0.%line%

cls
Echo !ECSPC!
Echo Response from ECSPC:


ping !ECSPC! | findstr /R /C:"Packets: *Sent" /C:"Lost"

pause

set Extr=10.%site%.2%side%1.%line%
cls
Echo !Extr!
Echo Response from Extrusion Nat:

ping !Extr! | findstr /R /C:"Packets: *Sent" /C:"Lost"

pause

set Cal=10.%site%.2%side%2.%line%
cls
Echo !Cal!
Echo Response from Cal Nat:

ping !Cal! | findstr /R /C:"Packets: *Sent" /C:"Lost"

pause

set Puller=10.%site%.2%side%3.%line%
cls
Echo !Puller!
Echo Response from Puller Nat:

ping !Puller! | findstr /R /C:"Packets: *Sent" /C:"Lost"

pause

set /a natside=%side%+3

set NatRouter=10.%site%.25%natside%.%line%
cls
Echo !NatRouter!
Echo Response from Nat Router:

ping !NatRouter! | findstr /R /C:"Packets: *Sent" /C:"Lost"

pause

set Printer=10.%site%.2%side%8.%line%

cls
Echo !Printer!
Echo Response from Zebra Printer:


ping !Printer! | findstr /R /C:"Packets: *Sent" /C:"Lost"

pause

