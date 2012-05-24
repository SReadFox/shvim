#!/usr/bin/env sh

shvim_home="$HOME/.shvim"

echo "Thanks for installing shvim"

# Backup existing .vim stuff
echo "Backing up current vim configuration"

today=`date +%Y%m%d`
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc
do 
  [ -e $i ] && mv $i $i.$today
done


echo "Cloning shvim"
git clone https://silencemoon@github.com/silencemoon/shvim.git $shvim_home

mkdir -p $shvim_home/.vim/bundle
ln -s $shvim_home/.vimrc $HOME/.vimrc
ln -s $shvim_home/.vim $HOME/.vim

echo "Installing Vundle"
git clone http://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle

echo "Installing plugins using Vundle"
vim +BundleInstall! +BundleClean +q
