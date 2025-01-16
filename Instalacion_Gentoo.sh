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

particion_sistema=""
particion_efi=""
particion_home=""
formato_raiz=""
formato_home=""
binarios=""
nombre_usuario=""
binarios_response=0
https="https://distfiles.gentoo.org/releases/amd64/autobuilds/20250112T170325Z/"
package="stage3-amd64-desktop-systemd-20250112T170325Z.tar.xz"


clear 

echo -e " "
echo -e " "
echo -e  "${BLUE} ${bold}		-----------------------------------------------${normal}"
echo -e  "${BLUE} ${bold}		|                                             |${normal}"
echo -e  "${BLUE} ${bold}		|     Script de Instalacion de Gentoo        ¡|${normal}"
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
	sleep 2

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
	sleep 4
	clear
}


funcion_continuar() {

	echo -e " "
	echo -e " "
	echo -e " "
	read -e -p "${ORANGE} ${bold} Pulsa cualquier tecla para continuar:  ${normal} " opcion_continuar
			case $opcion_continuar in 

				1)
					sleep 1
					;;
				*)
					sleep 1
					;;
			esac
}

funcion_cabezera "El Script debe ejecutarse como SU. -> su -"
funcion_continuar





while [[ $exit == false ]]; do

		echo -e "${ORANGE} ${bold} 1)  Instalacion de Gentoo. ${normal}${ORANGE}\xE2\x9D\x8C${normal}"

		! command -v nvidia-settings &> /dev/null; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 2)  Instalacion drivers nvidia. ${normal} ${GREEN} \xE2\x9C\x85${normal}" \
 		|| echo -e "${GREEN} ${bold} 2)  Instalacion drivers nvidia. ${normal}${RED}\xE2\x9D\x8C${normal}"


 		! command -v pipewire &> /dev/null; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 3)  Instalacion de pipewire. ${normal} ${GREEN} \xE2\x9C\x85${normal}" \
 		|| echo -e "${GREEN} ${bold} 3)  Instalacion de pipewire. ${normal}${RED}\xE2\x9D\x8C${normal}"


 		! command -v flatpak &> /dev/null; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 4)  Instalacion de programas (flatpak, compresores, codecs, discord, sublime, text, stacer.. etc). ${normal} ${GREEN} \xE2\x9C\x85${normal}" \
 		|| echo -e "${GREEN} ${bold} 4)  Instalacion de programas (flatpak, compresores, discord, sublime text.. etc). ${normal}${RED}\xE2\x9D\x8C${normal}"


 		! command -v heroic &> /dev/null; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 5)  Instalacion de plataformas de juegos (Steam, Heroic, Lutris). ${normal} ${GREEN} \xE2\x9C\x85${normal}" \
 		|| echo -e "${GREEN} ${bold} 5)  Instalacion de plataformas de juegos (Steam, Heroic, Lutris). ${normal}${RED}\xE2\x9D\x8C${normal}"

 		! command -v zsh &> /dev/null; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 6)  Instalacion de zsh y configuraciones. ${normal} ${GREEN} \xE2\x9C\x85${normal}" \
 		|| echo -e "${GREEN} ${bold} 6)  Instalacion de zsh y configuraciones. ${normal}${RED}\xE2\x9D\x8C${normal}"


 		command -v jellyfin &> /dev/null ; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 7) Instalacion de Jellyfin. (Servidor de cine en casa). ${normal} ${GREEN} \xE2\x9C\x85${normal}" \
		|| echo -e "${GREEN} ${bold} 7) Instalacion de Jellyfin. (Servidor de cine en casa)${normal} ${RED}\xE2\x9D\x8C${normal}"


		command -v ollama &> /dev/null ; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 8) Instalacion de Ollama. IA. ${normal} ${GREEN} \xE2\x9C\x85${normal}" \
	    || echo -e "${GREEN} ${bold} 8) Instalacion de Ollama. IA.${normal} ${RED}\xE2\x9D\x8C${normal}"


	    command -v ollama &> /dev/null ; [ $? -eq 0 ] && echo -e "${DARKGRAY} ${bold} 9) Instalacion de fuentes. ${normal} ${GREEN} \xE2\x9C\x85${normal}" \
	    || echo -e "${GREEN} ${bold} 9) Instalacion de fuentes.${normal} ${RED}\xE2\x9D\x8C${normal}"

 		echo -e "${GREEN} ${bold} 10) Salir. ${normal}"
	  	echo -e " "
	  	echo -e " "
	  	read -e -p "${ORANGE} ${bold} Respuesta [1], [2], [3]...:  ${normal} " opcion 


	  	case $opcion in 
			1)
				echo -e "${RED} ${bold} Usa cfdisk para particionar${normal}"
				echo -e	"${RED} ${bold} CUIDADO!, PODRIAN PRODUCIRSE PERDIDA DE DATOS! ${normal} "	
				echo -e	"${RED} ${bold} Formatear las particiones :${normal}"
				echo -e	"${RED} ${bold} mkfs.vfat -F 32 /dev/vda1 (EFI -> vfat 32  | bios -> xfs, ext4...)${normal}"
				echo -e	"${RED} ${bold} mkfs.xfs /dev/vda3 (ejemplo particion normal)${normal}"
				echo -e	"${RED} ${bold} mkswap /dev/vda5 en caso de tener swap y despues -> swapon para activarla ${normal}"

				read -e -p "${ORANGE} ${bold}==> Has echo las particiones correspondientes? sS / nN
					Respuesta : ${normal}" particiones


							case $particiones in 

								[sS])
									funcion_cabezera "Preconfiguraciones iniciales"
									read -e -p "${ORANGE} ${bold}==> Instalacion rapida(binarios precompilados) 1 | lenta (compilar todo) 2 
					Respuesta : ${normal}" binarios_response
									if [[ $binarios_response == 1 ]] 
										then
											echo -e "${ORANGE} ${bold}Compilacion rapida seleccionada.${normal}"
											binarios="g"
									else
										echo -e "${ORANGE} ${bold}Compilacion lenta seleccionada.${normal}"
										binarios="v"
									fi

									read -e -p "${ORANGE} ${bold}==> Que formato quieres para la raiz? > xfs <> ext4 <> btrfs 
					Respuesta : ${normal}" formato
									formato_raiz=$formato

									read -e -p "${ORANGE} ${bold}==> Que formato quieres para Home? > xfs <> ext4 <> btrfs 
					Respuesta : ${normal}" formato
									formato_home=$formato

									read -e -p "${ORANGE} ${bold}==> Introduce nombre de usuario : 
					Respuesta : ${normal}" usuario
									nombre_usuario=$usuario
								#echo -e "Respuesta -> emerge $binarios"
								#echo -e "Raiz -> $formato_raiz"
								#echo -e "Home -> $formato_home" 


									read -e -p "${ORANGE} ${bold}==> Particion para sistema raiz > / < (ejem sda2)
					Respuesta : ${normal}" particion_sistema
									read -e -p "${ORANGE} ${bold}==> Particion para boot EFI > /boot < (ejem sda1)
					Respuesta : ${normal}" particion_efi
									read -e -p "${ORANGE} ${bold}==> Particion para home > /home < (ejem sda3)
					Respuesta : ${normal}" particion_home

										echo -e "Particion asignada para sistema raiz / -> /dev/$particion_sistema"
										funcion_cabezera "Montando sistema y descargando archivos Stage3 + systemD"
										echo -e "mkdir -p /mnt/gentoo"
					 					echo -e "mount /dev/$particion_sistema /mnt/gentoo"
										echo -e "cd /mnt/gentoo"
										##wget "$https$package"
										##tar xpvf $package --xattrs-include='*.*' --numeric-owner
										funcion_done "Sistema montado y preparado"

									;;
								[nN])
									exit
									;;
								*)
									echo -e "${ORANGE} ${bold} ==> Opcion incorrecta... ${normal}"
									;;
							esac


				funcion_cabezera "Modificando make.conf para compilaciones y mejorando portage"

				echo "COMMON_FLAGS=\"-march=native -02 -pipe\"" >> ejemplo.txt
				echo "CPU_FLAGS_X86=\"aes avx avx2 f16c fma3 mmx mmxext pclmul popcnt rdrand sha sse sse2 sse3 sse4_1 sse4_2 sse4a ssse3 vpclmulqdq\"" >> ejemplo.txt
				echo "USE=\"extra nvidia vdpau vaapi opengl jpeg gif tiff png svg flac mp3 ogg webp xvid x264 dist-kernel vulkan dbus echo-cancel X cups gnome gstreamer gtk systemd gdm modemmanager ffmpeg gsettings ieee1394 sound-server crash-handler display-manager wayland jack jack-client alsa system-service accessibility\"" >> ejemplo.txt
				echo "MAKEOPTS=\"-j$NPROC -l$NPROC\"" >> ejemplo.txt
				echo "FEATURES=\"parallel-install parallel-fetch candy -ebuild-locks -merge-wait\"" >> ejemplo.txt
				echo "ACCEPT_LICENSE='*'" >> ejemplo.txt
				echo "EMERGE_DEFAULT_OPTS=\"--jobs=12 --load-average=12 --keep-going --verbose --quiet-build --with-bdeps=y --complete-graph=y --deep --ask\"" >> ejemplo.txt

				echo "VIDEO_CARDS=\"nvidia\"" >> ejemplo.txt
				echo "ACCEPT_KEYWORDS=\"~amd64\"" >> ejemplo.txt
				echo "RUBY_TARGETS=\"ruby32\"" >> ejemplo.txt
				echo "RUBY_SINGLE_TARGET=\"ruby32\"" >> ejemplo.txt
				echo "PYTHON_TARGETS=\"python3_12\"" >> ejemplo.txt
				echo "PYTHON_SINGLE_TARGET=\"python3_12\"" >> ejemplo.txt
				#echo "LUA_TARGETS=\"lua5-4\"" >> ejemplo.txt
				#echo "LUA_SINGLE_TARGET=\"lua5-4\"" >> ejemplo.txt

				funcion_done "Modificaciones en make.conf terminadas!"

				##cp --dereference /etc/resolv.conf /mnt/gentoo/etc/

				##arch-chroot /mnt/gentoo
				##mkdir /efi
				##mount /dev/$particion_efi /efi
				##mount /dev/$particion_home /home
				##emerge-webrsync
				##emerge --sync
				##getuto 


				funcion_cabezera "Seleccionando mirrors mas rapidas, puede tardar un rato!"
				emerge -$binarios app-portage/mirrorselect
				mirrorselect -s3 -b10 -D
				funcion_done "Para seleccionar los mirrors manualmente usa > mirrorselect -i <"


				funcion_cabezera "Actualizando el sistema..."
				emerge -uNDaq$binarios @world
				funcion_done "Sistema actualizado!"


				funcion_cabezera "Configurando idioma y cambiando a chroot"
				mkdir /etc/portage/package.use
				echo "sys-libs/ncurses -gpm" > /etc/portage/package.use/ncurses
				ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime	
				echo "es_ES.UTF-8 UTF-8" >> /etc/locale.gen
				locale-gen
				#eselect locale list (para seleccionar una de las anteriores)
				eselect locale set 4
				env-update && source /etc/profile && export PS1="(chroot) ${PS1}"
				funcion_done "Configuracion terminada!"


				funcion_cabezera "Instalacion del kernel y firmware"
				emerge -$binarios sof-firmware linux-firmware
				echo "sys-kernel/installkernel dracut grub" >> /etc/portage/package.use/installkernel
				emerge -$binarios sys-kernel/linux-firmware
				funcion_done "Kernel y firmware instalados!"


				funcion_cabezera "Agregando las particiones a fstab"
				echo "/dev/$particion_efi /efi vfat umask=0077 0 2" >> /etc/fstab
				#/dev/sda2 none swap sw 0 0 (en caso de tener swap)
				echo "/dev/$particion_sistema / $formato_raiz defaults,noatime 0 1" >> /etc/fstab
				echo "/dev/$particion_home /home $formato_home defaults,noatime 0 2" >> /etc/fstab
				echo "tmpfs  /var/tmp/portage  tmpfs size=16G,uid=portage,gid=portage,mode=775  0 0" >> /etc/fstab
				mount /var/tmp/portage
				funcion_done "Particiones agregadas"


				funcion_cabezera "Dhcpcd, password root e instalacion de grub"
				echo "gentoo" >> /etc/hostname
				emerge -$binarios net-misc/dhcpcd
				systemctl enable dhcpcd
				passwd
				systemd-machine-id-setup
				#systemd-firstboot --prompt (puede dar errores al estar en chroot)
				grub-install --efi-directory=/efi
				grub-mkconfig -o /boot/grub/grub.cfg
				funcion_done "Grub instalado!"



				funcion_cabezera "Instalaciones varias, vmtools"
				echo "KEYMAP=es" >> /etc/console.conf
				loadkeys es
				env-update && source /etc/profile
				#- sudo emerge -gq pciutils pipewire wireplumber lvm2 plymouth networkmanager
				sudo emerge -$binarios pciutils lvm2 networkmanager jack2
				useradd -m -G users,wheel,video,usb,input,portage $nombre_usuario
				passwd $nombre_usuario
				emerge -$binarios sudo
				sed -i "/root ALL=(ALL:ALL) ALL/a$nombre_usuario ALL=(ALL:ALL) ALL" "/etc/sudoers"
				sed -i "s/#%wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/g" "/etc/sudoers"
				echo "Defaults env_reset,pwfeedback" >> /etc/sudoers
				etc-update --automode -5
				emerge -$binarios open-vm-tools
				etc-update --automode -5
				emerge -$binarios open-vm-tools
				systemctl enable vmtoolsd.service
				emerge -$binarios xf86-video-vmware
				funcion_done "Varios y vmtools instalados"


				funcion_cabezera "Instalacion de GNOME"
				eselect profile set 26
				emerge --sync
				emerge -$binarios @world
				emerge -$binarios gnome-base/gnome gdm @world
				usermod -G gdm kirian
				env-update && source /etc/profile
				systemctl enable gdm.service

				bash -c "exit"
				cd
				umount -l /mnt/gentoo/dev{/shm,/pts,}
				umount -R /mnt/gentoo

				funcion_done "Instalacion terminada. El sistema se reiniciar ahora"
				sleep 5

				reboot
			;;
			2)
				funcion_cabezera "Instalacion de drivers nvidia"
				echo "x11-drivers/nvidia-drivers X dist-kernel tools powerd persistenced static-libs modules" > /etc/portage/package.use/nvidia-drivers
				echo "*/* VIDEO_CARDS: -* nvidia" > /etc/portage/package.use/00video
				emerge -$binarios x11-drivers/nvidia-drivers
				mkdir /etc/dracut.conf.d
				echo "omit_drivers+=nouveau" > /etc/dracut.conf.d/nouveau.conf
				emerge -$binarios @module-rebuild
				emerge -v sys-kernel/gentoo-sources
				emerge -v dev-util/vulkan-tools
				if [[ $binarios == "-g"  ]] then
					emerge --config sys-kernel/gentoo-kernel-bin
				else 
					emerge --config sys-kernel/gentoo-kernel
				fi
				funcion_done "Reiniciando en 5 segundos!"
				sleep 4
				reboot

				;;

			3)
				funcion_cabezera "Instalacion pipewire"

				echo "media-video/pipewire X dbus echo-cancel extra ffmpeg flatpak gsettings gstreamer ieee1394 jack-client liblc3 lv2 modemmanager pipewire-alsa readline roc sound-server ssl systemd system-service v4l zeroconf" > /etc/portage/package.use/pipewire
				emerge -$binarios @world
				emerge --ask media-video/pipewire wireplumber
				systemctl --user --force enable wireplumber.service
				usermod -aG pipewire $nombre_usuario
				emerge -$binarios sys-auth/rtkit
				usermod -rG audio $nombre_usuario
				mkdir /etc/pipewire
				cp /usr/share/pipewire/pipewire.conf /etc/pipewire/pipewire.conf
				systemctl --user enable --now pipewire.service
				systemctl --user enable --now pipewire-pulse.socket wireplumber.service
				funcion_done "DESPUES DE REINICIAR EJECUTAR -> "systemctl --user enable --now pipewire-pulse
				sleep 5
				reboot
				;;

			4)
				funcion_cabezera "Instalacion de programas (flatpak, compresores, codecs, discord, sublime text, gimp... etc)"
				emerge -$binarios sys-apps/flatpak 
				echo "matrosca x265 lua" > /etc/portage/package.use/vlc
				emerge -$binarios media-video/vlc
				echo "bzip2 crypt natspec unicode" > /etc/portage/package.use/zip
				emerge -$binarios app-arch/zip
				echo "rar natspec" > /etc/portage/package.use/p7zip
				echo "rar natspec" > /etc/portage/package.use/pzip
				emerge -$binarios app-arch/p7zip
				emerge -$binarios app-arch/pzip
				emerge -$binarios pp-arch/xarchiver
				emerge -$binarios media-gfx/gimp
				emerge -$binarios net-im/discord
				emerge -$binarios app-editors/sublime-text



				;;
			
			5)	
				funcion_cabezera "Instalacion de plataformas de juegos"
					
				;;
			
			6)
				funcion_cabezera "Instalacion de zsh y configuraciones"

				;;
			
			7) 
				funcion_cabezera "Instalacion de Jellyfin"
				;;
			
			8)
				funcion_cabezera "Instalacion de ollama IA"

				;;
			
			9)
				funcion_cabezera "Instalacion de fuentes"
				;;

			10)
				exit 0
				;;


			*)
				echo -e "${RED} ${bold} ==> Opcion incorrecta... ${normal}"
				sleep 2
				clear
				;;
	

			esac

		done