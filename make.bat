echo off
.\tools\sjasmplus .\main.asm
if ERRORLEVEL 1 goto doexit
copy *.bin .\demo\*.* >nul 2>&1
copy *.nxb .\demo\*.* >nul 2>&1
copy *.spr .\demo\*.* >nul 2>&1
copy *.sna .\demo\*.* >nul 2>&1
:doexit