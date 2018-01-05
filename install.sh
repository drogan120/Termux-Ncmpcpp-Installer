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
echo "	2. Configure "
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
		configure
		;;
	2)
		sleep 2
		echo "We will Configure Ncmpcpp and Mpd"
		configure
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
configure(){

	echo "Wait We Will Configure Your  Mpd ......"
	sleep 2
	mkdir ~/.mpd
	cd ~/.mpd
	pwd
	touch mpd.log mpd.pid mpd.db mpdstate socket
	echo "1.Alsa"
	echo "2.Pulse"
	read -p "Choose ? [1,2] : " audio;

	case $audio in

	1)
		cat > mpd.conf << "EOF"

		 port "6600"
 		 bind_to_address "127.0.0.1"
 		 #bind_to_address "~/.mpd/socket"
 		 music_directory "~/Music/"
 		 playlist_directory "~/Music"
 		 db_file      "~/.mpd/mpd.db"
 		 log_file      "~/.mpd/mpd.log"
 		 pid_file      "~/.mpd.pid"
 		 state_file     "~/.mpd/mpdstate"
 		 audio_output {

    			 type  "alsa"
     			 name  "alsa"
		}

		audio_output {
    			 type                    "fifo"
    			 name                    "my_fifo"
    			 path                    "/tmp/mpd.fifo"
    			 format                  "44100:16:2"
		}

EOF
clear
amu
;;

      2)
                cat > mpd.conf << "EOF"

                 port "6600"
                 bind_to_address "127.0.0.1"
                 #bind_to_address "~/.mpd/socket"
                 music_directory "~/Music/"
                 playlist_directory "~/Music"
                 db_file      "~/.mpd/mpd.db"
                 log_file      "~/.mpd/mpd.log"
                 pid_file      "~/.mpd/mpd.pid"
                 state_file     "~/.mpd/mpdstate"
                 audio_output {

                         type  "pulse"
                         name  "pulse audio"
                }

                audio_output {
                         type                    "fifo"
                         name                    "my_fifo"
                         path                    "/tmp/mpd.fifo"
                         format                  "44100:16:2"
                }

EOF
clear
amu
;;

	*)
	echo "Invalid Options"
	configure
	;;
esac

}
amu(){

echo "Starting Mpd ..."
sleep 2
service mpd stop
service mpd start
echo "Starting Ncmpcpp ..."
sleep 2
ncmpcpp

}
menu
