### Fabeacon

O "fabeacon" é o software que compõe a emissão do Boletim Informativo dos MAcanudos e a cada três horas do plano de comunicações de emergência 3 3 3 no canal 3 da Banda do Cidadão.

Conteúdo:
- Python para usar o GPIO e ligar o pin 17 BCM que é o Board n.º 11;
- Jingle Boletim e roger beep 333;
- Cron - ficheiro com as rotinas;

### Instalador

O instalador foi criado por Octávio Pereira e testado em Rapberry 3B, 4 e em PC com a distribuição Linux Mint 20.1 Ulyssa.

Download:

wget https://github.com/octaviofilipepereira/fabeacon/blob/main/fabeacon-install.sh

#### Instalação

1. Fazer download do instalador **fabeacon-install.sh**
2. Tornar o instalador executável: 
> chmod 755 fabeacon-install.sh
3. Executar o instalador:
> bash fabeacon-install.sh
4. Após a instalação concluida, todas as configurações necessárias foram realizadas e o Fabeacon é executado automáticamente.

#### Desinstalação

1. Executar o instalador:
> bash fabeacon-install.sh
2. Seleccionar a opção de desinstalação.
2. Após a desinstalação concluida, o Fabeacon foi retirado do seu dispositivo.

### Administração

O Painel de administração permite as seguinte funcionalidades: 

1. Emitir Boletim
2. Emitir Boletim Digital RTTY
3. Emitir Plano 333
4. Emitir audio gravado na página.
5. Ligar a Portadora
6. Desligar a Portadora 

#### Remote Admin

Requisitos: VPN Macanudos* & PIN macanudos

Link: https://macanudos.org/app/radioadmin;


#### Admin Local

Executar o script fabeacon-admin.sh

#### VPN

A VPN permite que possa controlar o RPI dentro de uma rede privada dando acesso não só ao painel de administraçáo abaixo como também acesso interno ao SDR (caso tenha a pen ligada) ou interligação com outros sistemas.
A VPN instalada acima. Bastará meter o ficheiro fabeaconXX.conf que lhe foi enviado na pasta /etc/openvpn/. Como? Usando o shh scp para copiar de outro sistema ou o filezilla (cliente SFTP); 
 
#### Raspbian & Openwebrx
1. Efectuar o Download do Openwebrx: https://www.openwebrx.de/download/rpi.php ou Raspbian
2. Instalar a imagem do Openwebrx num cartão SD. Ver instruções neste link: https://github.com/jketterl/openwebrx/wiki/Setup-Guide
3. Proceder à instalação do Fabeacon como descrito acima.

### Saber mais sobre este projecto: 

Raspberry Pi, Telemóvel ou PC com Boletim Informativo e Plano 333.

O presente código tranforma o dispositivo num emissor. Pode ser instalado em Telemóveis Android; raspberry pi ou qualquer pc.

Saber mais sobre o Boletim: https://macanudos.org/boletim-informativo-na-banda-do-cidadao/

No site do macanudos.org: https://macanudos.org/2021/07/29/opensource-macanudos/ 

Saber mais sobre o Plano de Comunicações 333: https://macanudos.org/plano-de-emergencia-3-3-3/

### Disclaimer
1. As emissões dos ficheiros audio gerados pelo presente código-livre estão sujeitas às suas condicionantes legais e são da esclusiva responsabilidade das estações que as emitiem.
