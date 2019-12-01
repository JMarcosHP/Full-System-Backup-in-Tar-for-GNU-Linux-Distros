#!/bin/bash
##
## @Author	Jehú Marcos Herrera Puentes
## @Copyright	Copyright © Jehú Marcos Herrera Puentes
## @License	https://www.gnu.org/licenses/gpl-3.0.html
## @Github	https://github.com/JMarcosHP

##------------------------
##--	Variables	--
##------------------------
username=$(whoami)
fecha=$(date +%d-%m-%Y)
hora=$(date +%I:%M)
nombre=Backup
destino=""
##------------------------

## Comprobación de Root
if [ $username != "root" ]; then
	echo Para realizar un backup completo del sistema se requieren priviliegios de root.
	exit 0
fi 2> /dev/null

## Ruta de Destino del Backup
read -p "Introduce la ruta de destino para guardar --> " destino

echo "Se excluirán los siguientes directorios: \

/boot/EFI \

/boot/efi \

/tmp\

/proc\

/mnt\

/dev\

/sys\

/run\

/media"

read -p "Pulsa cualquier tecla para iniciar el backup de la carpeta Raíz"

tar -cvpzf $destino/$nombre'_'$username'_'$hora'_'$fecha.tar.bz2 \
--exclude=Backup* \
--exclude=.cache \
--exclude=.tmp \
--exclude=Trash \
--exclude=Cache \
--exclude=.trash \
--exclude=/root/.cache \
--exclude=.Trash-1000 \
--exclude=.Trash-1001 \
--exclude=.thumbnails \
--exclude=tmp \
--exclude=lost+found \
--exclude=/proc \
--exclude=/tmp \
--exclude=/mnt \
--exclude=/dev \
--exclude=/sys \
--exclude=/run \
--exclude=/media \
--exclude=/boot/efi \
--exclude=/boot/EFI \
--exclude=/var/log \
--exclude=/var/tmp \
--exclude=/var/cache/apt/archives \
--exclude=/home \
--exclude=/root/.local/share/Trash /

clear
echo "El backup se ha completado correctamente, recuerda recrear los siguientes directorios cuando restaures tu backup:\

/media\

/mnt\

/proc\

/dev\

/run\

/sys\

/tmp\

/boot/efi\

/boot/EFI"

read -p "Pulsa cualquier tecla para salir"
clear
exit 0
