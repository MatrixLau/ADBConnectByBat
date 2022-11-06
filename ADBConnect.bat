@echo off
cd E:\Scropy_GUI_byCZ_V3.1.0

echo Try to connect your device......
@REM adb connect 192.168.1.247


for /F %%i in ('adb connect 192.168.1.247') ^
do (
    if %%i == already (
        echo Device already connected
        goto :start
    )

    if %%i == connected (
        echo Device connected
        goto :start
    )

    if %%i == unable (
        echo Unable to connect device
        goto :end
    )

    if %%i == failed (
        echo Failed to connect device
        goto :end
    )
)
PAUSE

:start
start Scrcpy_GUI_byCZ_V3.1.0.exe

:end
PAUSE