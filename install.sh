#!/bin/bash
Red='\033[0;31m'
NC='\033[0m'
Green='\033[0;32m'
Blue='\033[0;34m'
Distrib='Unknown'

Help="./install.sh [apt or dnf] [--help or -h]"

if [ "$1" = "--help" ] | [ "$1" = "-h" ]
then
    printf "${Blue}${Help}${NC}\n"
    exit 0
fi
if [ "$1" = "apt" ]
then
    echo "Distribution set to Ubuntu"
    Distrib='apt'
elif [ "$1" = "dnf" ]
then
    echo "Distribution set to Fedora"
    Distrib='dnf'
else
    printf "${Red}${Help}${NC}\n"
    exit 84
fi

$Distrib update
if [ $? -eq 100 ]
then
    printf "${Red}Permission denied. Please use sudo or root user.${NC}\n"
    exit 1
fi
$Distrib upgrade -y
$Distrib install apt-utils -y
$Distrib install make cmake -y
$Distrib install valgrind -y
$Distrib install libcsfml-dev libsfml-dev -y
$Distrib install git -y
$Distrib install zsh -y
$Distrib install curl wget -y
$Distrib install gcc g++ -y
$Distrib install emacs -y
$Distrib install htop -y
$Distrib install python3 -y
$Distrib install libncurses5-dev libncursesw5-dev -y
$Distrib install net-tools -y
$Distrib install python3-pip -y
$Distrib install nano -y
$Distrib install nasm -y
$Distrib install neofetch -y
$Distrib install tcsh -y
$Distrib install tree -y
$Distrib autoremove -y

echo "alias emacs="emacs -nw"" >> ~/.zshrc
printf "${Green}Installation complete${NC}\n"

printf "${Green}Start installation of oh-my-zsh${NC}\n"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
if [ $? -eq 100 ]
then
    sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
fi
printf "${Green}Installation complete${NC}\n"

#curl / wget global
# install coding style