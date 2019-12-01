#!/bin/bash
##
## @Author	Jehú Marcos Herrera Puentes
## @Copyright	Copyright © Jehú Marcos Herrera Puentes
## @License	https://www.gnu.org/licenses/gpl-3.0.html
## @Github      https://github.com/JMarcosHP

##------------------------
##--	Variables	--
##------------------------
username=$(whoami)
fecha=$(date +%d-%m-%Y)
hora=$(date +%I:%M)
nombre=Backup
origen=""
destino=""
##------------------------

## Comprobación de Root
if [ $username != "root" ]; then
	echo Para realizar un backup completo del sistema se requieren priviliegios de root.
	exit 0
fi 2> /dev/null

read -p "Antes de iniciar, recuerda haber formateado y montado la partición de root. (Presiona cualquier tecla)"

## Rutas requeridas
read -p "Introduce la ruta dónde está el archivo Backup --> " origen
read -p "Introduce la ruta para descomprimir el archivo --> " destino

tar -xvpzf $origen -C $destino --numeric-owner
clear

echo "Se crearán los siguientes directorios: \

/boot/EFI \

/boot/efi \

/tmp \

/proc \

/mnt \

/dev \

/sys \

/run \

/media \

/var/log \

/var/tmp"

read -p "Pulsa cualquier tecla para crear los directorios"
mkdir $destino/boot/efi
mkdir $destino/tmp
mkdir $destino/proc
mkdir $destino/mnt
mkdir $destino/dev
mkdir $destino/sys
mkdir $destino/run
mkdir $destino/media
mkdir $destino/var/log
mkdir $destino/var/tmp
chmod 777 $destino/tmp
chmod 777 $destino/proc
chmod 777 $destino/mnt
chmod 777 $destino/dev
chmod 777 $destino/sys
chmod 777 $destino/run
chmod 777 $destino/media
chmod 777 $destino/var/log
chmod 777 $destino/var/tmp
clear

read -p "Se han creado los directorios correctamente"
clear
echo "A finalizado la restauración, recuerda reinstalar el bootloader para poder arrancar el sistema"
read -p "Pulsa cualquier tecla para salir"
clear
exit 0
