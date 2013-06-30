#!/bin/bash
############################
# install.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/ws/dotfiles
############################

########## Variables

dir=~/ws/dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory
files="ackrc bashrc beetsconfig gitconfig inputrc tmux.conf vimrc xmobarrc xsessionrc zshrc"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/.dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

echo "Moving xmonad files"
mv ~/.xmonad/xmonad.hs ~/.dotfiles_old/
ln -s $dir/xmonad/xmonad.hs ~/.xmonad/xmonad.hs
echo "...done"

