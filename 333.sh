#/bin/bash
wget --no-check-certificate -O /home/pi/fabeacon/audio/333/333.mp3 https://macanudos.org/app/radio/333/333.mp3
python /home/pi/fabeacon/on.py
#sleep 1
mplayer /home/pi/fabeacon/audio/rbeep/beep22.mp3
#mpg321 /home/pi/333-b2.mp3
#mplayer /home/pi/eye-of-the-tiger.mp3
#mplayer /home/pi/333.mp3
#mplayer /home/pi/333-1.wav
mplayer /home/pi/fabeacon/audio/333/333.mp3
mplayer /home/pi/fabeacon/audio/rbeep/beep22.mp3
#mpg321 /home/pi/333-11.mp3
#sleep 1
python /home/pi/fabeacon/off.py

