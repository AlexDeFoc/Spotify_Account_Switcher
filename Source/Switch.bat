@echo off

TASKKILL /F /IM spotify.exe

python COPY.py

"%UserProfile%\AppData\Roaming\Spotify\Spotify.exe"

pause
