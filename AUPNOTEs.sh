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

touch /tmp/PS1_ROOT.txt /tmp/PS1_USER.txt && chmod +wx /tmp/PS1_*.txt
echo "PS1='${debian_chroot:+($debian_chroot)}\[\e[47m\]\[\033[01;31m\]XXX @ OOO\[\033[31m\] : \[\e[47m\]\[\033[01;31m\](\D{%d-%b-%Y - %H:%M:%S})\n\w\[\033[31m\]\ # " >>/tmp/PS1_ROOT.txt
echo "PS1='${debian_chroot:+($debian_chroot)}\[\033[0;36m\]XXX @ OOO\[\033[00m\] : \[\033[0;36m\](\D{%d-%b-%Y - %H:%M:%S})\n\w\[\033[00m\]\ $ " >>/tmp/PS1_USER.txt

#what you're using for a handle: HANDLE @ CASE
read -p "What would you like your handle to be ? " F
echo $F
echo ""
read -p "What would you like to call this case or system ? " G
echo $G
echo ""

sed -i "s/XXX/$F/" /tmp/PS1_ROOT.txt
sed -i "s/XXX/$F/" /tmp/PS1_USER.txt
sed -i "s/OOO/$G/" /tmp/PS1_ROOT.txt
sed -i "s/OOO/$G/" /tmp/PS1_USER.txt

#A=root PS1
A=$(cat /tmp/PS1_ROOT.txt)
#B=user PS1
B=$(cat /tmp/PS1_USER.txt)

if [ $id = "0" ] ; then
  Z=$(cat /root/.bashrc | grep -A1 '$color_prompt' | grep -v "if")
  ROOT=$(sed -i "s/$Z/$A/" /root/.bashrc)
  $ROOT
elif [ $id != "0" ] ; then
  X=$(cat ~/.bashrc | grep -A1 '$color_prompt' | grep -v "if")
  USER1=$(sed -i "s/$X/$B/" ~/.bashrc)
  $USER1
else
  echo "turn on system"
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
  echo ""
else
  echo " Scribe Canceled. "
  echo ""
fi
  echo ""
