# ComfyUI in WSLC

Windows Subsystem for Linux has released their [container implementation](https://learn.microsoft.com/en-us/windows/wsl/wsl-container), making running linux containers in Windows very easy.

This is meant for x86-64 Windows and Nvidia GPUs. It may or may not work on ARM Windows and/or AMD or Intel GPUs.

## Installing WSL2

Open powershell as an admin (Press the Windows key, type `PowerShell`, right-click `Windows PowerShell` or `Terminal`, and select `Run as administrator`)

Type `wsl --install`

You'll have to restart your computer

## Scripts

`_start.bat`: Runs the program and downloads the container if you didn't already - this is all you really need

`nvidia-test.bat`: Tests if wslc and your nvidia drivers work

`force-stop.bat`: Kills the wslc container if it didn't stop for some reason

`update.bat`: Updates the container image

`zworker.bat`: Don't run this directly, it's automatically run from `_start.bat`

## Folders

This will automatically create folders for you:

- `models/`
- `custom_nodes/`
- `workflows/`
- `output/`

## Exiting

Close the browser window
