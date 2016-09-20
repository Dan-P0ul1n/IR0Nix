############################################################################################################################
## [Title]: AUPNOTEs.sh (~ AUtomated oPNOTEs)
## [Author]: Dan Poulin ( [ßµ∟∟€♱› )
##--------------------------------------------------------------------------------------------------------------------------
## [Details]: This script adjusts your PS1 profile for forensic OPNOTES functionality
##--------------------------------------------------------------------------------------------------------------------------
## [Modification, Distribution, and Attribution]:
## You are free to modify and/or distribute this script as you wish.
############################################################################################################################

#!/bin/bash

usage () {
  echo "usage: $0 "
  echo "Script to setup PS1 profile for Forensic/IR functionality"
  exit 1
}
if [ $0 = !true ] ; then
	usage
fi
#IDs current logged on UID and assigns it to 'id'
id=$(id | cut -d'=' -f2 | cut -d'(' -f1)
#A=root PS1
A=${PS1='${debian_chroot:+($debian_chroot)}\[\e[47m\]\[\033[01;31m\]$HANDLE @ $BOX\[\033[31m\] : \[\e[47m\]\[\033[01;31m\](\D{%d-%b-%Y - %H:%M:%S})\n\w\[\033[31m\]\ # '}
#B=user PS1
B=${PS1='${debian_chroot:+($debian_chroot)}\[\033[0;36m\]$HANDLE @ $BOX\[\033[00m\] : \[\033[0;36m\](\D{%d-%b-%Y - %H:%M:%S})\n\w\[\033[00m\]\ $ '}

#what you're using for a handle: HANDLE @ BOX
C=$(read -p "What would you like your handle to be ?" HANDLE)
D=$(read -p "What would you like to call this box ?" BOX)

ROOT=$(sed -i -e 's/$Z/$A/g' /root/.bashrc)
USER=$(sed -i -e 's/$X/$B/g' ~/.bashrc)

if [ $id = 0 ] ; then
  $C
  $D
  $ROOT
  Z=$(cat /root/.bashrc | grep -A1 '$color_prompt' | grep -v if)
elif [ $id = !0 ] ; then
  $C
  $D
  $USER
  X=$(cat ~/.bashrc | grep -A1 '$color_prompt' | grep -v if)
else
  exit
fi
date=$(date +%d-%b-%Y\-%H\:%M\:%S)
S=$(script -a /tmp/OPNOTES-${date}.txt)
read -p "Would you like to commence OPNOTES now ?   y/n ? " T
echo $T
if [ $T = y ] ; then
  touch /tmp/OPNOTES-${date}.txt && chmod +wr /tmp/OPNOTES-${date}.txt
  $S
  echo ""
  echo " OPNOTES being scribed to the following location:  /tmp/OPNOTES-${date}.txt"
  echo ""
  echo " CTRL + D to cancel scribe. "
else
  echo " Scribe Canceled. "
  echo ""
fi
  echo ""
