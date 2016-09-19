############################################################################################################################
## [Title]: root_bash_hist.sh 
## [Author]: Dan Poulin ( [ßµ∟∟€♱› )
##--------------------------------------------------------------------------------------------------------------------------
## [Details]: This script extracts Root BASH Histories from the subject system
##--------------------------------------------------------------------------------------------------------------------------
## [Modification, Distribution, and Attribution]:
## You are free to modify and/or distribute this script as you wish.
############################################################################################################################

#!/bin/bash

bigline="================================================================================================================="
smlline="-----------------------------------------------------------------------------------------------------------------"
host=$(hostname)
date=$(date +%d-%b-%Y\-%H\:%M\:%S)
if [ -e /etc/machine-id ] ; 
then 
	id=$(cat /etc/machine-id)
elif [ -e /var/lib/dbus/machine-id ] ;
then 
	id=$(cat /var/lib/dbus/machine-id)
else 
	echo "This system has no Unique Machine-ID"
fi
echo ${bigline}
touch . >> Root_BASH_Hist-${id}.txt
echo ${bigline} >> Root_BASH_Hist-${id}.txt

find /root -type f -maxdepth 1 -regextype posix-extended \
-regex '/root/\.bash_history' \
-exec echo -e "---dumping history file {} ---\n" \; \
-exec cat {} \; -exec echo -e "---end of dump for history file {} ---
\n" \; >> Root_BASH_Hist-${id}.txt

if [ "$?"="0" ] ;  ## checks to see that previous CMD exited with a status of "0"
then
	echo " CMD executed successfully "
else
echo " ERROR "
fi

echo ${date} >> Root_BASH_Hist-${id}.txt
echo >> Root_BASH_Hist-${id}.txt

mv Root_BASH_Hist-${id}.txt Root_BASH_Hist-${id}-${date}.txt
echo
echo "Results in TXT file: Root_BASH_Hist-${id}-${date}.txt" 
echo
echo "Complete"
echo
echo ${bigline} 
echo

done
