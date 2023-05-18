#!/bin/bash
Red='\033[0;31m'
NC='\033[0m'
Green='\033[0;32m'
Blue='\033[0;34m'
Distrib='Unknown'

Help="./install.sh [apt or dnf] [--help or -h] [--omzGet or --omzCurl]"

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

sudo $Distrib update
sudo $Distrib upgrade -y
sudo $Distrib install apt-utils -y
sudo $Distrib install make cmake -y
sudo $Distrib install valgrind -y
sudo $Distrib install libcsfml-dev libsfml-dev -y
sudo $Distrib install git -y
sudo $Distrib install zsh -y
sudo $Distrib install curl wget -y
sudo $Distrib install gcc g++ -y
sudo $Distrib install emacs -y
sudo $Distrib install htop -y
sudo $Distrib install python3 -y
sudo $Distrib install libncurses5-dev libncursesw5-dev -y
sudo $Distrib install net-tools -y
sudo $Distrib install python3-pip -y
sudo $Distrib install nano -y
sudo $Distrib install nasm -y
sudo $Distrib install neofetch -y
sudo $Distrib install tcsh -y
sudo $Distrib install tree -y
sudo $Distrib autoremove -y

echo "alias emacs="emacs -nw"" >> ~/.zshrc
printf "${Green}Installation complete${NC}\n"

if [ -d ~/.oh-my-zsh ]
then
    printf "${Blue}oh-my-zsh already installed${NC}\n"
    exit 0
elif [ "$2" = "--omzGet" ]
then
    printf "${Green}Start installation of oh-my-zsh${NC}\n"
    sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
    printf "${Green}Installation complete${NC}\n"
    exit 0
elif [ "$2" = "--omzCurl" ]
then
    printf "${Green}Start installation of oh-my-zsh${NC}\n"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    printf "${Green}Installation complete${NC}\n"
    exit 0
fi
