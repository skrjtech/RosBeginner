#!/bin/bash

sudo apt update && sudo apt -y upgrade
sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get install -y lsb-release gpg

DistributorID=$(lsb_release -is)
Release=$(lsb_release -rs)
Codename=$(lsb_release -cs)

# echo $DistributorID $Release $Codename

if [ $Release = "18.04" ]; then
    bash <(curl https://raw.githubusercontent.com/skrjtech/archives/main/installer/ros1_melodic.sh)
elif [ $Release = "20.04" ]; then
    bash <(curl https://raw.githubusercontent.com/skrjtech/archives/main/installer/ros1_noetic.sh)
elif [ $Release = "22.04" ]; then
    bash <(curl https://raw.githubusercontent.com/skrjtech/archives/main/installer/ros2_jammy.sh)
else
    echo '特定のOSリリースが見つかりません'
fi
