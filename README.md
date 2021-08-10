# fabeacon
Raspberry Pi, Telemóvel ou PC com Boletim Informativo e Plano 333

Saber mais sobre o Boletim: https://macanudos.org/boletim-informativo-na-banda-do-cidadao/
Saber mais sobre o Plano de Comunicações 333: https://macanudos.org/plano-de-emergencia-3-3-3/

O presente código tranforma o dispositivo num emissor. Pode ser instalado em Telemóveis Android; raspberry pi ou qualquer pc.

FABEACON Versão "from scratch" no Rpi: 
- Sacar o raspbian e instalar num cartão de memória SD. Sugerimos usar o comando dd em linux ou em windows o programa win32iso.
- Ir ao "boot" do cartão flashado e criar um ficheiro com o nome "ssh". Isso permite aceder ao Rpi via rede por SSH.
- Ligar o Rpi com o cartão, ver que ip assumiu na rede e fazer ssh nele ssh pi@ipdorpi.
- fazer "sudo su" para tornar administrador e dar os seguintes commandos:

  sudo su # tornar admin
  
  apt update #actualizar o repositorio
  
  apt upgrade # actualizar o sistema
  
  apt install openvpn  # instalar a vpn
  
  apt install mplayer #instalar o player
  
  apt-get install raspi-gpio # instalar os GPIO
  
  raspi-gpio get #
  
  nano /etc/ssh/sshd_config # inserir "PermitRootLogin yes" e dar "/etc/init.d/ssh restart"
  
  nano /etc/hostname | sudo nano /etc/hosts # alterar hostname
  
  cd /home/pi/
  
  git clone https://github.com/roltel/fabeacon/
  
  crontab -e # editar o ficheiro de rotinas para configurar as emissões.
  
  


Abaixo encontra-se uma versão que usa o Openwebrx (SDR) caso o dispositivo tenha ou venha a ter pen RT8L SDR que só funciona em RPi já preconfigurado com o painel de administração, a vpn e outras ferramentas privadas.

FABEACON "OS": Openwebrx & Fabeacon 
Puxar a seguinte imagem e flashar: 

Conteúdo:
- OS Openwebrx (para se quiser que um dia o sistema tb funcione como sdr)
- Python para usar o GPIO e ligar o pin 17 BCM que é o Board n.º 11
- Jingle Boletim e roger beep 333
- Cron - ficheiro com as rotinas

==VPN== 
A VPN permite que possa controlar o RPI dentro de uma rede privada dando acesso não só ao painel de administraçáo abaixo como também acesso interno ao SDR (caso tenha a pen ligada) ou interligação com outros sistemas.
A VPN instalada acima. Bastará meter o ficheiro fabeaconXX.conf que lhe foi enviado na pasta /etc/openvpn/. Como? Usando o shh scp para copiar de outro sistema ou o filezilla (cliente SFTP); 

Painel de controle:
https://futuragora.pt/futurai/priv/radioadmin

- Emitir Boletim
- Emitir Boletim Digital RTTY
- Emitir Plano 333
- Emitir audio gravado na página.

- Ligar a Portadora
- Desligar a Portadora

Disclaimer: As emissões dos ficheiros audio gerados pelo presente código-livre estão sujeitas às suas condicionantes legais e são da esclusiva responsabilidade das estações que as emitiem.
