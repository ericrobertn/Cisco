#!/bin/bash
while read  ipadd
do
#echo $ipadd
export ipadd
./enablessh.sh $ipadd
done < IP-list
