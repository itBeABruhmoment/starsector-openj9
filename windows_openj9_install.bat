@echo off

:: verify Starsector path
SET arg1=%1

if not exist %arg1% (
    ECHO Error %arg1% is not a folder
    exit 1
)

SET y_char=y
SET user_input=n
:: Last 10 characters
if "%arg1:~-10%"=="Starsector" (
    goto :starsector_present
) else (
    ECHO WARNING: The path %arg1% does not end with "Starsector", this seems like a mistake
    goto :starsector_missing
)

:starsector_missing
SET /p user_input=Enter y to continue anyway, anything else to quit: 
if not %user_input%==%y_char% (
    ECHO Exiting
    exit 2
)

:starsector_present

:: verify OpenJ9 zip path
SET arg2=%2
if not exist %arg2% (
    ECHO ERROR: %arg2% could not be found
    exit 3
)

:: Last 4 characters
if not "%arg2:~-4%"==".zip" (
    ECHO ERROR: %arg2% is not a .zip file
    exit 4
)

SET temp_extract=.\temp
SET jre_j9_dest=%arg1%\jre_j9
SET starsector_core=%arg1%\starsector-core

if not exist %starsector_core% (
    ECHO ERROR: %starsector_core% does not exist
    exit 5
)

:: extract zip into temp folder
ECHO Extracting %arg2%
POWERSHELL -Command "Expand-Archive -Path '%arg2%' -DestinationPath '%temp_extract%' -Force"

if exist %jre_j9_dest% (
    ECHO %jre_j9_dest% already exists, deleting
    @RD /S /Q "%jre_j9_dest%"
)

:: move extracted files to install location
ECHO Moving JRE to %jre_j9_dest%
for /d %%d in ("%temp_extract%\*") do (
    MOVE /Y "%%d" %jre_j9_dest%
    goto after_move
)
:after_move

:: delete temp folder
ECHO Deleting temp folder %temp_extract%
@RD /S /Q "%temp_extract%"

ECHO Moving j9_starsector.bat to %starsector_core%
XCOPY /Y ".\j9_starsector.bat" %starsector_core%

ECHO Install successful
exit 0