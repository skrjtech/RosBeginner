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
次にアップデートしていきます．
```
rosdep update
```
ここまでで初期化完了です．
## 1. ワークスペースの作成
Ros環境の準備ができたら，ディレクトリを作成して行きます．  
```
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws
```
のように必要なディレクトリを作成して行く． **catkin_ws** のディレクトリ名は何でも良い！  
次に **catkin_make** でワークスペースを作成します．  
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

をインストールした際に異なる．  
解説しているRos環境のインストールについては，古めのビルドシステム(catkin_makeを用いる場合)をインストールしています．入門編では古めのバージョンで解説して行きますが，次の編では新しいバージョンのビルドシステムを使用します．現在の情報で入り混じっているところが多く見られるので，予めに古めのバージョンを知って行くことで，ビルド方法について知って行けると思います．  

ここまでの手順を行ったら，**~/catkin_ws/devel/setup.bash** の環境変数を **~/.bashrc** に登録します.

```
echo "source ~/catkin_ws/devel/setup.bash"
```
登録後に環境変数に反映させ，環境変数を確認します．
```
echo $ROS_PACKAGE_PATH
```
以下のように

    /opt/ros/melodic/share:/home/user/catkin_ws/src

出力されたらOKです．

## 2. パッケージの作成
パッケージを作成することで，作業手順を１つにまとめることができます．  
例として  

    /--- catkin_ws/
        /--- /src/
            /--- /package 1/ ロボット情報パック
                /--- CmakeLists.txt
                /--- package.yml
            /--- /package 2/ コントローラーパック
                /--- CmakeLists.txt
                /--- package.yml
            /--- /package 3/ ロボットとコントローラの呼び出し・スクリプト制御
                /--- CmakeLists.txt
                /--- package.yml
            /--- /package N/ その他
                /--- CmakeLists.txt
                /--- package.yml

のように各パッケージにそれぞれさせたい仕事を割り振ることで，作業手順をまとめることができ,  
その作業を呼び出すパッケージを作成すれば，簡単にロボットを動かすことができます．  
パッケージを作成する際は，パッケージ内で用いるツールを依存させておく必要があります．

    catkin_create_pkg <ディレクトリ名> <依存1> <依存2> <依存3> <依存N>

のように依存ツールを指定します．  
実際にパッケージを作成して行きます．
```
cd ~/catkin_ws/src
catkin_create_pkg beginner_tutorials std_msgs rospy roscpp
ls
```
上記のコマンドを実行すると

    /--- catkin_ws/
        /--- /src/
            /--- /beginner_tutorials/
                /--- CmakeLists.txt 
                /--- package.yml

のように作成されていきます．