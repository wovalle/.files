#here I'm assuming you have jessie-lite in your rpi and you're on your first boot.
#plug a monitor and a keyboard to your rpi and follow the instructions:
#default login: pi:raspberry

sudo raspi-config
#first we tell the rasp
#advanced options
#hostname

sudo apt-get update -y
sudo apt-get upgrade -y

sudo nano /etc/wpa_supplicant/wpa-supplicant.conf

#add the following
network = {
	ssid="your_ssid"
	psk="your_ssid_password"
}
#do not add a comma after ssid="your_ssid",<-- I lost half an hour troubleshooting
#because of this
sudo reboot

#at this time you should be able to ping your rpi at {hostname}.local from ahother
#pc (where {hostname} is the hostname you've set before), in my case is rpi.local

#now we have to install apt-transport-https to allow apt to access https repos
sudo apt-get install apt-transport-https -y 

#install the gpg key of dev2day repo
wget -O - https://dev2day.de/pms/dev2day-pms.gpg.key  | sudo apt-key add -  

#add dev2day repo for jessie (raspbian os version)
echo "deb https://dev2day.de/pms/ jessie main" | sudo tee /etc/apt/sources.list.d/pms.list  

#update repo lists
sudo apt-get update  

#install plexmediaserver from dev2day 
sudo apt-get install plexmediaserver -y

#now plexserver daemon is installed in your rpi, reboot because reasons
sudo reboot

#now we're going to install samba
sudo apt-get install samba samba-common-bin -y

#configuring shared hdd
sudo nano /etc/samba/smb.conf

#add the following 
[SharedHDD]
 comment=Raspberry Pi Share
 path=/media/sda1
 browseable=Yes
 writeable=Yes
 only guest=no
 create mask=0777
 directory mask=0777
 public=yes


#install torrent server
sudo apt-get install deluged deluge-webui deluge-console -y

#create default config
deluged
killall deluged

#add your user to default config [user:password:authlvl (10 = full user)]
echo "raspberry:pi:10" >> ~/.config/deluge/auth

#config deluge to run at startup, taken from (http://www.howtogeek.com/142044/how-to-turn-a-raspberry-pi-into-an-always-on-bittorrent-box/)
sudo wget -O /etc/default/deluge-daemon https://gist.github.com/wOvalle/c9db475839523c607f6f24638548025c
sudo nano /etc/default/deluge-daemon # Only if the user you configured the deluge daemon is not "pi", modify the user
sudo chmod 755 /etc/default/deluge-daemon
sudo update-rc.d deluge-daemon defaults

sudo wget -O /etc/init.d/deluge-daemon https://gist.github.com/wOvalle/e03ce6260c8a687226d6654ea0b551da
sudo chmod 755 /etc/init.d/deluge-daemon
sudo update-rc.d deluge-daemon defaults

#install rsync
sudo apt-get install rsync -y

#script for synchronizing data between folders
#!/bin/sh

if [ $(mount | grep -c /media/sda1) != 1 ]
then
        echo "/media/sda1 not mounted"
else
        echo "/media/sda1 already mounted, syncronizing data"
        rsync -va --info=progress2 /home/pi/Downloads/Finished/ /media/sda1/Downloads
        echo "finished sync"
fi

