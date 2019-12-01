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

read -p "Antes de iniciar, recuerda haber formateado y montado la partición de home, si es que la tienes. (Presiona cualquier tecla)"

## Rutas requeridas
read -p "Introduce la ruta donde está el archivo Backup --> " origen
read -p "Introduce la ruta para descomprimir el archivo --> " destino

tar -xvpzf $origen -C $destino --numeric-owner
clear

echo "A finalizado la restauración de home correctamente"
read -p "Pulsa cualquier tecla para salir"
clear
exit 0
