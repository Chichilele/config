#!/bin/bash

if [[ "$OSTYPE" != "darwin"* ]]; then
        # not Mac OSX
	exit 1
fi

## install home brew
yes '' | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
## install tools
yes '' | brew install zsh curl wget

## oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
## conda completion
git clone https://github.com/esc/conda-zsh-completion ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/conda-zsh-completion
## apply custom zshrc 
cp .zshrc ~/.zshrc

## install & setup miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p $HOME/miniconda
## may not work as this is run in bash and not in zsh
eval "$(/Users/$USER/miniconda3/bin/conda shell.zsh hook)"
zsh -c "conda init"
zsh -c "conda config --set auto_activate_base false"

echo done!
