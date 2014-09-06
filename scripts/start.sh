#!/bin/bash
DISPLAY=:30
#Rtua al binario eneboo
ENEBOORUN="$HOME/Eneboo/bin/eneboo"
#Ruta al fichero de configuración openbox. Es útil para eliminar acciones del escritorio 
OPENBOXCFG="$HOME/repos/github/eneboo-guaca/openbox/rc.xml"
#Rtua a noVNC
NOVNC="$HOME/repos/github/noVNC"


NOPORT=6080
PORT=5900

Xvfb $DISPLAY -screen 0 1280x1024x24 -pixdepths 1,4,8,12,16,24,32 -shmem &
DISPLAY=$DISPLAY $NOVNC/utils/launch.sh --vnc 127.0.0.1:$PORT --listen $NOPORT &
x11vnc -display $DISPLAY -many -speeds 50,500,15 -nowf -shared -rfbport $PORT &

DISPLAY=$DISPLAY openbox --config-file $OPENBOXCFG &
#$NOVNC/launch.sh --vnc 127.0.0.1:5900 &
x=1 &
while [ x==1 ]
	do
DISPLAY=$DISPLAY $ENEBOORUN

	done
