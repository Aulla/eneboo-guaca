#!/bin/bash
xterm -hold -e
Xvfb :30 -screen 0 1024x768x24 -pixdepths 1,4,8,12,16,24,32 -shmem &
DISPLAY=:30
openbox &
eneboorun &