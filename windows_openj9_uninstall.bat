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

SET starsector_core=%arg1%\starsector-core
SET openj9_logs=%starsector_core%\openj9_logs
SET j9_bat=%starsector_core%\j9_starsector.bat
SET debug_j9_bat=%starsector_core%\debug_j9_starsector.bat
SET openj9_bin=%arg1%\jre_j9

echo Removing %openj9_logs%
@RD /S /Q "%openj9_logs%"

echo Removing %openj9_bin%
@RD /S /Q "%openj9_bin%"

echo Removing %j9_bat%
DEL %j9_bat%

echo Removing %debug_j9_bat%
DEL %debug_j9_bat%