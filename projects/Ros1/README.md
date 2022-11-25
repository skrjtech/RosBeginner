# ROS環境構築 (Melodic)
## Ros1 Melodic Install
計算機環境OS: Ubuntu OS 18.04 \
Ros環境のインストールをして行きます．\
下記のコマンドをコピーしてターミナルにペースト
```
git clone https://github.com/skrjtech/ros-beginner.git
cd ros-beginner/installer
make make ros1_melodic_install
cd ../projects/Ros1
```
インストール途中で国や地域，お使いのキーボードタイプが聞かれるので素直に入力しましょ！\
しばらく経つとインストールが終わるので，Ros環境がインストールされた先にsetup.bashを変数環境に登録します．
```
echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc
```
.bashrcに登録したsetup.bashを環境変数に反映させます．
```
source ~/.bashrc
```
ここまでで，Ros環境の初期設定が終わる．
# [基礎編](./Principiante/) ABC
順に解説
1. ワークスペースの作成
2. パッケージの作成
3. catkin_make
4. ノード(node)について
5. トピック(topic)について
6. Ros Debug
7. rosed
8. message / service
9. Pub/Sub (C++/Python)
10.  Run Pub/Sub
11. Service / Client (C++/Python)
12. データ記録・リプレイ
13. roswtf
14. roslaunch / launch ファイル
15. MultiMachine
# [応用編](./Profesional/) Professional
準備中
# [マスター編](./Maestro/) Master
準備中
# [神編](./Kami/) God
準備中

# Reference
* [日本語版ROS解説](http://wiki.ros.org/ja/ROS/Tutorials)
* [英語版ROS解説](http://wiki.ros.org/ROS/Tutorials)