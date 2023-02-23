# バージョン指定
cmake_minimum_required(VERSION 2.8.3)

# プロジェクト名の定義
project(プロジェクト名)

# 依存関係のパッケージを検索
find_package( catkin REQUIRED COMPONENTS
    """ 依存関係のパッケージを定義 """

)
# includeパスを追加 これがないと<ros/ros.h>が使えない
include_directories(
  ${catkin_INCLUDE_DIRS}
)

# ビルドするファイル
# /--- Package
# |     /--include
# |     |   /--package
# |     |   |   |--sample.h
# |     /--src
# |     |   |--sample.cpp
# |     |--CMakeLists.txt
# |     |--package.xml
add_executable(main src/main.cpp) # (ターゲット名 SRC/CPPファイルパス)
# add_executable 実行方法 $ catkin Package main (catkin パッケージ ターゲット名)

# リンクするライブラリのパスを追加
# これがないと<ros/ros.h>をincludeしても内部の実装が読めずにエラー
target_link_libraries(main ${catkin_LIBRARIES})

