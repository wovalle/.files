# wovalle's dotfiles 
 install vscode in path
 install font
 hidden files

## Setup SSH
Either create a new key or copy an old one
<details>
  <summary>Create a new ssh key</summary>

```bash
ssh-keygen -t rsa -b 4096 -C "<email@domain.tld>"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```
* Save that ssh key in [Github](https://github.com/settings/keys) and [Bitbucket](https://bitbucket.org/account/user/willyovalle/ssh-keys/)

```bash
sudo apt-get install xclip
cat ~/.ssh/id_rsa.pub | xclip -sel clip
```
</details>

If you're using and old key, remember to set the correct permissions
```bash
chmod 400 ~/.ssh/id_rsa
```

## Install XCode Command Line Tools
Open a terminal and `xcode-select --install`. This should also install `git` (in case it doesn't, it can be easily installed after installing homebrew with `brew install git`).

## Show hidden files
 
<kbd>Cmd</kbd> + <kbd>Shift</kbd> + <kbd>.</kbd>

## Install [oh-my-szh]()
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Clone this repo to your home folder
```bash
cd ~/ && git clone git@github.com:wovalle/.files.git

```

## Link .gitconfig
```bash
cd ~/ && ln -s ~/.files/dotgitconfig ~/.gitconfig
```

## Link aliases
```bash
cd ~/ && ln -s ~/.files/aliases.zsh ~/.oh-my-zsh/custom/
source ~/.zshrc
```

## Install [Homebrew](https://brew.sh)
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```


## Apps 

```bash
brew install --cask visual-studio-code
brew install fnm
brew install --cask docker 
brew install --cask spotify 
brew install --cask rectangle 
brew install --cask slack
brew install --cask telegram
brew install --cask maccy
brew install --cask google-chrome
brew install --cask docker
brew install --cask wireguard
brew install --cask mounty
brew install --cask 1password
brew install --cask the-unarchiver
brew install --cask notion
brew install --cask hiddenbar

brew tap homebrew/cask-fonts
brew install --cask font-fira-code
```




