#!/bin/bash
url=http://localhost
curl $url/packages/packages.list > tmp
while read -r s;do 
f="${s%% *}"
if [[ $f = $1 ]];then
    dapkg=$s
    break
fi
done < tmp
dakg=($dapkg)
IFS=' '
read -a pkg <<< $dapkg
wget $url/packages/${pkg[0]}.tgz -O pkg
echo ${pkg[0]}
