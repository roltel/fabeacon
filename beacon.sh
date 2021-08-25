#/bin/bash
wget -O /home/pi/fabeacon.mp3 https://futuragora.pt/futurai/radio/boletim/fabeacon.mp3
#wget -O /home/pi/mmbeacon.wav https://futuragora.pt/futurai/radio/boletim/mmbeacon.wav
python /home/pi/fabeacon/on.py
#sleep 1
mplayer /home/pi/fabeacon/audio/mac-jingle.mp3
mplayer /home/pi/fabeacon.mp3
mplayer /home/pi/fabeacon/audio/mac-jingle.mp3
sleep 1
python /home/pi/fabeacon/off.py



