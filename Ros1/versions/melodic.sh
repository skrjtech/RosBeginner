sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt update
sudo apt install -y                                  \
                 --allow-downgrades                  \
                 --allow-remove-essential            \
                 --allow-change-held-packages        \
                 libpcap-dev                         \
                 python-wstool                       \
                 python-rosdep                       \
                 build-essential                     \
                 libopenblas-dev                     \
                 python-rosinstall                   \
                 gstreamer1.0-tools                  \
                 libgstreamer1.0-dev                 \
                 ros-melodic-geodesy                 \
                 ros-melodic-desktop-full            \
                 python-rosinstall-generator         \
                 ros-melodic-socketcan-bridge        \
                 libgstreamer-plugins-base1.0-dev    \
                 libgstreamer-plugins-good1.0-dev

sudo sh -c 'echo "source /opt/ros/melodic/setup.bash" >> /root/.bashrc'
sudo rm -f /etc/ros/rosdep/sources.list.d/20-default.list
sudo rosdep init 
rosdep update
sudo apt-get install python-wstool python-catkin-tools
sudo apt update 

