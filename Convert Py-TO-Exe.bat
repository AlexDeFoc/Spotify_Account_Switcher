set /p message="Py to Exe name : "
echo %message%
pyinstaller --noconsole --onefile %message%
pause