#!/bin/bash          
RED='\033[0;31m'
NC='\033[0m'
Green='\033[0;32m'
Blue='\033[0;34m'

Distrib='Unknown'

if [ "$1" = "apt" ]
then
    echo "Distribution set to Ubuntu"
    Distrib='apt'
elif [ "$1" = "dnf" ]
then
    echo "Distribution set to Fedora"
    Distrib='dnf'
else
    echo "Unknown distribution"
    exit 84
fi

$Distrib update
if [ $? -eq 100 ]
then
    echo "Permission denied. Please use sudo or root user."
    exit 1
fi
$Distrib upgrade -y
$Distrib install apt-utils -y
$Distrib install make -y
$Distrib install valgrind -y
$Distrib install libcsfml-dev libsfml-dev -y
$Distrib install git -y
$Distrib install zsh -y
$Distrib install curl wget -y
$Distrib install gcc -y
$Distrib install emacs -y
$Distrib install libncurses5-dev libncursesw5-dev -y
$Distrib autoremove -y
echo "alias emacs="emacs -nw"" >> ~/.zshrc
printf "${Green}Installation complete${NC}\n"