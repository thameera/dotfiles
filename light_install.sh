#!/bin/bash
############################
# light_install.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/ws/dotfiles
# Only the basic dotfiles are installed in light_install.sh 
############################

########## Variables

dir=~/ws/dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory
files="ackrc gitconfig gitignore inputrc tmux.conf vimrc zshenv zshrc"    # list of files/folders to symlink in homedir

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

read -n1 -p "Install Vundle (y/n)? "
if [[ "$REPLY" == [yY] ]]; then
    echo "Setting up Vundle..."
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle && vim +BundleInstall +qall
    echo "...done"
fi

