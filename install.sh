#!/data/data/com.termux/files/usr/bin/bash

menu (){
echo "============================================================"
echo "=========					============"
echo "			 Amu Script     			  "
echo "=========					============"
echo "============================================================"
echo "==================    Version 0.0.1	===================="
echo "============================================================"
echo ""
echo "This Script will install Ncmpcpp And Mpd On Your Termux"
echo "with this script you can play music with termux on ...."
echo ""
echo "Menu :"
echo "	1. Install   "
echo "	9. Quit      "
echo ""

read -p "what will we do ? [1,2,3] : " ans;

	case $ans in
	1)
		echo "Installing Ncmpcpp and Mpd ....."
		sleep 2
		pkg install ncmpcpp
		pkg install mpd
		pkg install mpc
		clear
		;;
	9)
		echo "Closing Program ...."
		sleep 2
		clear
		exit
		;;
	*)
		echo "Invalid Options" 
		clear
		menu
		;;
	esac
}
amu(){

echo "Starting Mpd ..."
sleep 2
mpd
echo "Starting Ncmpcpp ..."
sleep 2
ncmpcpp

}
menu
