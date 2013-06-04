Title: find and chmod only folders or files
Category: Linux
Tags: shell, linux
Date: 2013-06-04

Sometime you want to change mode of files and folders to different value, here're the scripts:

Recursive chmod only files within this folder:

    find . -type f -exec chmod 0600 {} \;

Recursive chmod only folders within this folder:

    find . -type d -exec chmod 0755 {} \;

