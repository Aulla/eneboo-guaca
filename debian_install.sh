#!/bin/bash
aptitude install -y git xvfb openbox x11vnc
mkdir -p $HOME/repos/github
mkdir -p $HOME/Ejecutables
cd $HOME/repos/github
git clone git://github.com/eneboo/eneboo-guaca.git
git clone git://github.com/eneboo/noVNC
mkdir -p $HOME/repos/github/noVNC/common
cd $HOME/Ejecutables
# Descargamos la última versióna dia de hoy.
wget http://eneboo.org/pub/contrib/2.4.5.1-rc6/eneboo-build-2.4.5.1-rc6-linux64-dba.tar.bz2
tar xvjf eneboo-build-2.4.5.1-rc6-linux64-dba.tar.bz2
