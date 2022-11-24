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
# [基礎編](./beginner/) Beginner ABC
順に解説
1. ワークスペースの作成
2. catkin_make or catkin init
3. パッケージの作成
4. catkin_make or catkin build
5. ノード(node)について
6. トピック(topic)について
7. Ros Debug
8. rosed
9. message / service
10. Pub/Sub (C++/Python)
11.  Run Pub/Sub
12. Service / Client (C++/Python)
13. データ記録・リプレイ
14. roswtf
15. roslaunch / launch ファイル
16. MultiMachine
# [応用編](./professional/) Professional
順に解説
1. ロボット設計
