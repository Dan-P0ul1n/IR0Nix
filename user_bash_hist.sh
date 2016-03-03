############################################################################################################################
## [Title]: user_bash_hist.sh 
## [Author]: Dan Poulin ( [ßµ∟∟€♱› )
##--------------------------------------------------------------------------------------------------------------------------
## [Details]: This script extracts User BASH Histories from the subject system
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
touch . >> User_BASH_Hist-${id}.txt
echo ${bigline} >> User_BASH_Hist-${id}.txt

find /home -type f -regextype posix-extended -regex \
'/home/[a-zA-Z\.]+/\.bash_history' \
-exec echo -e "---dumping history file {} ---\n" \; \
-exec cat {} \; -exec echo -e "---end of dump for history file {} ---
\n" \; >> User_BASH_Hist-${id}.txt

if [ "$?"="0" ] ;  ## checks to see that previous CMD exited with a status of "0"
then
	echo " CMD executed successfully "
else
echo " ERROR "
fi

echo ${date} >> User_BASH_Hist-${id}.txt
echo >> User_BASH_Hist-${id}.txt

mv User_BASH_Hist-${id}.txt User_BASH_Hist-${id}-${date}.txt
echo
echo "Results in TXT file: User_BASH_Hist-${id}-${date}.txt" 
echo
echo "Complete"
echo
echo ${bigline} 
echo

done
