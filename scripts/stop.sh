#!/bin/bash
usage() {
    if [ "$*" ]; then
        echo "$*"
        echo
    fi
    echo
    echo "Usage: ${NAME} [--id VNC_PORT]"
    echo
    echo "	Ex: ${NAME} --id 5900 "
    echo
    echo
    echo "Stop the Xvfb, noVNC, x11vnc, openbox and eneboo"
    echo 
    echo "    --id VNC_PORT    Id of script. Same as VNC port"
    echo "                          	Default: 5900"
    exit 2
}

#Variables
NAME="$(basename $0)"
ID="5900"

# Arguments that only apply to chrooter itself
while [ "$*" ]; do
    param=$1; shift; OPTARG=$1
    case $param in
    --id)  ID="${OPTARG}"; shift            ;;
    -h|--help) usage                              ;;
    -*) usage "Unknown chrooter option: ${param}" ;;
    *) break                                      ;;
    esac
done

kill `cat start.sh_${ID}.pid`
rm  "start.sh_${ID}.pid"
exit 0