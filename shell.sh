#!/bin/bash

for subs in $(cat sub.txt)
do
if [[ $(ping -c 1 $subs 2> /dev/null) ]]
then
echo "$i ++++++  Pong" $(echo $subs >> valid_subs.txt)
else
echo "$i - - - - Error" $(> /dev/null)
fi
done

for ip in $(cat valid_subs.txt)
do
host $ip
$(ping $ip | head -n 1 | cut -d "(" -f 2 | cut -d ")" -f 1 >> ips.txt)
done

echo "Done"
