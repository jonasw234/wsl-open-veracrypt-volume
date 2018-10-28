# Introduction
By default Windows 10’s WSL has trouble opening paths VeraCrypt volumes. This works around this limitation.

## What the files do
open-wsl-here.reg adds a registry key to add the “Open WSL here” context menu item (based on [https://www.tenforums.com/tutorials/60125-open-bash-window-here-context-menu-add-windows-10-a.html](https://www.tenforums.com/tutorials/60125-open-bash-window-here-context-menu-add-windows-10-a.html)). This creates a file called “wsl_path.txt” in your temp directory.
Next you need to add `source wslpath-veracrypt.zsh` to your .zshrc and it will automatically try to read the “wsl_path.txt” file and switch to the directory indicated by it if the file was modified not longer than one minute before.
Since environment variables are different between Windows and WSL, you might need to adjust the paths if your Windows username doesn’t match your WSL username.

## Limitations
So far it only seems to work with volumes that have been mounted in VeraCrypt before any WSL shells have been spawned. I’m not sure about why that is, but when I tried to cd into a newly mounted VeraCrypt volume – even manually – after having started WSL before, it didn’t work, so maybe it’s just a limitation of WSL.
