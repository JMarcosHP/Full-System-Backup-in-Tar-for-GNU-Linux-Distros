#!/bin/bash
##
## @Author	Jehú Marcos Herrera Puentes
## @Copyright	Copyright © Jehú Marcos Herrera Puentes
## @License	https://www.gnu.org/licenses/gpl-3.0.html

##------------------------
##--	Variables	--
##------------------------
username=$(whoami)
fecha=$(date +%d-%m-%Y)
hora=$(date +%I:%M)
nombre=Backup-Home
destino=""
##------------------------

## Comprobación de Root
if [ $username != "root" ]; then
	echo Para realizar este backup se requieren priviliegios de root.
	exit 0
fi 2> /dev/null

## Papelera
read -p "Revisa primero tu papelera antes de iniciar ya que no se guardará (Presiona cualquier tecla)"

## Ruta de Destino del Backup
read -p "Introduce la ruta de destino para guardar --> " destino

read -p "Pulsa cualquier tecla para iniciar el backup de la carpeta Home"

## Inicio del Backup
tar -cvpzf $destino/$nombre'_'$hora'_'$fecha.tar.bz2 \
--exclude=Backup* \
--exclude=.cache \
--exclude=.tmp \
--exclude=Trash \
--exclude=Cache \
--exclude=cache \
--exclude=trash \
--exclude=.trash \
--exclude=.Trash-1000 \
--exclude=.Trash-1001 \
--exclude=.thumbnails \
--exclude=tmp \
--exclude=lost+found \
--exclude=/home/*/.gvfs \
--exclude=/home/*/.cache \
--exclude=/home/*/.local/share/Trash /home

clear
echo "El backup se ha completado correctamente, recuerda montar tu partición de Home para restaurarla si es que la tienes, o simplemente descomprime el archivo en la carpeta raíz con: ~# tar -xvpzf /RUTA/Backup.tar.bz2 -C /punto de montaje/ --xattrs-include='*.*' --numeric-owner"

read -p "Pulsa cualquier tecla para salir"
clear
exit 0
