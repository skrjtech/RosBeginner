# 入門編
## ~ 初期設定について ~  
インストール後のRos環境を初期化します．
```
sudo rosdep init
```
もしここで,  

    ERROR: default sources list file already exists:  
        /etc/ros/rosdep/sources.list.d/20-default.list
    Please delete if you wish to re-initialize

のエラーが出ましたら，
```
sudo rm -rf /etc/ros/rosdep/sources.list.d/20-default.list
```
でリストを消して行きます.  
## 1. ワークスペースの作成
Ros環境の準備ができたら，ディレクトリを作成して行きます．  
```
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws
```
のように必要なディレクトリを作成して行く．***catkin_ws***のディレクトリ名は何でも良い！  
次に***catkin_make***でワークスペースを作成します．  
```
cd ~/catkin_ws
catkin_make
ls
```
ワークスペースを作成すると以下のようになる.  

    /--- catkin_ws/  
        /--- /build/
        /--- /devel/
        /--- /src/

注意) catkinのビルドシステムについて  
ビルドシステムで，ワークスペースを作成する際に  

    catkin_make

を用いる場合と

    catkin init

を用いる場合がある．  
それらは, catkinのパッケージをインストール際に違って行きます.  

    sudo apt install -y catkin_wstool python-catkin-tools

解説しているRos環境のインストールについては，古めのビルドシステム(catkin_makeを用いる場合)をインストールしています．入門編では古めのバージョンで解説して行きますが，次の編では新しいバージョンのビルドシステムを使用します．現在の情報で入り混じっているところが多く見られるので，予めに古めのバージョンを知って行くことで，ビルド方法について知って行けると思います．