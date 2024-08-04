@echo off
setlocal

:: Define the path to 7z.exe
set "sevenZipPath=C:\App\7-Zip\7z.exe"

:: Define the base directory
set "baseDir=%cd%\export"
set "archiveDir=%cd%\archive"

:: Create the archive directory if it does not exist
if not exist "%archiveDir%" (
    mkdir "%archiveDir%"
)

:: Loop through each subdirectory in the base directory
for /d %%D in ("%baseDir%\*") do (
    :: Get the name of the current subdirectory
    set "dirName=%%~nxD"
    setlocal enabledelayedexpansion
    
    :: Define archive names based on the directory and set the path for archives
    set "tarArchive=%archiveDir%\!dirName!.tar"
    set "xzArchive=%archiveDir%\!dirName!.tar.xz"

    :: Create the tar archive of the contents of the subdirectory
    echo Creating TAR archive for !dirName!...
    "%sevenZipPath%" a -ttar "!tarArchive!" "%%D\*"

    :: Check if the TAR archive was created successfully
    if errorlevel 1 (
        echo Failed to create TAR archive for !dirName!.
        endlocal
        continue
    )

    :: Compress the TAR archive into a XZ archive with maximum compression level
    echo Compressing TAR to XZ with maximum compression for !dirName!...
    "%sevenZipPath%" a -txz -mx=9 "!xzArchive!" "!tarArchive!"

    :: Check if the XZ archive was created successfully
    if errorlevel 1 (
        echo Failed to create XZ archive for !dirName!.
        endlocal
        continue
    )

    :: Clean up the intermediate TAR file
    del "!tarArchive!"

    echo Archive "!xzArchive!" created successfully for !dirName!.
    endlocal
)

endlocal
pause

