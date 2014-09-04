#!/bin/bash
while [ 1 ]
do
	if [[ ! `pidof -s eneboo` ]]; then
    		#invoke-rc.d eneboo start
    		eneboo &
	fi
	sleep 10
done