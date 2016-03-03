############################################################################################################################
## [Title]: logs_extractor.sh 
## [Author]: Dan Poulin ( [ßµ∟∟€♱› )
##--------------------------------------------------------------------------------------------------------------------------
## [Details]: This script extracts LOGS from /var/log
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
touch . >> LOGS-${id}.txt
echo ${bigline} >> LOGS-${id}.txt

find /var/log -type f -regextype posix-extended \
-regex '/var/log/[a-zA-Z\.]+(/[a-zA-Z\.]+)*' \
-exec echo -e "---dumping logfile {} ---\n" \; \
-exec cat {} \; -exec echo -e "---end of dump for logfile {} ---\n" \;  >> LOGS-${id}.txt


echo ${date} >> LOGS-${id}.txt
echo >> LOGS-${id}.txt

mv LOGS-${id}.txt LOGS-${id}-${date}.txt
echo
echo "Results in TXT file: LOGS-${id}-${date}.txt" 
echo
echo "Complete"
echo
echo ${bigline} 
echo

done
