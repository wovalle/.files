# DotFiles 
* Create a new ssh key
```bash
ssh-keygen -t rsa -b 4096 -C "willyovalle16@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```
* Save that ssh key in [Github](https://github.com/settings/keys) and [Bitbucket](https://bitbucket.org/account/user/willyovalle/ssh-keys/)

```bash
sudo apt-get install xclip
cat ~/.ssh/id_rsa.pub | xclip -sel clip
```

* Install git
```bash
sudo add-apt-repository ppa:git-core/ppa
sudo apt update 
sudo apt install git
```

* Clone the config repo to `~/`
```bash
cd ~/ && git clone git@github.com:wovalle/.files.git
```

* Copy .gitconfig
```bash
ln -s ~/.files/dotgitconfig ~/.gitconfig
```

* Copy .bash_aliases
```bash
ln -s ~/.files/dotbash_aliases ~/.bash_aliases
. ~/.bash_aliases #Sourcing bash aliases
```

## Apps section

```bash
sudo apt install curl

#CopyQ
sudo add-apt-repository ppa:hluk/copyq
sudo apt update
sudo apt install copyq
ln -s ~/.files/copyq.conf ~/.config/copyq/copyq.conf #copy copyq configuration

#nvm (https://github.com/creationix/nvm)
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.5/install.sh | bash
nvm install node #latest node version

sudo snap install telegram-sergiusens
sudo snap install --classic vscode

#Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client
```

* Adding npm completion
```bash
npm completion | sudo tee $(sudo find / -name 'bash_completion.d' 2>/dev/null)/npm 1> /dev/null
```



