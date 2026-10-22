:: Use PowerShell to launch Edge and output its PID to a temp file
powershell -Command "$p = Start-Process msedge -ArgumentList '--app=http://localhost:8188', '--user-data-dir=%USERPROFILE%\ComfyEdge' -PassThru; $p.Id | Out-File -Encoding ascii '%TEMP%\comfy_edge.pid'"

:: Read the PID back into a batch variable
set /p EDGE_PID=<"%TEMP%\comfy_edge.pid"
del "%TEMP%\comfy_edge.pid" >nul 2>&1

:: Fallback if PID capture failed
if "%EDGE_PID%"=="" (
    start "" msedge --app="http://localhost:8188" --user-data-dir="%USERPROFILE%\ComfyEdge"
    goto CheckEdgeFallback
)

:: Wait loop tracking that exact Edge PID
:CheckEdgePID
timeout /t 3 /nobreak >nul
tasklist /fi "pid eq %EDGE_PID%" 2>nul | find "%EDGE_PID%" >nul
if not errorlevel 1 goto CheckEdgePID
goto EdgeClosed

:CheckEdgeFallback
timeout /t 5 /nobreak >nul
tasklist /fi "imagename eq msedge.exe" 2>nul | find /i "msedge.exe" >nul
if not errorlevel 1 goto CheckEdgeFallback

:EdgeClosed
wslc stop comfy
