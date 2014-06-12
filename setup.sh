#!/bin/sh

echo "=== Cloning Vundle..."

git clone https://github.com/gmarik/Vundle.vim.git bundle/vundle

echo "=== Creating symlink (Linux)..."

[ $? != 0 ] && echo "Could not clone Vundle. Aborting..." && exit

ln -s $(pwd)/vimrc-linux ~/.vimrc

echo "=== Installing plugins..."

vim +'BundleInstall' +qall

if [ $? = 0 ]
then
    echo "=== Done!"
else
    echo "=== Something went wrong!"
fi
