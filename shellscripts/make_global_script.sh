#!/bin/bash

# This script when run with an alias 'mgs' from any path on your
# machine, will add the file that you will pass to this command
# to global paths, and make it executable. This will allow you to
# instantly turn any script you've just written into a fully executable,
# from any directory, shell script. All via the command: mgs <filename> <alias>
# Don't forget to add an lias to the script, like: mgs automaton.sh auton

chmod 755 $1

cur_path=$(pwd)

echo "export PATH=$PATH:$1" >> ~/.dotfiles/bash/.bash_profile

echo "alias $2='$cur_path/$1'" >> ~/.dotfiles/bash/.bash_aliases

source ~/.dotfiles/bash/.bash_aliases
source ~/.dotfiles/zsh/.zsh_aliases

source ~/.dotfiles/bash/.bash_profile
source ~/.dotfiles/zsh/.zsh_profile


