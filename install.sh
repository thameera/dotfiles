#!/bin/bash
############################
# install.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/ws/dotfiles
############################

########## Variables

dir=~/ws/dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory
files="ackrc bashrc beetsconfig gitconfig inputrc tmux.conf vimrc xmobarrc xsessionrc zshenv zshrc"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir

# change to the dotfiles directory
cd $dir
echo "Changed to $dir"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "File: $file"
    mv ~/.$file ~/.dotfiles_old/ 2>/dev/null
    ln -s $dir/$file ~/.$file
done

echo "Moving xmonad files"
mv ~/.xmonad/xmonad.hs ~/.dotfiles_old/ 2>/dev/null
ln -s $dir/xmonad/xmonad.hs ~/.xmonad/xmonad.hs

echo "Setting up Vundle..."
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle && vim +BundleInstall +qall
echo "...done"

