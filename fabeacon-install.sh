#!/bin/bash
####
#
# Install/Uninstall Script for Raspberry Pi Fabeacon Terminal
#
# Version: 0.2.5
#
# Last Modification: 25-08-2021
# Author: Octávio Filipe Gonçalves
# Copyright: Octávio Filipe Gonçalves AKA Subv3rsion
# Email: octavio.filipe.pereira@gmail.com
# Installer Tester: Rolando Reset
#
####
#
# Fabeacon Author: Rolando Reset
# Website: https://github.com/roltel
# Fabeacon Code Source: https://github.com/roltel/fabeacon
#
####
#
# Licence: This program is license under GNU/GPL v3
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

export DEBIAN_FRONTEND=noninteractive

##########################################
## Start Fabeacon Instalation
##########################################

## Check user is root
## If not load root previlegies
if [[ $EUID -ne 0 ]]; then
    printf -v cmd_str '%q ' "$0" "$@"
    exec sudo su -c "$cmd_str"
fi

if [ ! -f /var/log/fabeacon-install.log ]; then
	echo
	echo -e "\e[38;5;82mBemvindo ao instalador do Fabeacon\e[0m"
	echo
	echo -e "\e[38;5;82mEste instalador irá executar os procedimentos necessários de instalação do Fabeacon no seu dispositivo.\e[0m"
	echo
	echo
	read -p "Aceita continuar com a instalação? (s/n)" INSTALATION;
	echo
	if [ "$INSTALATION" == "n" ]; then
			exit 0;
	fi
else
	echo
	echo -e "\e[38;5;82mO Fabeacon já se encontra instalado.\e[0m"
	echo
	read -p "Pretende remover permanentemente o Fabeacon no seu dispositivo? (s/n)" INSTALATION;
	echo
	if [ "$INSTALATION" == "n" ]; then
			exit 0;
	else
		# Purge Fabeacon needed packages
		apt purge -y openvpn mplayer raspi-gpio
		
		# Delete instalation dir
		rm -rf /home/pi/fabeacon/
		
		# Delete Fabeacon root cron lines
		crontab -l > /tmp/root_cron
		sed -e '/beacon.sh/d' /tmp/root_cron > /tmp/root_cron_queue
		crontab /tmp/root_cron_queue

		crontab -l > /tmp/root_cron
		sed -e '/333.sh/d' /tmp/root_cron > /tmp/root_cron_queue
		crontab /tmp/root_cron_queue
		
		# Restart Cron
		/etc/init.d/cron reload
		
		# Delete instalation controler log
		rm -rf /var/log/fabeacon-install.log
		
		echo
		echo -e "\e[38;5;82mO Fabeacon foi desinstalado com sucesso!\e[0m"
		echo
		
		exit 0;
	fi
fi

## Creating LOG File
touch /var/log/fabeacon-install.log

## Check device hostname
HOSTNAME=`which hostname`;

## Updating Hostname
echo -e "\e[38;5;82mQual o hostname pretendido para este dispositivo?\e[0m"
read userInput
if [[ -n "$userInput" ]]; then
	definedhostname=$userInput
fi
echo
echo -e "\e[38;5;82mA actualizar o Hostname do dispositivo, por favor aguarde...\e[0m"
echo
rm -rf /etc/hostname
touch /etc/hostname
hostname $definedhostname
echo $definedhostname > /etc/hostname
sleep 5;

## Set Timezone to Europe/Lisbon
timedatectl set-timezone Europe/Lisbon

## Force System Upgrade
apt update && apt upgrade

## Install essential packages and execute GPIO pins set
apt install -y openvpn mplayer raspi-gpio && raspi-gpio get

## Grant access to ssh root conncetions
sed -i '/^#PermitRootLogin/s/#//' /etc/ssh/sshd_config && sed -i '/^PermitRootLogin/s/prohibit-password/yes/' /etc/ssh/sshd_config

## Restart openssh service
/etc/init.d/ssh restart

clear

## Change location path
cd /home/pi/

## Get Fabeacon code fron Github
git clone https://github.com/roltel/fabeacon/

## Create the CronJob
crontab /home/pi/fabeacon/cron.txt

##########################################
## End Fabeacon Instalation
##########################################
echo
echo -e "\e[38;5;82mA instalação e configuração do Fabeacon foi concluida com sucesso!\e[0m"
echo
read -p "É necessário reiniciar o seu dispositivo. Reiniciar agora? (s/n)" RESTART;
echo
if [ "$RESTART" == "n" ]; then
	exit 0;
else
	shutdown -r now
fi

exit 0;
