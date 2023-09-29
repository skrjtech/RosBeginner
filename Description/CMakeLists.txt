# バージョン指定
cmake_minimum_required(VERSION 2.8.3)

# プロジェクト名の定義 (パッケージ名)
project(プロジェクト名)

# 依存関係のパッケージを検索
find_package( catkin REQUIRED COMPONENTS
    """ 依存関係のパッケージを定義 """
    message_generation # Message / Service / Action 使用するとき使う
)

# Message / Service / Action の生成
## DIRECTORY msg (msgの場所を示す)
## FILES xxx.msg
add_message_files(
  DIRECTORY msg
  FILES FILE_MESSAGE.msg
)
## DIRECTORY srv (srvの場所を示す)
## FILES xxx.srv
add_service_files(
  DIRECTORY srv
  FILES FILE_SERVICE.srv
)
## DIRECTORY act (actの場所を示す)
## FILES xxx.srv
add_action_files(
  DIRECTORY act
  FILES FILE_ACTION.act
)

catkin_package(
 INCLUDE_DIRS include # このパッケージのためのエクスポートされるinclude パス 
 LIBRARIES basic_mover_base # プロジェクトからエクスポートされるライブラリ
 CATKIN_DEPENDS seed_r7_ros_controller # このプロジェクトが依存している他のcatkinプロジェクト
 DEPENDS system_lib # このプロジェクトが依存している非catkin CMakeのプロジェクト (eigen opencv)
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

# ライブラリのターゲット
# ビルドする際のライブラリを指定する
add_library(${PROJECT_NAME}
  src/${PROJECT_NAME}/main.cpp
)

# 実行ファイルのターゲット
# (ターゲット名 SRC/CPPファイルパス)
add_executable(main src/main.cpp) 
# add_executable 実行方法 $ catkin Package main (catkin パッケージ ターゲット名)

# リンクするライブラリのパスを追加
# これがないと<ros/ros.h>をincludeしても内部の実装が読めずにエラー
target_link_libraries(main ${catkin_LIBRARIES})

# Message / Service / Action が含むファイルをビルドしようしたときに定義
# main.cpp で作成したメッセージやサービスを呼び出すときに使う
add_dependencies(main ${PROJECT_NAME}_generate_messages_cpp)

# include ファイルの適用
include_directories( include ${catkin_INCLUDE_DIRS} )

# インストール可能なターゲットを指定
install(TARGETS ${PROJECT_NAME} # どのターゲットをインストールするか
  # 静的ライブラリとDLL (Windows) .lib のスタブ
  ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION} 
  # 非DLL 共有ライブラリとモジュール
  LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  # 実行可能ターゲットと DLL (Windows) 形式の共有ライブラリ
  RUNTIME DESTINATION ${CATKIN_GLOBAL_BIN_DESTINATION}
)

# Pythonの実行可能Scriptのインストール
catkin_install_python(
  PROGRAMS scripts/myscript
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)
