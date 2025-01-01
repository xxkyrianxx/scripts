#!/bin/bash


#RED=$(tput setaf 1)
#GREEN=$(tput setaf 2)
ORANGE=$(tput setaf 3)
#BLUE=$(tput setaf 4)
RED='\033[0;31m' ; LIGHTRED='\033[1;31m' ; GREEN='\033[0;32m' ; LIGHTGREEN='\033[1;32m' ; BLUE='\033[0;34m' ; DARKBLUE='\033[1;34m'
YELLOW='\033[1;33m' ; BLACK='\033[0;30m' ; GRAY='\033[0;37m' ; DARKGRAY='\033[1;30m'  ; PURPLE='\033[0;35m'
WHITE='\033[1;37m' ; CYAN='\033[0;36m' ; DARKCYAN='\033[1;30m' ; COFEE='\033[0;33m' ; MAGENTA='\033[1;35m' ; NC='\033[0m' # No Color
#; ORANGE='\033[0;33m'


normal=$(tput sgr0)
bold=$(tput bold)
fecha=$(date)
current_folder="$(dirname "$0")"
exit=false
opcion=""
kernel=$(uname -r)
NPROC=$(nproc) 
REALUSER=$(awk -F'[/:]' '{if ($3 >= 1000 && $3 != 65534) print $1}' /etc/passwd)

TMP_PATH=/var/tmp
TMPL_PATH=/usr/share/doc/nvidia/

clear 

echo -e " "
echo -e " "
echo -e  "${BLUE} ${bold}		-----------------------------------------------${normal}"
echo -e  "${BLUE} ${bold}		|                                             |${normal}"
echo -e  "${BLUE} ${bold}		|     Script de postinstalacion de archlinux  |${normal}"
echo -e  "${BLUE} ${bold}		|                                             |${normal}"					
echo -e  "${BLUE} ${bold}		-----------------------------------------------${normal}"
echo -e " "



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




#instalar QEMU

# sudo pacman -S qemu virt-manager dnsmasq

#systemctl restart libvirtd
#systemctl enable libvirtd

#systemctl start dnsmasq.service
#systemctl enable dnsmasq.service

#echo -e "${RED}\xE2\x9D\x8C${normal}" #no
#echo -e "${GREEN}\xE2\x9C\x85${normal}" #yes


while [[ $exit == false ]]; do
	#read -e -p "${ORANGE} ${bold} 				 Elige una opcion! ${normal} "
	
	 ! command -v nvidia-settings &> /dev/null; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 1)  Instalacion drivers nvidia. ${normal} ${GREEN} \xE2\x9C\x85${normal}" \
 		|| echo -e "${GREEN} ${bold} 1)  Instalacion drivers nvidia. ${normal}${RED}\xE2\x9D\x8C${normal}"
	 command -v reflector &> /dev/null; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 2)  Tweaks para los repositorios. ${normal} ${GREEN} \xE2\x9C\x85${normal}" \
 		|| echo -e "${GREEN} ${bold} 2) Tweaks para los repositorios.(recomendado)${normal}${RED}\xE2\x9D\x8C${normal}"
	 grep -q "march=native" /etc/makepkg.conf; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 3)  Tweaks para compilaciones. ${normal} ${GREEN} \xE2\x9C\x85${normal}" \
 		|| echo -e "${GREEN} ${bold} 3)  Tweaks para compilaciones.(recomendado) ${normal}${RED}\xE2\x9D\x8C${normal}"
	  command -v paru &> /dev/null || command -v yay &> /dev/null; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 4)  Instalacion de asistente yaourt (YAY PARU). ${normal} ${GREEN} \xE2\x9C\x85${normal}" \
 		|| echo -e "${GREEN} ${bold} 4)  Instalacion de asistente yaourt (YAY PARU).(recomendado)${normal}${RED}\xE2\x9D\x8C${normal}"
	  command -v firefox &> /dev/null ; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 5)  Instalacion direfente softwate con pacman (firefox, terminal, gparted, gimp etc). ${normal} ${GREEN} \xE2\x9C\x85${normal}" \
 		|| echo -e "${GREEN} ${bold} 5)  Instalacion direfente softwate con pacman (firefox, terminal, gparted, gimp etc).${normal} ${RED}\xE2\x9D\x8C${normal}"
	  command -v stacer &> /dev/null ; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 6)  Instalacion de diferente software con yaourt (stacer, brave, sublime text, exodus etc ). ${normal} ${GREEN} \xE2\x9C\x85${normal}" \
 		|| echo -e "${GREEN} ${bold} 6)  Instalacion de diferente software con yaourt (stacer, brave, sublime text, exodus etc )${normal} ${RED}\xE2\x9D\x8C${normal}"
	  command -v zsh &> /dev/null ; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 7)  Instalacion y configuracion de zsh (oh_my_zsh y powerlvl10k y plugins). ${normal} ${GREEN} \xE2\x9C\x85${normal}" \
 		|| echo -e "${GREEN} ${bold} 7)  Instalacion y configuracion de zsh (oh_my_zsh y powerlvl10k y plugins).(recomendado)${normal} ${RED}\xE2\x9D\x8C${normal}"
	  command -v nvim &> /dev/null ; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 8)  Instalacion Nvim (Neochad). ${normal} ${GREEN} \xE2\x9C\x85${normal}" \
 		|| echo -e "${GREEN} ${bold} 8)  Instalacion Nvim (Neochad).${normal} ${RED}\xE2\x9D\x8C${normal}"
	  command -v bluetoothctl &> /dev/null ; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 9)  Instalacion bluetooth. ${normal} ${GREEN} \xE2\x9C\x85${normal}" \
		|| echo -e "${GREEN} ${bold} 9)  Instalacion bluetooth..${normal}${RED}\xE2\x9D\x8C${normal}"
	  command -v fc-list | grep -i "hack" &> /dev/null ; [ $? != "" ] && echo -e "${DARKGRAY} ${bold} 10) Instalacion de fuentes (google, microsoft, hack, etc...). ${normal} ${GREEN} \xE2\x9C\x85${normal}" \
 		|| echo -e "${GREEN} ${bold} 10) Instalacion de fuentes (google, microsoft, hack, etc...) (recomendado).${normal} ${RED}\xE2\x9D\x8C${normal}"
	  command -v flac &> /dev/null ; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 11) Instalacion de codecs multimedia (no necesario si se instala vlc). ${normal} ${GREEN} \xE2\x9C\x85${normal}" \
 		|| echo -e "${GREEN} ${bold} 11) Instalacion de codecs multimedia (no necesario si se instala vlc).${normal}${RED}\xE2\x9D\x8C${normal}"
	  command -v ghostscript &> /dev/null ; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 12) Instalacion drivers impresora. ${normal} ${GREEN} \xE2\x9C\x85${normal}" \
 		|| echo -e "${GREEN} ${bold} 12) Instalacion drivers impresora.${normal} ${RED}\xE2\x9D\x8C${normal}"
	  command -v cheese &> /dev/null ; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 13) Instalacion de gnome extras (SOLO ESCRITORIO GNOME). ${normal} ${GREEN} \xE2\x9C\x85${normal}" \
 		|| echo -e "${GREEN} ${bold} 13) Instalacion de gnome extras (SOLO ESCRITORIO GNOME)${normal} ${RED}\xE2\x9D\x8C${normal}"
 	  lscpu | grep -i "Intel" &> /dev/null ; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 14) Instalacion de ucode para procesador con grub (recomendado). ${normal} ${GREEN} \xE2\x9C\x85${normal}" \
 		|| echo -e "${GREEN} ${bold} 14) Instalacion de ucode para procesador con grub. (recomendado) <== ${normal} ${RED}\xE2\x9D\x8C${normal}"
	  command -v preload &> /dev/null ; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 15) Instalacion de preload (recomendado). ${normal} ${GREEN} \xE2\x9C\x85${normal}" \
		|| echo -e "${GREEN} ${bold} 15) Instalacion de preload.(recomendado)${normal} ${RED}\xE2\x9D\x8C${normal}"
	  command -v jellyfin &> /dev/null ; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 16) Instalacion de Jellyfin. (Servidor de cine en casa). ${normal} ${GREEN} \xE2\x9C\x85${normal}" \
		|| echo -e "${GREEN} ${bold} 16) Instalacion de Jellyfin. (Servidor de cine en casa)${normal} ${RED}\xE2\x9D\x8C${normal}"
	  command -v waydroid &> /dev/null ; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 17) Instalacion de Waydroid. (Instalacion de apps android). ${normal} ${GREEN} \xE2\x9C\x85${normal}" \
		|| echo -e "${GREEN} ${bold} 17) Instalacion de Waydroid. (Instalacion de apps android)${normal} ${RED}\xE2\x9D\x8C${normal}"
	  grep -q "noatime" /etc/fstab; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 18) Mejorar rendimiento en discos Noatime. (Sobre todo HDD. Se puede perder en seguridad). ${normal} ${GREEN} \xE2\x9C\x85${normal}" \
		|| echo -e "${GREEN} ${bold} 18) Mejorar rendimiento en discos Noatime. (Sobre todo HDD. Se puede perder en seguridad). ${normal} ${GREEN} \xE2\x9C\x85${normal} ${RED}\xE2\x9D\x8C${normal}"
	   [[ -d "/usr/lib/gtkmm-4.0" ]] ; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 19) Instalacion de entorno desarrollo GTK para entorno C++ (gtkmm-4). ${normal} ${GREEN} \xE2\x9C\x85${normal}" \
 		|| echo -e "${GREEN} ${bold} 19) Instalacion de entorno desarrollo GTK para entorno C++ (gtkmm-4).${normal} ${RED}\xE2\x9D\x8C${normal}"

 	   [[ -d "/usr/lib/qt" ]] ; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 20) Instalacion de entorno desarrollo QT para entorno C++. ${normal} ${GREEN} \xE2\x9C\x85${normal}" \
 		|| echo -e "${GREEN} ${bold} 20) Instalacion de entorno desarrollo QT para entorno C++.${normal} ${RED}\xE2\x9D\x8C${normal}"
 	  command -v plymouth &> /dev/null ; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 21) Instalacion de plymouth. (Animacion de inicio y cierre). ${normal} ${GREEN} \xE2\x9C\x85${normal}" \
		|| echo -e "${GREEN} ${bold} 21) Instalacion de plymouth. (Animacion de inicio y cierre).${normal} ${RED}\xE2\x9D\x8C${normal}"

	  command -v ollama &> /dev/null ; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 22) Instalacion de Ollama. IA. ${normal} ${GREEN} \xE2\x9C\x85${normal}" \
	    || echo -e "${GREEN} ${bold} 22) Instalacion de Ollama. IA.${normal} ${RED}\xE2\x9D\x8C${normal}"



	  echo -e "${GREEN} ${bold} 23) Limpiar paquetes huerfanos. ${normal}"
	  echo -e "${GREEN} ${bold} 24) Salir. ${normal}"
	  echo -e " "
	  echo -e " "
	  read -e -p "${ORANGE} ${bold} Respuesta [1], [2], [3]...:  ${normal} " opcion 
	


	case $opcion in 
		1)
			# Instalacion de drivers nvidia
			funcion_cabezera  "Instalando drives Nvidia"
			sudo pacman -S linux-headers --noconfirm
			sudo pacman -S nvidia-dkms --noconfirm
			sudo depmod $kernel
			echo -e "${ORANGE} ${bold} ==>  Añadiendo modulos al kernel... ${normal}"

			sudo touch /etc/modprobe.d/nvidia-power-management.conf

			sudo bash -c 'echo "options nvidia nvidia_modeset nvidia_uvm nvidia_drm modeset=1 fbdev=1 " > /etc/modprobe.d/nvidia-power-management.conf'
			sudo bash -c 'echo "options nvidia NVreg_PreserveVideoMemoryAllocations=1 " >> /etc/modprobe.d/nvidia-power-management.conf'
			sudo bash -c 'echo "options nvidia NVreg_TemporaryFilePath=/var/tmp " >> /etc/modprobe.d/nvidia-power-management.conf'
			sudo bash -c 'echo "options nvidia NVreg_UsePageAttributeTable=1 " >> /etc/modprobe.d/nvidia-power-management.conf'
			#sudo echo "options nvidia NVreg_RegistryDwords=\"OverrideMaxPerf=0x1 " >> /etc/modprobe.d/nvidia-power-management.conf'


			sudo systemctl enable nvidia-suspend.service && systemctl enable nvidia-resume.service && systemctl enable nvidia-hibernate.service

			#sudo install --mode 644 "${TMPL_PATH}/nvidia-suspend.service" /etc/systemd/system
			#sudo install --mode 644 "${TMPL_PATH}/nvidia-hibernate.service" /etc/systemd/system
			#sudo install --mode 644 "${TMPL_PATH}/nvidia-resume.service" /etc/systemd/system
			#sudo install "${TMPL_PATH}/nvidia" /lib/systemd/system-sleep
			#sudo install "${TMPL_PATH}/nvidia-sleep.sh" /usr/bin

			sudo mkinitcpio -P

			funcion_done
			;;
		
		2)
			# Instalacion de tweak para repositorios
			funcion_cabezera "Tweaks velocidad de los repositorios... \n ==> Instalando reflector..."
			sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
			sudo pacman -S reflector --noconfirm
			sudo reflector --verbose --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist 
			sudo sed -i 's/#--country France,Germany/--country France,Germany,Spain,Portugal/g' /etc/xdg/reflector/reflector.conf

			sudo systemctl enable reflector.service reflector.timer
			sudo systemctl start	reflector.service reflector.timer
			funcion_done "Puedes comprobar los mirrors con : cat /etc/pacman.d/mirrorlist"

			funcion_cabezera "Activando descargas paralelas en pacman"
			sudo sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 10/g' /etc/pacman.conf

			funcion_cabezera "Agregando Chaotic-AUR servers"
			sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
			sudo pacman-key --lsign-key 3056513887B78AEB
			sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' --noconfirm
			sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' --noconfirm
			echo " " | sudo tee -a /etc/pacman.conf
			echo "[chaotic-aur]" | sudo tee -a /etc/pacman.conf
			echo "Include = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf
			sudo pacman -Sy
			funcion_done

			funcion_cabezera "Modo pacman en pacman!!..."
			sudo sed -i "/\[options\]/a ILoveCandy" /etc/pacman.conf 
			sudo sed -i 's/#Color/Color/g' /etc/pacman.conf

			funcion_done
			;;

		3)
			# Instalacion de tweaks para compilaciones
			funcion_cabezera "Instalando software necesario... "
			sudo pacman -S base-devel xmlto kmod inetutils bc libelf git cpio perl tar xz fakeroot flex rsync gawk flex bison openssl dkms llvm pahole dnsmasq --noconfirm
			funcion_cabezera "Tweaks para las compilaciones"
			echo -e "${ORANGE} ${bold} ==> Mejorando makepkg para las compilaciones!!... ${normal}"
			sudo sed -i "/\#-- Make Flags: change this for DistCC\/SMP systems/a MAKEFLAGS=\"-j$NPROC\"" /etc/makepkg.conf
			
			if ! command -v yay &> /dev/null
				then

					if ! command -v paru &> /dev/null
						then
							echo "Necesitas tener instalado yay o algun asistente de yaourt!"
    						#exit 1
    				else
    					echo -e "${ORANGE} ${bold} ==> Instalacion de cpuid2cpuflags... ${normal}"
						paru -S cpuid2cpuflags --noconfirm

					fi
			else
				echo -e "${ORANGE} ${bold} ==> Instalacion de cpuid2cpuflags... ${normal}"
				yay -S cpuid2cpuflags --noconfirm

			fi


			CPUID2CPUFLAGS=$(cpuid2cpuflags)
			sudo sed -i 's/CFLAGS=\"-march=x86-64/CFLAGS=\"-march=native/g' /etc/makepkg.conf
			sudo sed -i "/#-- Compiler and Linker Flags/a $CPUID2CPUFLAGS" /etc/makepkg.conf
			sudo sed -i 's/CPU_FLAGS_X86:/CPU_FLAGS_X86=\"/g' /etc/makepkg.conf
			sudo sed -i 's/^CPU_FLAGS_X86.*/&\"/' /etc/makepkg.conf

			funcion_done
			;;

		4)
			
			funcion_cabezera "Instalación de YAY o PARU"
			opcionyaourthelper=0
			read -e -p "${ORANGE} ${bold} 	==> Que instalador deseas instalar? 1 -> YAY | 2 -> PARU
	Respuesta : ${normal}" opcionyaourthelper

			case $opcionyaourthelper in 

				1)
					# Instalacion de YAY
					echo -e "${ORANGE} ${bold} ==> Instalando YAY... ${normal}"
					mkdir .yay && cd .yay
					sudo pacman -S --needed  git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
					cd ../..
					rm -r .yay
					funcion_done
					;;
				
				2)
					# Instalacion de Paru
					echo -e "${ORANGE} ${bold} ==> Instalando PARU... ${normal}"
					sudo pacman -S --needed base-devel && git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si 
					funcion_done
					;;
				*)
					echo -e "${RED} ${bold} ==> Opcion incorrecta... ${normal}"
					funcion_done
					;;
			esac
			;;

		5) 
			# Instalacion de sofware util con pacman
			funcion_cabezera "Instalando programas utiles con pacman, navegador, torrent, terminal, multimedia, etc."
			sudo pacman -S terminator mpv deluge deluge-gtk p7zip ntfs-3g gimp unrar unzip firefox-i18n-es-es btop neofetch qpwgraph lutris telegram-desktop discord gufw flatpak seahorse fastfetch btop --noconfirm
			funcion_done
			;;

		6)
			# Instalacion de software con Yaourt


			if ! command -v yay &> /dev/null
				then

					if ! command -v paru &> /dev/null
						then
							echo "Necesitas tener instalado yay o algun asistente de yaourt!"
    						#exit 1
    				else
    					funcion_cabezera "Instalacion de software con Paru..."
						paru -S brave-bin exodus onlyoffice-bin sublime-text-4 stacer-bin multibootusb yaru-icon-theme blackbox-terminal heroic-games-launcher-bin --noconfirm

					fi
			else
				funcion_cabezera "Instalacion de software con YAY..."
				yay -S brave-bin extension-manager exodus onlyoffice-bin sublime-text-4 stacer-bin multibootusb yaru-icon-theme blackbox-terminal heroic-games-launcher-bin --noconfirm

			fi
			funcion_done
			;;


		7)
			# Instalacion de zsh, oh my zsh ..

			funcion_cabezera "Instalacion de zsh oh my zsh y powerlvl10k"
			#echo -e "${RED} ${bold} ==> INSTALAR fuentes de MesloLGS y nerd fonts desde : https://www.nerdfonts.com/font-downloads \n ==> Copia las fuentes en /usr/share/fonts ${normal}"
			#wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=FILEID' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1mjuPKf8QZpS5kHEdcT3kmS2_oTGsCr4r" -O Fuentes.zip && rm -rf /tmp/cookies.txt
			curl 'https://drive.usercontent.google.com/download?id=1SA4Z8PY4B3IDuUZSLRihNoCm3utgYk4Y&export=download&confirm=t' \
    -o Fuentes.zip --output-dir /tmp 
			sudo unzip /tmp/Fuentes.zip -d /usr/share/fonts 
			sudo pacman -S zsh --noconfirm
			chsh -s $(which zsh)

			echo "# Set up the prompt" > $HOME/.zshrc
			echo " " >> $HOME/.zshrc
			echo "autoload -Uz promptinit" >> $HOME/.zshrc
			echo "promptinit" >> $HOME/.zshrc 
			echo "prompt adam1" >> $HOME/.zshrc 
			echo " " >> $HOME/.zshrc
			echo "setopt histignorealldups sharehistory" >> $HOME/.zshrc
			echo " " >> $HOME/.zshrc
			echo "# Use emacs keybindings even if our EDITOR is set to vi" >> $HOME/.zshrc
			echo "bindkey -e" >> $HOME/.zshrc
			echo " " >> $HOME/.zshrc
			echo "# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:" >> $HOME/.zshrc
			echo "HISTSIZE=1000" >> $HOME/.zshrc
			echo "SAVEHIST=1000" >> $HOME/.zshrc
			echo "HISTFILE=~/.zsh_history" >> $HOME/.zshrc
			echo " " >> $HOME/.zshrc
			echo "# Use modern completion system" >> $HOME/.zshrc
			echo "autoload -Uz compinit" >> $HOME/.zshrc
			echo "compinit" >> $HOME/.zshrc
			echo " " >> $HOME/.zshrc
			echo "zstyle ':completion:*' auto-description 'specify: %d'" >> $HOME/.zshrc
			echo "zstyle ':completion:*' completer _expand _complete _correct _approximate" >> $HOME/.zshrc
			echo "zstyle ':completion:*' format 'Completing %d'" >> $HOME/.zshrc
			echo "zstyle ':completion:*' group-name ''" >> $HOME/.zshrc
			echo "zstyle ':completion:*' menu select=2" >> $HOME/.zshrc
			echo "eval \"\$(dircolors -b)\" " >> $HOME/.zshrc
			echo "zstyle ':completion:*:default' list-colors \${(s.:.)LS_COLORS}" >> $HOME/.zshrc
			echo "zstyle ':completion:*' list-colors ''" >> $HOME/.zshrc
			echo "zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s" >> $HOME/.zshrc
			echo "zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'" >> $HOME/.zshrc
			echo "zstyle ':completion:*' menu select=long" >> $HOME/.zshrc
			echo "zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s" >> $HOME/.zshrc
			echo "zstyle ':completion:*' use-compctl false" >> $HOME/.zshrc
			echo "zstyle ':completion:*' verbose true" >> $HOME/.zshrc
			echo " " >> $HOME/.zshrc
			echo "zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'" >> $HOME/.zshrc
			echo "zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'" >> $HOME/.zshrc
			echo " " >> $HOME/.zshrc

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

			sudo pacman -S powerline-common awesome-terminal-fonts --noconfirm
			yay -S ttf-meslo-nerd-font-powerlevel10k --noconfirm
			sudo pacman -S ttf-nerd-fonts-symbols --noconfirm
			sudo pacman -S ttf-nerd-fonts-symbols-mono --noconfirm 


			sed -i 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"powerlevel10k\/powerlevel10k\"/g' $HOME/.zshrc
			funcion_cabezera "Instalando plugin zsh-autosuggestion"
			git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

			funcion_cabezera "Instalando plugin syntax-hightlighting"
			git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
			sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' $HOME/.zshrc
			
			funcion_done "Abre una terminal y configura tu nuevo ZSH!"
			;;

		8)

			# Instalacion de Neovim y NeoChad

			funcion_cabezera "Instalando Nvim - NvChad"
			sudo pacman -S neovim ripgrep clang npm --noconfirm
			git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
			sleep 3
			clear
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

		9)
	
			# Instalacion bluetooth
			funcion_cabezera "Instalacion de bluetooth"
			sudo pacman -S bluez blueman bluez-utils --noconfirm
			sudo modprobe btusb
			sudo systemctl enable bluetooth && systemctl start bluetooth
			funcion_done
			;;
		10)

			# Instalacion de fuentes
			if ! command -v yay &> /dev/null
				then

					if ! command -v paru &> /dev/null
						then
							echo " "
							echo "Necesitas tener instalado yay o algun asistente de yaourt!"
    						echo " "
    						#exit 1
    				else
    					funcion_cabezera "Instalacion de fuentes..."
						sudo pacman -S ttf-iosevka-nerd powerline-fonts ttf-font-awesome nerd-fonts ttf-meslo-nerd ttf-mononoki-nerd ttf-nerd-fonts-symbols ttf-terminus-nerd  --noconfirm
						paru -S ttf-ms-fonts ttf-meslo-nerd-font-powerlevel10k --noconfirm
						#ttf-google-fonts-git

					fi
			else
				funcion_cabezera "Instalacion de fuentes..."
				sudo pacman -S ttf-iosevka-nerd powerline-fonts ttf-font-awesome nerd-fonts ttf-meslo-nerd ttf-mononoki-nerd ttf-nerd-fonts-symbols ttf-terminus-nerd  --noconfirm
				yay -S ttf-ms-fonts ttf-meslo-nerd-font-powerlevel10k --noconfirm
				# ttf-google-fonts-git
			fi
			
			funcion_done
			;;


		11)
			# Instalacion de codecs multimedia.
			funcion_cabezera "Instalacion de codecs..."
			sudo pacman -S a52dec faac faad2 flac jasper lame libdca libdv libmad libmpeg2 libtheora libvorbis libxv wavpack x264 xvidcore gstreamer0.10-plugins --noconfirm
			funcion_done
			;;

		12)
			# Instalacion de impresora
			funcion_cabezera "Instalacion de impresora..."
			sudo pacman -S cups cups-filters avahi ghostscript gsfonts --noconfirm
			sudo systemctl enable cups && systemctl start cups
			funcion_done
			;;

		13)
			# Instalacion de extras para gnome
			funcion_cabezera "Instalacion de extras de gnome..."
			sudo pacman -S gnome-extra extension-manager deepin-gtk-theme deepin-icon-theme deepin-desktop-theme --noconfirm
			mkdir /home/$REALUSER/.icons
			curl -LOsS https://github.com/catppuccin/cursors/releases/download/v1.0.2/catppuccin-frappe-blue-cursors.zip --output-dir /tmp
			unzip /tmp/catppuccin-frappe-blue-cursors.zip -d /home/$REALUSER/.icons
			
			funcion_done
			;;

		14)
			# Instalacion de micro-code
			funcion_cabezera "Instalacion de microcodes"
			if ! command -v grub-mkconfig &> /dev/null

				then
					echo -e " "
					echo -e "${RED} ${bold} ==> Debes instalar el grub... ${normal}"
					echo -e " "
			else


				if lscpu | grep -i "Intels" &>/dev/null ; then echo " ==> Instalando microcode para Intel."
					sudo pacman -S intel-ucode --noconfirm
					sudo grub-mkconfig -o /boot/initramfs-linux.cfg
				else
					if lscpu | grep -i "AMD" &>/dev/null ; then echo "==> Instalando microcode para intel. AMD"
					sudo pacman -S amd-ucode --noconfirm
					sudo grub-mkconfig -o /boot/initramfs-linux.cfg
					else 
						echo "Problema al encontrar tu procesador!"

					fi
				fi
			fi
			funcion_done
			;;

		15)
			#Instalacion de preload (mejora de rendimiento)
			if ! command -v yay &> /dev/null  
				then
					if ! command -v paru &> /dev/null
						then
							echo " "
							echo "Necesitas tener instalado yay o algun asistente de yaourt!"
    						echo " "
    						#exit 1
    				else
    					funcion_cabezera "Instalacion de preload..."				
						paru -S preload --noconfirm
						sudo systemctl enable preload && systemctl start preload

					fi
			else
				funcion_cabezera "Instalacion de preload..."
				yay -S preload --noconfirm
				sudo systemctl enable preload && systemctl start preload
			fi
			
			funcion_done
			;;
		

		16)

			# Instalacion completa de Jellyfin

			funcion_cabezera "Instalacion de Jellyfin"

			sudo pacman -S jellyfin-server jellyfin-web --noconfirm
			#sudo touch /etc/systemd/system/jellyfin.service
			#sudo bash -c 'echo "[Unit]" > /etc/systemd/system/jellyfin.service'
			#sudo bash -c 'echo "Description=Jellyfin" >> /etc/systemd/system/jellyfin.service'
			#sudo bash -c 'echo "After=network.target" >> /etc/systemd/system/jellyfin.service'
			#sudo bash -c 'echo " " >> /etc/systemd/system/jellyfin.service'
			#sudo bash -c 'echo "[Service]" >> /etc/systemd/system/jellyfin.service'
			#sudo bash -c 'echo "Type=simple" >> /etc/systemd/system/jellyfin.service'
			#sudo bash -c 'echo "User=kirian" >> /etc/systemd/system/jellyfin.service'
			#sudo bash -c 'echo "Restart=always" >> /etc/systemd/system/jellyfin.service'
			#sudo bash -c 'echo "ExecStart=/bin/jellyfin" >> /etc/systemd/system/jellyfin.service'
			#sudo bash -c 'echo " " >> /etc/systemd/system/jellyfin.service'
			#sudo bash -c 'echo "[Install]" >> /etc/systemd/system/jellyfin.service'
			#sudo bash -c 'echo "WantedBy=multi-user.target" >> /etc/systemd/system/jellyfin.service'
			#sudo chmod 644 /etc/systemd/system/jellyfin.service
			#sudo systemctl daemon-reload
			sudo systemctl start jellyfin.service
			sudo systemctl enable jellyfin.service




			if ! command -v yay &> /dev/null  
				then
					if ! command -v paru &> /dev/null
						then
							echo " "
							echo " Necesitas tener instalado yay o algun asistente de yaourt!"
							echo " "
    				else
    					funcion_cabezera "Instalacion de Jellyfin..."				
						paru -S jellyfin-media-player --noconfirm

					fi
			else
				funcion_cabezera "Instalacion de Jellyfin..."
				yay -S jellyfin-media-player --noconfirm
			fi

			funcion_done "Configura tu cuenta y tu IP en Jellyfin"

			;;


		17)
			# Instalacion de Waydroid
			funcion_continuar "Necesitas tener instalado kernel-zen!! (kernel-zen kernel-zen-headers)"

			funcion_cabezera "Instalando Waydroid ..."
			
			read -e -p "${ORANGE} ${bold} Respuesta [1], [2], [3]...:  ${normal} " opcion_kernel

			case opcion_kernel in 
				1)

				;;
				
				2)
				exit 0
				;;


				*)
				echo -e "${RED} ${bold} ==> Opcion incorrecta... ${normal}"
				sleep 2
				clear
				;;
			esac


			#sudo pacman -S binder_linux-dkms
			sudo pacman -S waydroid lzip --noconfirm
			#sudo waydroid init 
			sudo waydroid init -s GAPPS -f 
			sudo systemctl enable --now waydroid-container
			#sudo start waydroid-container.service
			#sudo pacman -S waydroid-image-gapps
			#waydroid session start
			sudo pacman -S waydroid-script-git

			echo -e " "
			echo -e " "
			echo -e "${ORANGE} ${bold} ==> Instalar apk : waydroid app install \$path_to_apk  ${normal}"
			echo -e "${ORANGE} ${bold} ==> Listar aplicaciones : waydroid app list ${normal}"
			echo -e "${ORANGE} ${bold} ==> Correr aplicacion : waydroid app launch \$package_name ${normal}"

			funcion_continuar
			;;


		18)
			#Configuracion de noatime en fstab

			funcion_cabezera "Realizando cambios en fstab...Añadiendo Noatime"
			sudo cp -p /etc/fstab /etc/fstab.backup
			sudo sed -i 's/relatime/noatime/g' /etc/fstab
			funcion_done
			;;


		19)
			#Instalacion de entorno de desarrollo GTK 4 (gtkmm-4)

			funcion_cabezera "Instalando entorno de desarrollo GTK 4"

			if [ -d "/usr/lib/gtk-4.0" ] ; then
				sudo pacman -S gtkmm-4
			else 
				sudo pacman -S gtk4 gtkmm-4 

			fi

			funcion_done
			;;

		20)
			# Instalacion de entrono de desarrollo QT

			#sudo pacman -S qt6 qtcreator --noconfirm
			funcion_cabezera "Instalando entorno de desarrollo QT"
			flatpak install qtcreator
			funcion_done
			;;


		21) # Instalacion de plymouth


			sudo pacman -S plymouth --noconfirm
			sudo sed -i 's/HOOKS=(base udev/HOOKS=(base udev plymouth/g' /etc/mkinitcpio.conf

			# ESTOY AQUI MODIFICANDO ESTA FRASE DEL GRUB
			sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT=\x27/GRUB_CMDLINE_LINUX_DEFAULT=\x27quiet splash/g' /etc/default/grub
			sudo sed -i 's/GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX_DEFAULT="splash/g' /etc/default/grub
 
			curl 'https://drive.usercontent.google.com/download?id=1V5gLDwIlos0kcvcvvZ2KVEU0g6zeH3od&export=download&confirm=t' \
    -o Tema_playmouth_connect.tar.gz --output-dir /tmp

			;;


		22)
			funcion_cabezera "Instalacion de IA ollama"
			sudo pacman -S ollama --noconfirm
			
			terminator -e 'bash -c "ollama serve"'
			terminator -e 'bash -c "ollama run aratan/qwq"'
			funcion_continuar
			funcion_done "Usa : - ollama serve - para el servidor y - ollama run \"aratan/qwq:latest\" - para ejecutar"

			;;



		23)
			funcion_cabezera "Haciendo limpieza de paquetes huerfanos ..."
			sudo pacman -Rs $(pacman -Qtdq)
			funcion_done "Deberia hacer un reboot tras hacer instalaciones ..."
			;;


		24)
			exit 0
			;;


		*)
			echo -e "${RED} ${bold} ==> Opcion incorrecta... ${normal}"
			sleep 2
			clear
			;;
	esac

	

done










