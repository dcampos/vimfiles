#!/bin/sh

echo "=== Installing Plug..."

mkdir -p autoload
wget -O autoload/plug.vim \
  https://raw.github.com/junegunn/vim-plug/master/plug.vim

[ $? != 0 ] && echo "Could not install Plug. Aborting..." && exit

echo "=== Creating symlink (Linux)..."

ln -s $(pwd)/vimrc-linux ~/.vimrc

echo "=== Installing plugins..."

vim +'BundleInstall' +qall

if [ $? = 0 ]
then
    echo "=== Done!"
else
    echo "=== Something went wrong!"
fi
