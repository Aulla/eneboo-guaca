#!/bin/bash
xterm -hold -e
x11vnc -display :30 -many -speeds 50,500,15 -nowf -shared
