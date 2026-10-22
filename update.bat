@setlocal

@cd /d "%~dp0"

@wslc rm -f comfy >nul 2>&1

@call "%~dp0\lib\config.bat"

wslc pull %COMFY_IMAGE%

@pause