#!/bin/bash

sudo apt update && sudo apt -y upgrade
sudo apt-get update && sudo apt-get -y upgrade

DistributorID=$(lsb_release -is)
Release=$(lsb_release -rs)
Codename=$(lsb_release -cs)

echo $DistributorID $Release $Codename

if [ $Release = "18.04" ] ; then
    . installer/RosVersion1/melodic_version.sh
elif [ $Release = "20.04" ] ; then
    . installer/RosVersion1/noetic_version.sh
elif [ $Release = "22.04" ] ; then
    installer/RosVersion2/humble_version.sh
else
    echo '特定のOSバージョンが見つかりません'
fi
