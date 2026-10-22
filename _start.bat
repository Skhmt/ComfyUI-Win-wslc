@echo off
setlocal
cd /d "%~dp0"

:: --- Configuration --- ::

set "OUTPUT_DIR=./output"
set "COMFY_IMAGE=ghcr.io/skhmt/comfyui-bazzite-podman:main"

:: --------------------- ::

echo [1/4] Cleaning up any old container instances...
wslc rm -f comfy >nul 2>&1

echo [2/4] Starting ComfyUI container...

wslc run ^
--name comfy ^
--rm ^
-p 8188:8188 ^
-d ^
--gpus all ^
-v "input:/app/input" ^
-v "user:/app/user/" ^
-v "./workflows:/app/user/default/workflows" ^
-v "./custom_nodes:/app/custom_nodes" ^
-v "./models:/app/models" ^
-v "%OUTPUT_DIR%:/app/output" ^
%COMFY_IMAGE%


if errorlevel 1 (
    echo Failed to start the container. Press any key to exit...
    pause >nul
    exit /b 1
)

echo [3/4] Waiting for ComfyUI server to become reachable...

:WaitForServer
curl -s -o nul http://localhost:8188
if errorlevel 1 (
    echo .
    timeout /t 1 /nobreak >nul
    goto WaitForServer
)

echo [4/4] Launching Edge

:: Uses PowerShell with an absolute path and hidden window style
powershell -WindowStyle Hidden -Command "Start-Process '%~dp0zworker.bat' -WindowStyle Hidden"

exit