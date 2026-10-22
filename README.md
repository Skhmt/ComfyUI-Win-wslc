# ComfyUI in WSLC

Windows Subsystem for Linux has released their [container implementation](https://learn.microsoft.com/en-us/windows/wsl/wsl-container), making running linux containers in Windows very easy.

This is meant for x86-64 Windows, it has not been tested with ARM.

## Installing WSL2

Open powershell as an admin (Press the Windows key, type `PowerShell`, right-click `Windows PowerShell` or `Terminal`, and select `Run as administrator`)

Type `wsl --install`

You'll have to restart your computer

## Scripts

`_start.bat`: Runs the program and downloads the container if you didn't already - this is all you really need

`force-stop.bat`: Kills the wslc container if it didn't stop for some reason

`update.bat`: Updates the container image

## Folders

This will automatically create folders for you:

- `models/`
- `custom_nodes/`
- `workflows/`
- `output/`

## Exiting

Close the browser window

## AMD GPU

Modify `/lib/config.bat` by commenting out the nvidia line (2) with `::` and uncommenting out the *amd* line (5)

## Intel GPU

Modify `/lib/config.bat` by commenting out the nvidia line (2) with `::` and uncommenting out the *intel* line (8)
