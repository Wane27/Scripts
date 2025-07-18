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


set Part1=10.%site%.2%side%0.%line%

cls
Echo !Part1!
Echo Response from Part1:


ping !Part1! | findstr /R /C:"Packets: *Sent" /C:"Lost"

pause

set Part2=10.%site%.2%side%1.%line%
cls
Echo !Part2!
Echo Response from Part2:

ping !Part2! | findstr /R /C:"Packets: *Sent" /C:"Lost"

pause

set Part3=10.%site%.2%side%2.%line%
cls
Echo !Part3!
Echo Response from Part3:

ping !Part3! | findstr /R /C:"Packets: *Sent" /C:"Lost"

pause

set Part4=10.%site%.2%side%3.%line%
cls
Echo !Part4!
Echo Response from Part4:

ping !Part4! | findstr /R /C:"Packets: *Sent" /C:"Lost"

pause

set /a side2=%side%+3

set Part5=10.%site%.25%side2%.%line%
cls
Echo !Part5!
Echo Response from Part5:

ping !Part5! | findstr /R /C:"Packets: *Sent" /C:"Lost"

pause

set Part6=10.%site%.2%side%8.%line%

cls
Echo !Part6!
Echo Response from Part6


ping !Part6! | findstr /R /C:"Packets: *Sent" /C:"Lost"

pause

