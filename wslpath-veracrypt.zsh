#!/bin/zsh
linux_path=
my_wslpath() {
    linux_path=$(wslpath $1) 2>/dev/null
    if [ -z $linux_path ]
    then
        # Windows wslpath doesn’t work with VeraCrypt volumes
        linux_path=/mnt/$((L)1[1]}/${${(C)1[3,9999]//\\/\/}/:/}
    fi
}
wsl_path_textfile=/mnt/c/Users/$USERNAME/AppData/Local/Temp/wsl_path.txt
if [ $(find $wsl_path_textfile -mmin -1) ]
then
    # Opened from context menu
    opened_from=$(head -1 $wsl_path_textfile)
    my_wslpath ${opened_from:0:-3}
    cd $linux_path 2>/dev/null
fi
