@echo off
cls
setlocal enabledelayedexpansion
:: Define the targets for all relevant platforms
set targets=linux/amd64 linux/386 linux/arm linux/arm64 darwin/amd64 darwin/arm64 windows/amd64 windows/386 windows/arm windows/arm64
set sources=main.go Source/switch.go

:: Copy the config file to each platform's Source folder
for %%t in (%targets%) do (
  for /f "tokens=1,2 delims=/" %%a in ("%%t") do (
    set GOOS=%%a
    set GOARCH=%%b

    :: Create platform directories if they don't exist
    if not exist "export/%%a-%%b" mkdir "export/%%a-%%b"
    if not exist "Source/%%a-%%b/Source" mkdir "Source/%%a-%%b/Source"

    :: Copy the config file to the Source folder
    :: copy "config" "main/%%a-%%b\config"

    :: Set output extension for Windows
    set output_ext=
    if "%%a"=="windows" (
      set output_ext=.exe
    )
    
    :: Build main.go
    echo Building main.go for %%a/%%b...
    set GOOS=%%a
    set GOARCH=%%b
    go build -o "export/%%a-%%b/main!output_ext!" main.go
    
    :: Build switch.go in Source folder
    echo Building switch.go in Source folder for %%a/%%b...
    pushd Source
    set GOOS=%%a
    set GOARCH=%%b
    go build -o "..\Source\%%a-%%b\Source\switch!output_ext!" switch.go
    popd
  )
)

echo Build process completed.

