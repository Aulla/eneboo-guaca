#!/bin/bash
usage() {
    if [ "$*" ]; then
        echo "$*"
        echo
    fi
    echo
    echo "Usage: ${NAME} [--novnc NOVNC_PORT] [--vnc VNC_PORT] [--display DISPLAY]"
    echo
    echo "	Ex: ${NAME} --novnc 6080 --vnc 5900 --display :30"
    echo
    echo
    echo "Starts the Xvfb, noVNC, x11vnc, openbox and eneboo"
    echo 
    echo "    --novnc NOVNC_PORT    Port for proxy/webserver to listen on"
    echo "                          	Default: 6080"
    echo "    --vnc VNC_PORT   	  VNC server port proxy target"
    echo "                          	Default: 5900"
    echo "    --display DISPLAY     Number of display"
    echo "                          	Default: :30"
    exit 2
}

#Variables
NAME="$(basename $0)"
NOVNC_PORT="6080"
VNC_PORT="5900"
DISPLAY=":30"

#Ruta al binario eneboo
ENEBOORUN="$HOME/Eneboo/bin/eneboo"
#Ruta al fichero de configuración openbox. Es útil para eliminar acciones del escritorio 
OPENBOXCFG="$HOME/repos/github/eneboo-guaca/openbox/rc.xml"
#Ruta a noVNC
NOVNC="$HOME/repos/github/noVNC"


# Arguments that only apply to chrooter itself
while [ "$*" ]; do
    param=$1; shift; OPTARG=$1
    case $param in
    --novnc)  NOVNC_PORT="${OPTARG}"; shift            ;;
    --vnc)    VNC_PORT="${OPTARG}"; shift        ;;
    --display) DISPLAY="${OPTARG}"; shift            ;;
    -h|--help) usage                              ;;
    -*) usage "Unknown chrooter option: ${param}" ;;
    *) break                                      ;;
    esac
done

echo $$ > ${NAME}_${VNC_PORT}.pid

#EXEC
Xvfb ${DISPLAY} -screen 0 1280x1024x24 -pixdepths 1,4,8,12,16,24,32 -shmem &
echo $! >> ${NAME}_${VNC_PORT}.pid

DISPLAY=${DISPLAY} $NOVNC/utils/launch.sh --vnc 127.0.0.1:${VNC_PORT} --listen ${NOVNC_PORT} &
echo $! >> ${NAME}_${VNC_PORT}.pid

x11vnc -display ${DISPLAY} -many -speeds 50,500,15 -nowf -shared -rfbport ${VNC_PORT} &
echo $! >> ${NAME}_${VNC_PORT}.pid

DISPLAY=${DISPLAY} openbox --config-file $OPENBOXCFG &
echo $! >> ${NAME}_${VNC_PORT}.pid

x=1 &
while [ x==1 ]
	do
DISPLAY=${DISPLAY} $ENEBOORUN 
	done