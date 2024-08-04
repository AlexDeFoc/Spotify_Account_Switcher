@echo off
cls
setlocal enabledelayedexpansion

:: Define the targets for all relevant platforms
set targets=linux/amd64 linux/386 linux/arm linux/arm64 darwin/amd64 darwin/arm64 windows/amd64 windows/386 windows/arm windows/arm64
set sources=main.go Source/switch.go

:: Ensure the export folder exists
if not exist "export" mkdir "export"

:: Loop through each target platform
for %%t in (%targets%) do (
  for /f "tokens=1,2 delims=/" %%a in ("%%t") do (
    set GOOS=%%a
    set GOARCH=%%b

    :: Create platform directories inside export if they don't exist
    if not exist "export/%%a-%%b" mkdir "export/%%a-%%b"
    if not exist "export/%%a-%%b/Source" mkdir "export/%%a-%%b/Source"

    :: Copy the config file to the Source folder inside the platform folder
    copy "config" "export/%%a-%%b/Source\config"

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
    
    :: Set the target directory for switch.go
    set target_dir=export\%%a-%%b\Source

    :: Check if the target directory exists and build switch.go
    if exist "!target_dir!" (
      echo Changing directory to Source
      pushd Source
      if not errorlevel 1 (
        echo Building switch.go in !target_dir!
        go build -o "..\!target_dir!\switch!output_ext!" switch.go
        echo Finished building switch.go
      ) else (
        echo Failed to change directory to Source
      )
      echo Returning to original directory
      popd
    ) else (
      echo Error: Directory "!target_dir!" does not exist.
    )

    :: Formatting line to separate output for each platform
    echo.
    echo --------------------------------------------------
    echo.
  )
)

echo Build process completed.
