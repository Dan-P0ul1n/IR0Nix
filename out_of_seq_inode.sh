############################################################################################################################
## [Title]: inode_oos.sh 
## [Author]: Dan Poulin ( [ßµ∟∟€♱› )
##--------------------------------------------------------------------------------------------------------------------------
## [Details]: This script IDs out-of-seq inodes in /dir/ from the subject system
##--------------------------------------------------------------------------------------------------------------------------
## [Modification, Distribution, and Attribution]:
## You are free to modify and/or distribute this script as you wish.
############################################################################################################################

#!/bin/bash

usage () {
  echo "usage: $0 <dir>"
  echo "Simple script to list a directory and print a warning if"
  echo "the inodes are out of sequence as will happen if system"
  echo "binaries are overwritten / time-stomped."
  exit 1
}
if [ $# -lt 1 ] ; then
	usage
fi
$1=DIR
#read -p " Enter Directory containing Binaries suspected of 'Out-Of_Sequence Inodes/Time-Stomping' " DIR
#output a listing sorted by inode number to a temp file:
touch /tmp/temp-ls.txt && chmod 777 /tmp/temp-ls.txt
templs='/tmp/temp-ls.txt'
ls -ali $DIR | sort -n > $templs

# this is for discarding first couple lines in output
foundfirstinode=false
declare -i startinode

while read line;
do
#usually a couple lines of garbage at start of output; this supresses it
	if ["$foundfirstinode" = false] && [ '\echo $line | wc -w\' -gt 6 ] ;	then
		startinode=`expr $(echo $line | awk '{print $1}')`
		echo "Start inode = $startinode"
		foundfirstinode=true
	fi
	q=$(echo $line | awk '{print $1}')
	if [[ $q =~ ^[0-9]+$ ]] && [ "$startinode" -lt $q ] ;	then
		
		if [ $((startinode + 2)) -lt $q ]; then
			echo -e "\e[31m****Out of Sequence inode detected**** expect $startinode got $q\e[0m"
		else
			echo -e "\e[33m****Out of Sequence inode detected**** expect $startinode got $q\e[0m"
		fi
			startinode=`expr $(echo $line | awk '{print $1}')`
			fi
			echo "$line"
			startinode=$((startinode+1))
done < $templs
rm $templs



