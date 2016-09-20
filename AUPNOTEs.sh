#!/bin/bash
#IDs current logged on UID and assigns it to 'id'
id=$(id | cut -d'=' -f2 | cut -d'(' -f1)
#A=root PS1
A=${PS1='${debian_chroot:+($debian_chroot)}\[\e[47m\]\[\033[01;31m\]$HANDLE\[\033[31m\] : \[\e[47m\]\[\033[01;31m\](\D{%d-%b-%Y - %H:%M:%S})\n\w\[\033[31m\]\ # '}
#B=user PS1
B=${PS1='${debian_chroot:+($debian_chroot)}\[\033[0;36m\]$HANDLE\[\033[00m\] : \[\033[0;36m\](\D{%d-%b-%Y - %H:%M:%S})\n\w\[\033[00m\]\ $ '}
C=$(read -p "What would you like your handle to be ?" HANDLE)
D=$(read -p "What would you like to call this box ?" BOX)



ROOT=$(sed $Z )
USER=$(sed $X )

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
fi

