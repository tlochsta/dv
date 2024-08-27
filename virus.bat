@echo off
setlocal

:: Set the URL of the image to download
set "image_url=https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCV6qQJQSarzA33VS0l8y_9-oQhX7WkJXLsg&s"
set "image_path=%TEMP%\downloaded_image.jpg"

:: Download the image using PowerShell
powershell -Command "Invoke-WebRequest -Uri %image_url% -OutFile %image_path%"

:: Set the downloaded image as the wallpaper
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%image_path%" /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

:: Create an HTA file to open 20 custom windows with the image
echo ^<html^> > "%TEMP%\custom_windows.hta"
echo ^<script language="javascript"^> >> "%TEMP%\custom_windows.hta"
echo var imgSrc = "%image_path%"; >> "%TEMP%\custom_windows.hta"
echo function createWindow() { >> "%TEMP%\custom_windows.hta"
echo     var img = document.createElement("img"); >> "%TEMP%\custom_windows.hta"
echo     img.src = imgSrc; >> "%TEMP%\custom_windows.hta"
echo     img.style.position = "absolute"; >> "%TEMP%\custom_windows.hta"
echo     img.style.width = "200px"; >> "%TEMP%\custom_windows.hta"
echo     img.style.height = "200px"; >> "%TEMP%\custom_windows.hta"
echo     img.style.left = Math.random() * (window.innerWidth - 200) + "px"; >> "%TEMP%\custom_windows.hta"
echo     img.style.top = Math.random() * (window.innerHeight - 200) + "px"; >> "%TEMP%\custom_windows.hta"
echo     document.body.appendChild(img); >> "%TEMP%\custom_windows.hta"
echo } >> "%TEMP%\custom_windows.hta"
echo window.onload = function() { >> "%TEMP%\custom_windows.hta"
echo     for (var i = 0; i < 20; i++) { >> "%TEMP%\custom_windows.hta"
echo         createWindow(); >> "%TEMP%\custom_windows.hta"
echo     } >> "%TEMP%\custom_windows.hta"
echo }; >> "%TEMP%\custom_windows.hta"
echo ^</script^> >> "%TEMP%\custom_windows.hta"
echo ^</html^> >> "%TEMP%\custom_windows.hta"

:: Run the HTA file to open 20 custom windows with the image
start "" "%TEMP%\custom_windows.hta"

:: Restart the computer using Restart.exe without showing a warning
%SystemRoot%\System32\Restart.exe /r /t 0

:: Create a text file on the desktop after the restart
echo hello skibidi > "%userprofile%\Desktop\hello_skibidi.txt"
