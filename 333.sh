#/bin/bash
wget -O /home/pi/333.mp3 https://futuragora.pt/futurai/radio/333/333.mp3
python /home/pi/fabeacon/on.py
#sleep 1
mplayer /home/pi/333-b1.mp3
#mpg321 /home/pi/333-b2.mp3
#mplayer /home/pi/eye-of-the-tiger.mp3
#mplayer /home/pi/333.mp3
#mplayer /home/pi/333-1.wav
mplayer /home/pi/333.mp3
mplayer /home/pi/333-b1.mp3
#mpg321 /home/pi/333-11.mp3
#sleep 1
python /home/pi/fabeacon/off.py

