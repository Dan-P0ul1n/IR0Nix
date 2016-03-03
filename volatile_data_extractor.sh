############################################################################################################################
## [Title]: volatile_data_extract.sh 
## [Author]: Dan Poulin ( [ßµ∟∟€♱› )
##--------------------------------------------------------------------------------------------------------------------------
## [Details]: This script extracts volatile data from the subject system
##--------------------------------------------------------------------------------------------------------------------------
## [Modification, Distribution, and Attribution]:
## You are free to modify and/or distribute this script as you wish.
############################################################################################################################

#!/bin/bash

bigline="================================================================================================================="
smlline="-----------------------------------------------------------------------------------------------------------------"
host=$(hostname)
date=$(date +%d-%b-%Y\-%H\:%M\:%S)
if [ -e \/etc\/machine-id ] ; 
then 
	id=$(cat \/etc\/machine-id)
elif [ -e \/var\/lib\/dbus\/machine-id ] ;
then 
	id=$(cat \/var\/lib\/dbus\/machine-id)
else 
	echo "This system has no Unique Machine-ID"
fi
echo ${bigline}
touch . >> VolData-${id}.txt
echo ${bigline} >> VolData-${id}.txt
echo " *Nix Volatile Data Extractor " >> VolData-${id}.txt
echo >> VolData-${host}.txt
echo " Machine ID: `cat /etc/machine-id` " >> VolData-${id}.txt
echo ${bigline} >> VolData-${id}.txt
echo >> VolData-${id}.txt
echo ${date} >> VolData-${id}.txt
echo >> VolData-${id}.txt
echo ${smlline} >> VolData-${id}.txt
echo "Collecting Conversation Data 'netstat -anp && netstat -rn'"
echo "Output 'netstat -anp'" >> VolData-${id}.txt
echo ${smlline} >> VolData-${id}.txt
netstat -anp >> VolData-${id}.txt
echo ${smlline} >> VolData-${id}.txt
echo "Collecting Data about Files Open by Processes 'lsof'"
echo "Output 'lsof'" >> VolData-${id}.txt
echo ${smlline} >> VolData-${id}.txt
lsof -V >> VolData-${id}.txt
echo ${smlline} >> VolData-${id}.txt
echo "Collecting Data about every Process on System 'ps -ef'"
echo "Output 'ps -ef'" >> VolData-${id}.txt
echo ${smlline} >> VolData-${id}.txt
ps -ef >> VolData-${id}.txt
echo ${smlline} >> VolData-${id}.txt
echo "Output 'netstat -rn'" >> VolData-${id}.txt
echo ${smlline} >> VolData-${id}.txt
netstat -rn >> VolData-${id}.txt
echo ${smlline} >> VolData-${id}.txt
echo "Collecting Disk Space Data on System 'df'"
echo "Output 'df'" >> VolData-${id}.txt
echo ${smlline} >> VolData-${id}.txt
df >> VolData-${id}.txt
echo ${smlline} >> VolData-${id}.txt
echo "Collecting Data about Attached File Systems 'mount'"
echo "Output 'mount'" >> VolData-${id}.txt
echo ${smlline} >> VolData-${id}.txt
mount >> VolData-${id}.txt
echo ${smlline} >> VolData-${id}.txt
echo "Collecting Data about Linux Kernel Modules 'lsmod'"
echo "Output 'lsmod'" >> VolData-${id}.txt
echo ${smlline} >> VolData-${id}.txt
lsmod >> VolData-${id}.txt
echo ${smlline} >> VolData-${id}.txt
echo "Collecting Data about who is currently logged onto system 'w'"
echo "Output 'w'" >> VolData-${id}.txt
echo ${smlline} >> VolData-${id}.txt
w >> VolData-${id}.txt
echo ${smlline} >> VolData-${id}.txt
echo "Collecting Data User(s) Logged in at file MAC times in /var/log/wtmp 'last'"
echo "Output 'last'" >> VolData-${id}.txt
last >> VolData-${id}.txt
echo ${smlline} >> VolData-${id}.txt
echo "Collecting Data User(s) Logged in at file MAC times in /var/log/wtmp 'lastb'"
echo "Output 'lastb'" >> VolData-${id}.txt
echo ${smlline} >> VolData-${id}.txt
lastb >> VolData-${id}.txt
echo ${smlline} >> VolData-${id}.txt
echo "CATing '/etc/passwd' on subject system"
echo "Output 'cat /etc/passwd'" >> VolData-${id}.txt
cat /etc/passwd >> VolData-${id}.txt
echo ${smlline} >> VolData-${id}.txt
echo "CATing '/etc/shadow' on subject system"
echo "Output 'cat /etc/shadow'" >> VolData-${id}.txt
echo ${smlline} >> VolData-${id}.txt
cat /etc/shadow >> VolData-${id}.txt
echo ${smlline} >> VolData-${id}.txt
echo "CATing '/etc/group' on subject system"
echo "Output 'cat /etc/group'" >> VolData-${id}.txt
echo ${smlline} >> VolData-${id}.txt
cat /etc/group >> VolData-${id}.txt
echo ${smlline} >> VolData-${idt}.txt
echo >> VolData-${id}.txt

echo ${date} >> VolData-${id}.txt
echo >> VolData-${id}.txt

mv VolData-${id}.txt VolData-${id}-${date}.txt
echo
echo "Results in TXT file: VolData-${id}-${date}.txt" 
echo
echo "Complete"
echo
echo ${bigline} 
echo

