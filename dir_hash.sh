############################################################################################################################
## [Title]: dir_hash.sh 
## [Author]: Dan Poulin ( [ßµ∟∟€♱› )
##--------------------------------------------------------------------------------------------------------------------------
## [Details]: This script Hashes binaries in /dir/ from the subject system
##--------------------------------------------------------------------------------------------------------------------------
## [Modification, Distribution, and Attribution]:
## You are free to modify and/or distribute this script as you wish.
############################################################################################################################

#!/bin/bash

bigline="================================================================================================================="
smlline="-----------------------------------------------------------------------------------------------------------------"
host=$(hostname)
date=$(date +%d-%b-%Y\-%H\:%M\:%S)
read -p " Enter target Directory to hash .. ie  /bin :  " DIR

if [ -e /etc/machine-id ] ; 
then 
	id=$(cat \/etc\/machine-id)
elif [ -e /var/lib/dbus/machine-id ] ;
then 
	id=$(cat /var/lib/dbus/machine-id)
else 
	echo "This system has no Unique Machine-ID"
fi
echo ${bigline}
touch . >> dir_hashes-${id}.txt
echo ${bigline} >> dir_hashes-${id}.txt

find $DIR -xdev -type f -exec sha1sum -b {} \; >> dir_hashes-${id}.txt
sed 's/*//' -i dir_hashes-${id}.txt
echo ${date} >> dir_hashes-${id}.txt
echo >> dir_hashes-${id}.txt

mv dir_hashes-${id}.txt dir_hashes-${id}-${date}.txt
echo
echo "Results in TXT file: dir_hashes-${id}-${date}.txt" 
echo
echo "Complete"
echo
echo ${bigline} 
echo

