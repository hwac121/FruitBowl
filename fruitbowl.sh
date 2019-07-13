#!/bin/bash

#===================================================#
#                   CHECK FOR ROOT                  #
#===================================================#

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

#===================================================#
#                     FUNCTIONS                     #
#===================================================#

Splash(){
echo -e "\e[32m_______ ___            .__  __           __      __._____________.__ \e[0m";
sleep 0.05
echo -e "\e[32m\_   _____/______ __ __|__|/  |_ ___.__./  \    /  \__\_   _____/|__|\e[0m";
sleep 0.05
echo -e "\e[32m |    __) \_  __ \  |  \  \   __<   |  |\   \/\/   /  ||    __)  |  |\e[0m";
sleep 0.05
echo -e "\e[32m |     \   |  | \/  |  /  ||  |  \___  | \        /|  ||     \   |  |\e[0m";
sleep 0.05
echo -e "\e[32m \___  /   |__|  |____/|__||__|  / ____|  \__/\  / |__|\___  /   |__|\e[0m";
sleep 0.05
echo -e "\e[32m     \/                          \/            \/          \/        \e[0m";
sleep 0.05
echo " "
}

#===================================================#
#                  SELECTION MENU                   #
#===================================================#

options=("Start FruityWiFi" "Stop FruityWiFi" "Credits" "Quit")

PS3="Choose your option or 4 to quit: "
clear
Splash
while [ "$menu" != 1 ]; do
        select opt in "${options[@]}"; do
        case $opt in
	"Start FruityWiFi")
		echo "Starting FruityWiFi Service..."
		sleep 0.5
		/etc/init.d/fruitywifi start
		sleep 0.5
		clear
		Splash
	break
	;;
	"Stop FruityWiFi")
		echo "Stopping FruityWiFi Service..."
		sleep 0.5
		/etc/init.d/fruitywifi stop
		sleep 0.5
		clear
		Splash
	break
	;;
	"Credits")
		clear
		Splash
		echo " "
		sleep 0.5
		echo "FruityWiFi created by xtr4nge"
		sleep 0.5
		echo "Official Website: http://www.fruitywifi.com"
		sleep 2
		clear
		Splash
	break
	;;
        "Quit")
        	clear
        	Splash
        	echo -e " "
        	echo -e "\e[37mThank you for using FruityWiFi by xtr4nge"
        	sleep 2
        	clear
        	menu=1
        break
        ;;

* )
                                echo -e "$REPLY is an invalid option"
                break
                ;;
        esac
        done
done

exit 0
