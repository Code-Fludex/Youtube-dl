@echo off
SETLOCAL
if not exist youtube-dl.exe goto nothere
if not exist ffmpeg.exe goto nothere
if not exist ffprobe.exe goto nothere
goto start
:nothere
title if you need help, contact my on discord: Fludex#0767
echo You either dont have, renamed, or moved the youtube-dl, ffprobe or ffmpeg executable. Please leave it in the same folder as this batch file
pause
exit
:start
cls
title Youtube-Dl Made By Woutt#4106
echo www.github.com/Code-Fludex
youtube-dl --version
echo.
echo 1) Download music (MP3)
echo 2) Download videos (mp4)
echo 3) Update Youtube-DL
echo _____________________________________
choice /c 123

if errorlevel 3 goto update
if errorlevel 2 goto Startvideo
if errorlevel 1 goto startaudio
echo If you see this message something went wrong press enter and try again!
pause
exit

:Startvideo
echo _____________________________________
echo are you sure you want to download mp4?
choice
if errorlevel 2 goto start
goto video


:startaudio
echo _____________________________________
echo are you sure you want to download mp3?
choice
if errorlevel 2 goto start
goto audio

:video
cls
echo.
echo Please enter the URL that you want in MP4
set /p URL=Please paste the url: 
echo Will now download the video or video and playlist located at the above url, is this correct?
youtube-dl -i -f mp4  %URL% -o "./Downloads/%%(title)s.%%(ext)s"
echo _____________________________________
echo donne!
ping localhost -n 2 >nul
goto video

:audio
cls
echo.
echo Please enter the URL that you want in MP3
set /p URL=Please paste the url: 
youtube-dl -i --extract-audio --audio-format mp3 %URL% -o "./Downloads/%%(title)s.%%(ext)s"
echo _____________________________________
echo donne!
ping localhost -n 2 >nul
goto audio

:update
cls
echo Update: Press Y to continue, press N To Cancel te update...
choice
if errorlevel 2 goto start
cls
echo Please dont cancel this or close the file while it's updating as it might break something
youtube-dl --update
ping localhost >nul
pause
goto start
