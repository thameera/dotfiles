#!/bin/bash
############################
# install.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/ws/dotfiles
############################

########## Variables

dir=~/ws/dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory
files="ackrc beetsconfig gitconfig gitignore inputrc mpdconf speedswapper taskrc tmux.conf vimrc zshenv zshrc"    # list of files/folders to symlink in homedir

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

echo "Setting up Vundle..."
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle && vim +BundleInstall +qall
echo "...done"

# zsh-autosuggestions
echo "Cloning zsh-autosuggestions..."
git clone git://github.com/tarruda/zsh-autosuggestions ~/.zsh-autosuggestions

