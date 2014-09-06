#!/bin/bash
aptitude install -y git xvfb openbox x11vnc
mkdir -p $HOME/repos/github
mkdir -p $HOME/Ejecutables
cd $HOME/repos/github
git clone git://github.com/Aulla/eneboo-guaca.git
git clone git://github.com/kanaka/noVNC
cd $HOME/Ejecutables
#wget http://eneboo.org/pub/contrib/2.4.2.4/eneboo-2.4.2.4-dba-linux64.tar.bz2
#wget http://eneboo.org/pub/contrib/2.4.2.4/eneboo-2.4.2.4-dba-linux32.tar.bz2
#wget http://eneboo.org/pub/contrib/2.4.2.4/eneboo-2.4.2.4-quick-linux32.tar.bz2
wget http://eneboo.org/pub/contrib/2.4.2.4/eneboo-2.4.2.4-quick-linux64.tar.bz2
tar xvjf eneboo-2.4.2.4-quick-linux64.tar.bz2 eneboo-2.4.2.4-quick
mv eneboo-2.4.2.4-quick ../Eneboo
