#!/bin/sh

echo "=== Cloning Vundle..."

git clone https://github.com/gmarik/Vundle.vim.git bundle/vundle

[ $? != 0 ] && echo "Could not clone Vundle. Aborting..." && exit

echo "=== Installing plugins..."

vim +'BundleInstall' +qall

if [ $? = 0 ]
then
    echo "=== Done!"
else
    echo "=== Something went wrong!"
fi
