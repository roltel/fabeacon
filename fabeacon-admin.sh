tversion=0.3.1
SELECTION="Help Quit Installer Boletim-play 333-play Boletim-rtty-play PTT_ON PTT_OFF"
select options in $SELECTION; do
if [ "$options" = "Help" ]; then
	cat README.md

elif [ "$options" = "Quit" ]; then
        echo "Exiting FABEACON ADMIN"
	exit

elif [ "$options" = "Installer" ]; then
        echo "Escolheu a option $options"
        ./fabeacon-installer.sh

elif [ "$options" = "Boletim-play" ]; then
        echo "Escolheu a option $options"
        ./beacon.sh

elif [ "$options" = "Boletim-play" ]; then
        echo "Escolheu a option $options"
        ./333-play.sh

elif [ "$options" = "Boletim-rtty-play" ]; then
        echo "Escolheu a option $options"
        ./bdigital.sh

elif [ "$options" = "PTT_ON" ]; then
        echo "Escolheu a option $options"
        python ./on.py

elif [ "$options" = "PTT_OFF" ]; then
        echo "Escolheu a option $options"
         python ./off.py

else
    clear;
    echo "Insert an option. Press ENTER to list."
echo "FABEACON ADMIN version: "$tversion
fi
done

