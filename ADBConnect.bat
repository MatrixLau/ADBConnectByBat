@echo off

@REM SET YOUR DIR PATH HERE WHERE INCLUDED ADB.EXE AND SOME OTHER FILES NEED TO RUN WITH ADB
set DIRPATH=E:\Scropy_GUI_byCZ_V3.1.0
@rem SET YOUR DEVICE ADB IP HERE
SET IPADDRESS=192.168.1.247

cd %DIRPATH%

echo Try to connect your device......
for /F %%i in ('adb connect %IPADDRESS%') ^
do (
    if %%i == already (
        echo Device already connected
        goto :start
    ) else if %%i == connected (
        echo Device connected
        goto :start
    ) else if %%i == unable (
        echo Unable to connect device
        goto :end
    ) else if %%i == failed (
        echo Failed to connect device
        goto :end
    ) else (
        echo Unknown error
        goto :end
    )
)

:start
@REM SET THE EXE FILE TO START HERE
start Scrcpy_GUI_byCZ_V3.1.0.exe
exit

:end
PAUSE