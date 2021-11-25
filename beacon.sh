#/bin/bash
wget --no-check-certificate -O /home/pi/fabeacon/audio/boletim/boletim.mp3 https://macanudos.org/app/radio/boletim/boletim.mp3
#wget -O /home/pi/mmbeacon.wav https://futuragora.pt/futurai/radio/boletim/mmbeacon.wav
python /home/pi/fabeacon/on.py
#sleep 1
mplayer /home/pi/fabeacon/audio/mac-jingle.mp3
mplayer /home/pi/fabeacon/audio/boletim/boletim.mp3
mplayer /home/pi/fabeacon/audio/mac-jingle.mp3
sleep 1
python /home/pi/fabeacon/off.py



