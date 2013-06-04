Title: find and chmod only folders or files
Category: Linux
Tags: shell, linux
Date: 2013-06-04

Recursive chmod only files within this folder:

    find . -type f -exec chmod 0600 {} \;

Recursive chmod only folders within this folder:

    find . -type d -exec chmod 0755 {} \;


