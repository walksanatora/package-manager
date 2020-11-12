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
tar -xzf pkg
cd ${pkg[0]}
./install.sh
echo ${pkg[0]}
