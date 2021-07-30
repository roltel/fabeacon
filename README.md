# fabeacon
Raspberry Pi com Boletim Informativo e Plano 333

Saber mais sobre o Boletim: https://macanudos.org/boletim-informativo-na-banda-do-cidadao/
Saber mais sobre o Plano de Comunicações 333: https://macanudos.org/plano-de-emergencia-3-3-3/

Versão "from scratch": 
- Sacar o raspbian e instalar num cartão de memória SD. Sugerimos usar o comando dd em linux ou em windows o programa win32iso.
- ir ao "boot" do cartão flashado e criar um ficheiro com o nome "ssh". Isso permite aceder ao Rpi via rede por SSH.
- Ligar o Rpi com o cartão, ver que ip assumiu na rede e fazer ssh nele ssh pi@ipdorpi.
- fazer "sudo su" para tornar administrador e dar os seguintes commandos:

  apt update #actualizar o repositorio
  apt upgrade # actualizar o sistema
  apt install openvpn  # instalar a vpn
  apt install mplayer #instalar o player
  apt-get install raspi-gpio # instalar os GPIO
  raspi-gpio get #
  nano /etc/ssh/sshd_config # inserir "PermitRootLogin yes" e dar "/etc/init.d/ssh restart"
  nano /etc/hostname | sudo nano /etc/hosts # alterar hostname


FABEACON "OS": Openwebrx & Fabeacon 
Puxar a seguinte imagem: 

Conteúdo:
- OS Openwebrx (para se quiser que um dia o sistema tb funcione como sdr)
- Python para usar o GPIO e ligar o pin 17 BCM que é o Board n.º 11
- Jingle Boletim e roger beep 333
- Cron - ficheiro com as rotinas

Instalar script: 
1. git clone 
2. "sudo su" e editar o cron "cron -e"

==VPN== 
A VPN permite que possa controlar o RPI dentro de uma rede privada dando acesso não só ao painel de administraçáo abaixo como também acesso interno ao SDR (caso tenha a pen ligada) ou interligação com outros sistemas.
A VPN instalada acima. Bastará meter o ficheiro fabeaconXX.conf que lhe foi enviado na pasta /etc/openvpn/. Como? Usando o shh scp para copiar de outro sistema ou o filezilla (cliente SFTP); 

Painel de controle:
https://futuragora.pt/futurai/priv/radioadmin

