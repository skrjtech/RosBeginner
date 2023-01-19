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

念の為に **~/.ros** の所有権を変更します．
```
sudo chown -R $USER:$USER ~/.ros
```
rootの場合
```
sudo chown -R root:root ~/.ros
```
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
            /--- CMakeLists.txt

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
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
```
登録後に環境変数に反映させ，環境変数を確認します．
```
source ~/.bashrc
echo $ROS_PACKAGE_PATH
```
以下のような

    /opt/ros/melodic/share:/home/user/catkin_ws/src

PATHが出力されたらOKです．

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

次に作成したパッケージにスクリプトを記述してスクリプト同士の通信を行っていく前に，ノードについて解説していきます．

## ノード(Node)
グラフの概念 ([リンク](http://wiki.ros.org/ja/ROS/Tutorials/UnderstandingNodes)先を参考)

    * ノード
        ノードを構築することによってノード同士を通信し合える
    * トピック
        ノードをトピックに向けて送信，逆にトピックで受信
    * メッセージ
        トピックに送受信するROSデータ型
    * マスター
        ノードが互いに検索し合うのを助けます
    * rosout
        ROS版 stdoutやstderr
    * roscore
        ノード同士を接続させる機能

ノードの理解を深める為に，存在するシミュレータをインストールします．
```
sudo apt-get install -y ros-$ROS_DISTRO-ros-tutorials
```
これからノード立ち上げ行く作業を行います．  
ノード同士の接続を行うのに
```
roscore
```
を立ち上げます．  
roscoreが何を行っているかをrosnodeを用いて確認
します．  
rosnodeは実行中のノードの情報を表示します．  
新しいターミナルを開いて
```
rosnode list
```
の中身を確認します．

    /rosout

が出力されます．  
rosoutはノードのデバッグ出力を収集してログ化をする為に常に起動しています．  
ノード情報を確認するには
```
rosnode info /rosout
```
で，rosoutのノード情報を確認することができます．

    --------------------------------------------------------------------------------
    Node [/rosout]
    Publications: None
    
    Subscriptions: None
    
    Services: None
    
    cannot contact [/stdout]: unknown node

はじめは，別なノードが繋がってないので情報が出ません．  
新しいターミナルで
```
rosrun turtlesim turtlesim_node
```
を起動します．  
もう一度，rosnodeのリストを確認します.
```
rosnode list
```
    /rosout
    /turtlesim

が出力されます．  
次にノード情報を確認します．
```
rosnode info /stdout
```
    --------------------------------------------------------------------------------
    Node [/rosout]
    Publications:
    * /rosout_agg [rosgraph_msgs/Log]

    Subscriptions:
    * /rosout [rosgraph_msgs/Log]

    Services:
    * /rosout/get_loggers
    * /rosout/set_logger_level


    contacting node http://d2c9887146f9:43191/ ...
    Pid: 921
    Connections:
    * topic: /rosout
        * to: /turtlesim (http://d2c9887146f9:46413/)
        * direction: inbound (52126 - d2c9887146f9:34703) [13]
        * transport: TCPROS
のように出力されるはずです．  
turtlesim のノードも確認して行きます．
```
rosnode info /turtlesim
```
    --------------------------------------------------------------------------------
    Node [/turtlesim]
    Publications:
     * /rosout [rosgraph_msgs/Log]
     * /turtle1/color_sensor [turtlesim/Color]
     * /turtle1/pose [turtlesim/Pose]

    Subscriptions:
     * /turtle1/cmd_vel [unknown type]

    Services:
     * /clear
     * /kill
     * /reset
     * /spawn
     * /turtle1/set_pen
     * /turtle1/teleport_absolute
     * /turtle1/teleport_relative
     * /turtlesim/get_loggers
     * /turtlesim/set_logger_level


    contacting node http://d2c9887146f9:46413/ ...
    Pid: 1022
    Connections:
     * topic: /rosout
        * to: /rosout
        * direction: outbound (34703 - 172.18.0.2:52126) [14]
        * transport: TCPROS
のように出力されます．  
これでノードがどのように接続されているかがわかります．  
rosnode info で出力している **Publications** / **Subscriptions** / **Services** は, お互いに情報の交換を行っており，どのノードが起動されているかを確認することができます．

ここで開いているすべてのターミナルを閉じます．

Rosの魅力としてコマンドラインから引数を扱うことができます．
```
rosrun turtlesim turtlesim_node __name:=my_turtle
```
__nameの引数にmy_turtleを与えると，
```
rosnode list
```
で名前が変更されたノードが出力されます．

    /my_turtle
    /rosout

次にノードの起動確認をします．
```
rosnode ping my_turtle
```
    rosnode: node is [/my_turtle]
    pinging /my_turtle with a timeout of 3.0s
    xmlrpc reply from http://d2c9887146f9:43001/    time=14.055014ms
    xmlrpc reply from http://d2c9887146f9:43001/    time=0.494003ms
    xmlrpc reply from http://d2c9887146f9:43001/    time=0.591993ms
    xmlrpc reply from http://d2c9887146f9:43001/    time=0.482798ms

が出力され, 起動していることがわかります．  
起動していないときは

    rosnode: node is [/my_turtle]
    pinging /my_turtle with a timeout of 3.0s
    ERROR: connection refused to [http://d2c9887146f9:43001/]

のように出力される．