#!/bin/bash

if [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
	yes '' | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

yes '' | brew install zsh curl wget

## oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## apply custom zshrc 
cp .zshrc ~/.zshrc

echo done!
