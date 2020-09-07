#!/bin/bash


mkdir -p $HOME/.config/sshbuddy/keys
if [[ ! -e $HOME/.config/sshbuddy/data ]]; then
    mkdir -p $HOME/.config/sshbuddy/keys
    touch $HOME/.config/sshbuddy/data
fi
DATAFILE="$HOME/.config/sshbuddy/data"
KEYDIR="$HOME/.config/sshbuddy/keys"
while :; do
	case $1 in
		--add|-a)
			NAME=$2
			ADDRESS=$3
			KEY=$4
			cp $KEY $KEYDIR
			KEYNAME=$(basename $KEY)
			echo "$NAME,$ADDRESS,$KEYNAME" >> $HOME/.config/sshbuddy/data
			break
			;;

		--link|-l)
			ADDRESS=$(sed -n "/${2}/p" ${DATAFILE} | awk -F',' '{print $2}')
			KEY=$(sed -n "/${2}/p" ${DATAFILE} | awk -F',' '{print $3}')
			echo "THIS IS ADDRESS"
			ssh -i "$KEYDIR/$KEY" $ADDRESS
			break
			;;

		--copy|-c)
			ADDRESS=$(sed -n "/${2}/p" ${DATAFILE} | awk -F',' '{print $2}')
			KEY=$(sed -n "/${2}/p" ${DATAFILE} | awk -F',' '{print $3}')
			echo "THIS IS ADDRESS"
			scp -i "$KEYDIR/$KEY" $3 $ADDRESS:~/
			break
			;;


		esac

done;
