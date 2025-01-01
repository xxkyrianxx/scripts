#!/bin/bash


#RED=$(tput setaf 1)
#GREEN=$(tput setaf 2)
ORANGE=$(tput setaf 3)
#BLUE=$(tput setaf 4)

RED='\033[0;31m' ; LIGHTRED='\033[1;31m' ; GREEN='\033[0;32m' ; LIGHTGREEN='\033[1;32m' ; BLUE='\033[0;34m' ; DARKBLUE='\033[1;34m'
YELLOW='\033[1;33m' ; BLACK='\033[0;30m' ; GRAY='\033[0;37m' ; DARKGRAY='\033[1;30m' ; PURPLE='\033[0;35m'
WHITE='\033[1;37m' ; CYAN='\033[0;36m' ; DARKCYAN='\033[1;30m' ; COFEE='\033[0;33m' ; MAGENTA='\033[1;35m' ; NC='\033[0m' # No Color

# ; ORANGE='\033[0;33m'

normal=$(tput sgr0)
bold=$(tput bold)
fecha=$(date)
current_folder="$(dirname "$0")"
exit=false
opcion=""
kernel=$(uname -r)
NPROC=$(nproc) 
REALUSER=$(awk -F'[/:]' '{if ($3 >= 1000 && $3 != 65534) print $1}' /etc/passwd)
#REALUSER=$USERNAME


TMP_PATH=/var/tmp
TMPL_PATH=/usr/share/doc/nvidia/

funcion_cabezera() {

	clear
	echo -e " "
	echo -e " "
	echo -e " "
	echo -e "${DARKBLUE}		  -> $1 <-${normal}"
	echo -e " "
	echo -e " "
	echo -e "${DARKBLUE}|_______________________________________________________________________________|${normal}"
	echo -e " "
	echo -e " "
	echo -e " "
	sleep 5

	}


funcion_done() {

	echo -e " "
	echo -e " "
	echo -e "${GREEN}	$1 ${normal}"
	echo -e " "
	echo -e " "
	echo -e "${GREEN}  >_________________________ \xE2\x9C\x85 DONE! \xE2\x9C\x85 _________________________<  ${normal} "
	echo -e " "
	echo -e " "
	echo -e " "
	sleep 5
	clear
}


funcion_continuar() {

	echo -e " "
	echo -e " "
	echo -e " "
	read -e -p "${ORANGE} ${bold} Pulsa cualquier tecla para continuar:  ${normal} " opcion_continuar
			case $opcion_continuar in 

				1)
					funcion_done
					;;
				*)
					funcion_done
					;;
			esac
}


funcion_cabezera "Actualizacion del sistema."
sudo apt update && apt upgrade
funcion_done 



while [[ $exit == false ]]; do

	echo -e " "
	echo -e " "
	echo -e  "${BLUE} ${bold}		-----------------------------------------------${normal}"
	echo -e  "${BLUE} ${bold}		|    Script de postinstalacion de Debian      |${normal}"
	echo -e  "${BLUE} ${bold}		|   Para la ejecución inicial y del punto 1   |${normal}"
	echo -e  "${BLUE} ${bold}		|    ejecutar script como root con 'su -'     |${normal}"
	echo -e  "${BLUE} ${bold}		|       después se podrá usar 'sudo'          |${normal}"
	echo -e  "${BLUE} ${bold}		-----------------------------------------------${normal}"
	echo -e " "

	sudo grep -q "$REALUSER ALL=(ALL:ALL) ALL" /etc/sudoers; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 1)  Tweaks para los repositorios y sudoers. ${normal}${GREEN}\xE2\x9C\x85${normal}" \
 		|| echo -e "${GREEN} ${bold} 1) Tweaks para los repositorios y sudoers. ${normal} ${RED}\xE2\x9D\x8C${normal}"

	command -v checkinstall &> /dev/null ; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 2)  Instalacion de software para compilaciones. ${normal}${GREEN}\xE2\x9C\x85${normal}" \
	  || echo -e "${GREEN} ${bold} 2)  Instalacion de software para compilaciones. ${normal} ${RED}\xE2\x9D\x8C${normal}"
	! command -v nvidia-settings &> /dev/null; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 3)  Instalacion drivers nvidia. ${normal}${GREEN}\xE2\x9C\x85${normal}" \
 		|| echo -e "${GREEN} ${bold} 3)  Instalacion drivers nvidia. ${normal} ${RED}\xE2\x9D\x8C${normal}"
	command -v brave-browser &> /dev/null ; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 4)  Instalacion direfente softwate (gdebi, synaptic, brave, telegram etc) IMPRESCINDIBLES. ${normal}${GREEN}\xE2\x9C\x85${normal}" \
 		|| echo -e "${GREEN} ${bold} 4)  Instalacion direfente softwate (gdebi, synaptic, brave, telegram etc) IMPRESCINDIBLES. ${normal} ${RED}\xE2\x9D\x8C${normal}"
 	command -v stacer &> /dev/null ; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 5)  Instalacion de compresores, codecs de audio y video y fuentes. ${normal}${GREEN}\xE2\x9C\x85${normal}" \
 		|| echo -e "${GREEN} ${bold} 5)  Instalacion de compresores, codecs de audio y video + fuentes. ${normal} ${RED}\xE2\x9D\x8C${normal}"
 	command -v zsh &> /dev/null ; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 6)  Instalacion y configuracion de zsh (oh_my_zsh y powerlvl10k y plugins). ${normal}${GREEN}\xE2\x9C\x85${normal}" \
 		|| echo -e "${GREEN} ${bold} 6)  Instalacion y configuracion de zsh (oh_my_zsh y powerlvl10k y plugins). ${normal} ${RED}\xE2\x9D\x8C${normal}"
	command -v nvim &> /dev/null ; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 7)  Instalacion Nvim (Neochad). ${normal}${GREEN}\xE2\x9C\x85${normal}" \
 		|| echo -e "${GREEN} ${bold} 7)  Instalacion Nvim (Neochad). ${normal} ${RED}\xE2\x9D\x8C${normal}"
	command -v cups &> /dev/null ; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 8) Instalacion drivers impresora. ${normal}${GREEN}\xE2\x9C\x85${normal}" \
 		|| echo -e "${GREEN} ${bold} 8) Instalacion drivers impresora. ${normal} ${RED}\xE2\x9D\x8C${normal}"
	command -v cheese &> /dev/null ; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 9) Instalacion de temas. ${normal}${GREEN}\xE2\x9C\x85${normal}" \
 		|| echo -e "${GREEN} ${bold} 9) Instalacion de temas. ${normal} ${RED}\xE2\x9D\x8C${normal}"
	command -v jellyfin &> /dev/null ; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 10) Instalacion de Jellyfin. (Servidor de cine en casa). ${normal}${GREEN}\xE2\x9C\x85${normal}" \
		|| echo -e "${GREEN} ${bold} 10) Instalacion de Jellyfin. (Servidor de cine en casa). ${normal} ${RED}\xE2\x9D\x8C${normal}"
	command -v waydroid &> /dev/null ; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 11) Instalacion de Waydroid. (Instalacion de apps android). ${normal}${GREEN}\xE2\x9C\x85${normal}" \
		|| echo -e "${GREEN} ${bold} 11) Instalacion de Waydroid. (Instalacion de apps android). ${normal} ${RED}\xE2\x9D\x8C${normal}"
	grep -q "noatime" /etc/fstab; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 12) Mejorar rendimiento en discos Noatime. (Sobre todo HDD. Se puede perder en seguridad). ${normal}${GREEN}\xE2\x9C\x85${normal}" \
		|| echo -e "${GREEN} ${bold} 12) Mejorar rendimiento en discos Noatime. (Sobre todo HDD. Se puede perder en seguridad). ${normal} ${RED}\xE2\x9D\x8C${normal}"
	command -v qtcreator &> /dev/null ; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 13) Instalacion de entorno desarrollo QT para entorno C++. ${normal}${GREEN}\xE2\x9C\x85${normal}" \
 		|| echo -e "${GREEN} ${bold} 13) Instalacion de entorno desarrollo QT para entorno C++. ${normal} ${RED}\xE2\x9D\x8C${normal}"
 	command -v lutris &> /dev/null ; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 14) Instalacion de plataformas de juego. ${normal}${GREEN}\xE2\x9C\x85${normal}" \
 		|| echo -e "${GREEN} ${bold} 14) Instalacion de plataformas de juego. ${normal} ${RED}\xE2\x9D\x8C${normal}"
 	command -v extension-manager &> /dev/null ; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 15) Indispensables para escritorio GNOME. ${normal}${GREEN}\xE2\x9C\x85${normal}" \
 		|| echo -e "${GREEN} ${bold} 15) Indispensables para escritorio GNOME. ${normal} ${RED}\xE2\x9D\x8C${normal}"
 	command -v ollama &> /dev/null ; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 16) Instalacion de Ollama. IA. ${normal} ${GREEN} \xE2\x9C\x85${normal}" \
	    || echo -e "${GREEN} ${bold} 16) Instalacion de Ollama. IA.${normal} ${RED}\xE2\x9D\x8C${normal}"

	command -v plymouth &> /dev/null ; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 17) Instalacion de plymouth. (Animacion de inicio y cierre). ${normal} ${GREEN} \xE2\x9C\x85${normal}" \
		|| echo -e "${GREEN} ${bold} 17) Instalacion de plymouth. (Animacion de inicio y cierre).${normal} ${RED}\xE2\x9D\x8C${normal}"

	  echo -e "${GREEN} ${bold} 17) Salir. ${normal}"
	  echo -e " "
	  echo -e " "
	  read -e -p "${ORANGE} ${bold} Respuesta [1], [2], [3]...:  ${normal} " opcion 
	


	case $opcion in 
		1)

			# Instalacion de tweak para repositorios y sudoers
			funcion_cabezera "Añadiendo tweaks a sudoers... \n ==> Añadiendo $REALUSER a sudoers"
			sudo cp /etc/sudoers /etc/sudoers.bak
			sudo sed -i 's/env_reset/env_reset,pwfeedback/g' /etc/sudoers
			sudo sed -i "/root	ALL=(ALL:ALL) ALL/a $REALUSER ALL=(ALL:ALL) ALL" /etc/sudoers
			echo -e " "
			echo -e "${ORANGE} ${bold} ==> Modificando los repositorios... ${normal}"
			echo -e " "
			sudo mv /etc/apt/sources.list /etc/apt/sources.back

			sudo echo "#Repos oficiales no libres" > /etc/apt/sources.list
			sudo echo "deb https://ftp.debian.org/debian/ bookworm contrib main non-free non-free-firmware" >> /etc/apt/sources.list
			sudo echo "deb-src https://ftp.debian.org/debian/ bookworm contrib main non-free non-free-firmware" >> /etc/apt/sources.list
			sudo echo "#Actualizaciones" >> /etc/apt/sources.list
			sudo echo "deb https://ftp.debian.org/debian/ bookworm-updates contrib main non-free non-free-firmware" >> /etc/apt/sources.list
			sudo echo "#deb-src https://ftp.debian.org/debian/ bookworm-updates contrib main non-free non-free-firmware" >> /etc/apt/sources.list
			sudo echo "deb https://ftp.debian.org/debian/ bookworm-proposed-updates contrib main non-free non-free-firmware" >> /etc/apt/sources.list
			sudo echo "#deb-src https://ftp.debian.org/debian/ bookworm-proposed-updates contrib main non-free non-free-firmware" >> /etc/apt/sources.list
			sudo echo "#Seguridad" >> /etc/apt/sources.list
			sudo echo "deb https://security.debian.org/debian-security bookworm-security contrib main non-free non-free-firmware" >> /etc/apt/sources.list
			sudo echo "#deb-src https://security.debian.org/debian-security bookworm-security contrib main non-free non-free-firmware" >> /etc/apt/sources.list
			sudo echo "#Repositorios Backports" >> /etc/apt/sources.list
			sudo echo "deb https://ftp.debian.org/debian/ bookworm-backports contrib main non-free non-free-firmware" >> /etc/apt/sources.list
			sudo echo "#deb-src https://ftp.debian.org/debian/ bookworm-backports contrib main non-free non-free-firmware" >> /etc/apt/sources.list
			sudo echo "#Repositorio multimedia" >> /etc/apt/sources.list
			sudo echo "#deb https://www.deb-multimedia.org bookworm main non-free" >> /etc/apt/sources.list

			sudo apt update
			sudo apt upgrade

			funcion_done "Tweaks sudoers y de repositorios añadidos"
			;;
		

		2)

			# Instalacion de tweaks para compilaciones
			funcion_cabezera "Instalando software necesario para compilaciones..."

			sudo apt install linux-headers-$kernel -y

			sudo apt install build-essential checkinstall automake cmake git autoconf exfat-fuse hfsplus hfsutils curl apt-transport-https gvfs-backends gvfs-fuse nix libglvnd-dev pkg-config initramfs-tools -y

			funcion_done

			#echo -e "${ORANGE} ${bold} ==> Tweaks para las compilaciones ${normal}"
			#echo -e "${ORANGE} ${bold} ==> Mejorando makepkg para las compilaciones!!... ${normal}"
			#sudo sed -i "/\#-- Make Flags: change this for DistCC\/SMP systems/a MAKEFLAGS=\"-j$NPROC\"" /etc/makepkg.conf

			#if ! command -v yay &> /dev/null
			#	then

			#		if ! command -v paru &> /dev/null
			#			then
			#				echo "Necesitas tener instalado yay o algun asistente de yaourt!"
    		#				#exit 1
    		#		else
    		#			echo -e "${ORANGE} ${bold} ==> Instalacion de cpuid2cpuflags... ${normal}"
			#			paru -S cpuid2cpuflags --noconfirm

			#		fi
			#else
			#	echo -e "${ORANGE} ${bold} ==> Instalacion de cpuid2cpuflags... ${normal}"
			#	yay -S cpuid2cpuflags --noconfirm

			#fi


			#CPUID2CPUFLAGS=$(cpuid2cpuflags)
			#sudo sed -i 's/CFLAGS=\"-march=x86-64/CFLAGS=\"-march=native/g' /etc/makepkg.conf
			#sudo sed -i "/#-- Compiler and Linker Flags/a $CPUID2CPUFLAGS" /etc/makepkg.conf
			#sudo sed -i 's/CPU_FLAGS_X86:/CPU_FLAGS_X86=\"/g' /etc/makepkg.conf
			#sudo sed -i 's/^CPU_FLAGS_X86.*/&\"/' /etc/makepkg.conf

			;;

		3)

								# Instalacion de drivers nvidia
			funcion_cabezera "Instalando drives Nvidia"


			# La version DKMS es nvidia-kernel-dkms
			
			sudo apt install software-properties-common dirmngr ca-certificates apt-transport-https dkms -y
			sudo apt install nvidia-detect
			sudo apt install nvidia-driver nvidia-smi nvidia-settings linux-image-amd64 -y
			sudo apt install nvidia-driver-libs:i386 libnvidia-egl-wayland1 -y

			funcion_cabezera "Dando soporte para Waylando con los drivers Nvidia!"
			#echo options nvidia_drm modeset=1 | tee /etc/modprobe.d/nvidia_drm.conf
			#echo options nvidia_drm modeset=1 | tee /etc/modprobe.d/nvidia_drm.conf
			sudo bash -c 'echo "options nvidia nvidia_modeset nvidia_uvm nvidia_drm modeset=1 fbdev=1 " > /etc/modprobe.d/nvidia-power-management.conf'
			sudo bash -c 'echo "options nvidia NVreg_PreserveVideoMemoryAllocations=1 " >> /etc/modprobe.d/nvidia-power-management.conf'
			sudo bash -c 'echo "options nvidia NVreg_TemporaryFilePath=/var/tmp " >> /etc/modprobe.d/nvidia-power-management.conf'
			sudo bash -c 'echo "options nvidia NVreg_UsePageAttributeTable=1 " >> /etc/modprobe.d/nvidia-power-management.conf'
			su -
			echo 'GRUB_CMDLINE_LINUX="$GRUB_CMDLINE_LINUX nvidia-drm.modeset=1"' > /etc/default/grub.d/nvidia-modeset.cfg
			echo 'WaylandEnable=true' > /etc/gdm3/daemon.conf
			exit 
			sudo systemctl enable nvidia-suspend.service && systemctl enable nvidia-resume.service && systemctl enable nvidia-hibernate.service
			#sudo ln -s /dev/null /etc/udev/rules.d/61-gdm.rules
			sudo update-grub
			sudo dpkg --add-architecture i386

			sudo update-initramfs -u
			#apt update
			#apt install libcuda1-i386 nvidia-driver-libs-i386

			funcion_done "Es necesario reiniciar para que los cambios tengan efecto"
			;;

		4)
			#opcionyaourthelper=0

			funcion_cabezera "Instalando software..."
			sudo apt install gdebi gdebi-core synaptic stacer deluge telegram-desktop calibre wget terminator curl git vlc mpv fastfetch btop youtube-dl -y

			sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
			echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
			sudo apt update
			sudo apt install brave-browser -y


			funcion_cabezera "Instalando flatpak..."

			sudo apt install flatpak -y
			flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


			funcion_cabezera "Instalando balena etcher y sublime text..."
			wget https://github.com/balena-io/etcher/releases/download/v1.19.16/balena-etcher_1.19.16_amd64.deb -P /tmp
			sudo apt install /tmp/balena-etcher_******_amd64.deb


			wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
			echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
			sudo apt update
			sudo apt install sublime-text -y

			funcion_done "Es necesario reiniciar.."

			;;

		5) 
			# Instalacion de sofware util con apt
			funcion_cabezera "Instalando compresores y codecs..."

			sudo apt -y install unace p7zip-full lzip arj mpack lzma lzop unzip zip bzip2 lhasa cabextract lrzip rzip zpaq kgb xz-utils p7zip-full p7zip-rar rar unrar

			echo -e " "
			echo -e " "
			echo -e "${ORANGE} ${bold} ==> Instalando codecs... ${normal}"
			sudo apt install ffmpeg libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-plugins-bad gstreamer1.0-pulseaudio vorbis-tools -y
			

			echo -e " "
			echo -e " "
			echo -e "${ORANGE} ${bold} ==> Instalando fuentes... ${normal}"
			sudo apt install fonts-freefont-ttf fonts-freefont-otf fonts-font-awesome fonts-powerline fonts-hack-ttf -y
			sudo apt -y install fonts-inconsolata fonts-droid-fallback xfonts-terminus fonts-droid-fallback ttf-bitstream-vera fonts-cantarell fonts-liberation fonts-oflb-asana-math fonts-mathjax -y
			sudo apt install ttf-mscorefonts-installer -y
			sudo apt install fonts-ubuntu -y

			funcion_done
			;;


		6)
			# Instalacion de zsh, oh my zsh ..

			funcion_cabezera "Instalacion de zsh oh my zsh y powerlvl10k"
			echo -e "${RED} ${bold} ==> INSTALAR fuentes de MesloLGS y nerd fonts desde : https://www.nerdfonts.com/font-downloads \n ==> Copia las fuentes en /usr/share/fonts ${normal}"
			sleep 2
			sudo apt install zsh -y
			
			sleep 1
			sudo chsh -s $(which zsh)
			sleep 1

			echo -e "# Set up the prompt" | tee -a /home/$REALUSER/.zshrc
			echo " " | tee -a /home/$REALUSER/.zshrc
			echo "autoload -Uz promptinit" | tee -a /home/$REALUSER/.zshrc
			echo "promptinit" | tee -a /home/$REALUSER/.zshrc
			echo "prompt adam1" | tee -a /home/$REALUSER/.zshrc
			echo " " | tee -a /home/$REALUSER/.zshrc
			echo "setopt histignorealldups sharehistory" | tee -a /home/$REALUSER/.zshrc
			echo " " | tee -a /home/$REALUSER/.zshrc
			echo "# Use emacs keybindings even if our EDITOR is set to vi" | tee -a /home/$REALUSER/.zshrc
			echo "bindkey -e" | tee -a /home/$REALUSER/.zshrc
			echo " " | tee -a /home/$REALUSER/.zshrc
			echo "# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:" | tee -a /home/$REALUSER/.zshrc
			echo "HISTSIZE=1000" | tee -a /home/$REALUSER/.zshrc
			echo "SAVEHIST=1000" | tee -a /home/$REALUSER/.zshrc
			echo "HISTFILE=~/.zsh_history" | tee -a /home/$REALUSER/.zshrc
			echo " " | tee -a /home/$REALUSER/.zshrc
			echo "# Use modern completion system" | tee -a /home/$REALUSER/.zshrc
			echo "autoload -Uz compinit" | tee -a /home/$REALUSER/.zshrc
			echo "compinit" | tee -a /home/$REALUSER/.zshrc
			echo " " | tee -a /home/$REALUSER/.zshrc
			echo "zstyle ':completion:*' auto-description 'specify: %d'" | tee -a /home/$REALUSER/.zshrc
			echo "zstyle ':completion:*' completer _expand _complete _correct _approximate" | tee -a /home/$REALUSER/.zshrc
			echo "zstyle ':completion:*' format 'Completing %d'" | tee -a /home/$REALUSER/.zshrc
			echo "zstyle ':completion:*' group-name ''" | tee -a /home/$REALUSER/.zshrc
			echo "zstyle ':completion:*' menu select=2" | tee -a /home/$REALUSER/.zshrc
			echo "eval \"\$(dircolors -b)\" " | tee -a /home/$REALUSER/.zshrc
			echo "zstyle ':completion:*:default' list-colors \${(s.:.)LS_COLORS}" | tee -a /home/$REALUSER/.zshrc
			echo "zstyle ':completion:*' list-colors ''" | tee -a /home/$REALUSER/.zshrc
			echo "zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s" | tee -a /home/$REALUSER/.zshrc
			echo "zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'" | tee -a /home/$REALUSER/.zshrc
			echo "zstyle ':completion:*' menu select=long" | tee -a /home/$REALUSER/.zshrc
			echo "zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s" | tee -a /home/$REALUSER/.zshrc
			echo "zstyle ':completion:*' use-compctl false" | tee -a /home/$REALUSER/.zshrc
			echo "zstyle ':completion:*' verbose true" | tee -a /home/$REALUSER/.zshrc
			echo " " | tee -a /home/$REALUSER/.zshrc
			echo "zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'" | tee -a /home/$REALUSER/.zshrc
			echo "zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'" | tee -a /home/$REALUSER/.zshrc
			echo " " | tee -a /home/$REALUSER/.zshrc
			sleep 3
			#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
			terminator -e 'bash -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh);exit"'
			#git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
			sleep 5
			terminator -e "bash -c 'git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k;exit'"

			clear
			echo -e " "
			echo -e " "
			echo -e "${RED} ${bold}CIERRA LA VENTANA ABIERTA CON ZSH!${normal}"
			funcion_continuar

			funcion_cabezera "Instalacion de fuentes necesarias"

			sudo apt install fonts-powerline
			sudo wget -P /usr/local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
			sudo wget -P /usr/local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
			sudo wget -P /usr/local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
			sudo wget -P /usr/local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
			sudo apt install fonts-material-design-icons-iconfont
			wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/NerdFontsSymbolsOnly.zip -P /tmp
			sudo mkdir /usr/share/fonts/NerdFontsSymbolsOnly
			sudo unzip /tmp/NerdFontsSymbolsOnly.zip $(unzip -l /tmp/NerdFontsSymbolsOnly.zip | grep ".ttf" | awk '{print $4}') -d /usr/share/fonts/NerdFontsSymbolsOnly

			wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Meslo.zip -P /tmp
			sudo mkdir /usr/share/fonts/MesloNerdFont
			sudo unzip /tmp/Meslo.zip $(unzip -l /tmp/Meslo.zip | grep ".ttf" | awk '{print $4}') -d /usr/share/fonts/MesloNerdFont

			#wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1SA4Z8PY4B3IDuUZSLRihNoCm3utgYk4Y' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1SA4Z8PY4B3IDuUZSLRihNoCm3utgYk4Y" -O Fuentes.zip && rm -rf /tmp/cookies.txt
			#https://drive.google.com/uc?export=download&id=1SA4Z8PY4B3IDuUZSLRihNoCm3utgYk4Y&confirm=t
    		curl 'https://drive.usercontent.google.com/download?id=1SA4Z8PY4B3IDuUZSLRihNoCm3utgYk4Y&export=download&confirm=t' \
    -o Fuentes.zip --output-dir /tmp

			sudo unzip /tmp/Fuentes.zip -d /usr/share/fonts 


			sudo fc-cache -fv


			sed -i 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"powerlevel10k\/powerlevel10k\"/g' $HOME/.zshrc
			funcion_cabezera "Instalando plugin zsh-autosuggestion"
			git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

			funcion_cabezera "Instalando plugin syntax-hightlighting"
			git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
			sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' $HOME/.zshrc
			
			funcion_done "Abre una terminal y configura tu nuevo ZSH!"
			;;

		7)

			# Instalacion de Neovim y NeoChad

			funcion_cabezera "Instalando Nvim - NvChad"
			wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -P /tmp
			chmod +x /tmp/nvim.appimage
			sudo mv /tmp/nvim.appimage /usr/local/bin/nvim
			sudo apt install ripgrep clang npm -y
			curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz --output-dir /tmp
			sudo rm -rf /opt/nvim
			mkdir /home/$REALUSER/.nvim
			tar -C /home/$REALUSER/.nvim -xzf /tmp/nvim-linux64.tar.gz
			echo export PATH="$PATH:/home/$REALUSER/.nvim/nvim-linux64/bin" >> /home/$REALUSER/.bashrc
			#exec $SHELL
			git clone https://github.com/NvChad/starter /home/$REALUSER/.config/nvim && nvim
			echo -e " "
			echo -e " "
			echo -e " "
			echo -e "${ORANGE} ${bold} ==> Corre el comando :MasonInstallAll dentro de NvChad! ${normal}"
			echo -e "${ORANGE} ${bold} ==> Reinicia Nvim \n ==> Con el Comando :Mason apareceran los lenguajes para instalar ${normal}"
			echo -e "${ORANGE} ${bold} ==> Nos moveremos por ellos con flecha arriva y abajo y para instalar presionamos la letra i ${normal}"
			echo -e "${ORANGE} ${bold} ==> Corre el comando :Lazy para tener acceso a los plugins ${normal}"
			echo -e " "

			funcion_continuar
			;;


		8)
			# Instalacion de impresora
			funcion_cabezera "Instalacion de impresora..."
			sudo apt install cups cups-filters avahi ghostscript gsfonts -y
			sudo systemctl enable cups && systemctl start cups
			funcion_done
			;;

		9)
			# Instalacion de extras para gnome
			funcion_cabezera "Instalacion de temas..."
			sudo apt install deepin-icon-theme papirus-icon-theme yaru-theme-icon yaru-theme-sound -y
			mkdir /home/$REALUSER/.icons
			curl -LOsS https://github.com/catppuccin/cursors/releases/download/v1.0.2/catppuccin-frappe-blue-cursors.zip --output-dir /tmp
			unzip /tmp/catppuccin-frappe-blue-cursors.zip -d /home/$REALUSER/.icons
			funcion_done
			;;

		

		10)

			# Instalacion completa de Jellyfin
			funcion_cabezera "Instalacion de Jellyfin..."
			curl -s https://repo.jellyfin.org/install-debuntu.sh | sudo bash

			curl -fsSL https://repo.jellyfin.org/debian/jellyfin_team.gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/jellyfin.gpg > /dev/null
			echo "deb [arch=$( dpkg --print-architecture ) signed-by=/usr/share/keyrings/jellyfin.gpg] https://repo.jellyfin.org/debian $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/jellyfin.list

			sudo apt update

			sudo apt install jellyfin jellyfin-ffmpeg5 jellyfin-server jellyfin-web

			sudo systemctl enable jellyfin.service
			sudo systemctl start jellyfin.service

			funcion_done "Configura tu cuenta y tu IP en Jellyfin -> localhost:8096"
			;;


		11)
			# Instalacion de Waydroid
			funcion_cabezera "Instalando Waydroid..."
			
			sudo apt install curl ca-certificates -y
			curl https://repo.waydro.id | sudo bash
			sudo apt install waydroid -y

			waydroid container start
			waydroid session start
			waydroid show-full-ui

			echo -e " "
			echo -e " "
			echo -e "${ORANGE} ${bold} ==> Instalar apk : waydroid app install \$path_to_apk  ${normal}"
			echo -e "${ORANGE} ${bold} ==> Listar aplicaciones : waydroid app list ${normal}"
			echo -e "${ORANGE} ${bold} ==> Correr aplicacion : waydroid app launch \$package_name ${normal}"

			funcion_continuar
			;;


		12)
			#Configuracion de noatime en fstab

			funcion_cabezera "Realizando cambios en fstab..."
			sudo cp -p /etc/fstab /etc/fstab.backup
			sudo sed -i 's/relatime/noatime/g' /etc/fstab
			funcion_done
			;;




		13)
			# Instalacion de entrono de desarrollo QT

			sudo apt install qt6-base-dev qt6-base-dev-tools qtcreator -y
			sleep 2 
			;;



		14)
			funcion_cabezera "Instalando lutris"

			sudo apt install lutris -y

			funcion_cabezera "Instalando Heroic games launcher (GOG)"

			wget https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v2.14.1/heroic_2.14.1_amd64.deb --output-dir /tmp
			sudo dpkg -i /tmp/heroic_*_amd64.deb

			funcion_cabezera "Instalando Steam"

			sudo apt install software-properties-common apt-transport-https dirmngr ca-certificates curl -y
			dpkg --add-architecture i386
			sudo apt update
			sudo apt install mesa-vulkan-drivers libglx-mesa0:i386 mesa-vulkan-drivers:i386 libgl1-mesa-dri:i386 nvidia-driver-libs:i386 -y
			sudo apt install steam-installer steam-devices -y
			sudo dpkg --add-architecture i386

			funcion_done "Tendras un instalador de steam para terminar la instalacion!"
			;;

		15)
			funcion_cabezera "Indispensables para escritorio GNOME"
			sudo apt install extension-manager
			sudo apt install yaru-theme-icon yaru-theme-gnome-shell yaru-theme-gtk gnome-shell-extension-manager
			funcion_done
			;;


		16)
			curl -fsSL https://ollama.com/install.sh | sh
			terminator -e 'bash -c "ollama serve"'
			terminator -e 'bash -c "ollama run aratan/qwq"'
			funcion_continuar
			funcion_done "Usa : - ollama serve - para el servidor y - ollama run \"aratan/qwq:latest\" - para ejecutar"
			;;

		17) # Instalacion de plymouth


			sudo apt install plymouth plymouth-themes -y
			sudo sed -i 's/HOOKS=(base udev/HOOKS=(base udev plymouth/g' /etc/mkinitcpio.conf

			
			sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT=\x27/GRUB_CMDLINE_LINUX_DEFAULT=\x27quiet splash/g' /etc/default/grub
			sudo sed -i 's/GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX_DEFAULT="splash/g' /etc/default/grub
 			
			curl 'https://drive.usercontent.google.com/download?id=1V5gLDwIlos0kcvcvvZ2KVEU0g6zeH3od&export=download&confirm=t' \
    -o Tema_playmouth_connect.tar.gz --output-dir /tmp

    		# ESTOY AQUI añadiendo temas al grub

 			plymouth-set-default-theme -R THEME




 			https://drive.google.com/file/d/1V5gLDwIlos0kcvcvvZ2KVEU0g6zeH3od/view?usp=sharing


 			sudo update-grub
 			sudo update-initramfs -u
			;;



		18)
			exit 0
			;;


		*)
			echo -e "${RED} ${bold} ==> Opcion incorrecta... ${normal}"
			sleep 2
			clear
			;;
	esac

	

done










