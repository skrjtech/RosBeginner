#!/bin/bash
pip install -U vcstool
pip install -U colcon-common-extensions
choco install -y curl
python -m pip install -U setuptools pip
pip install -U catkin_pkg cryptography EmPy ifcfg lark-parser lxml numpy pyparsing pyyaml
pip install -U pytest pytest-mock coverage mock
pip install -U flake8 flake8-blind-except flake8-builtins flake8-class-newline flake8-comprehensions flake8-deprecated flake8-docstrings flake8-import-order flake8-quotes mypy==0.761 pep8 pydocstyle
choco install -y cppcheck
setx /m Qt5_DIR C:\Qt\Qt5.12.12\5.12.12\msvc2017_64
setx /m QT_QPA_PLATFORM_PLUGIN_PATH C:\Qt\Qt5.12.12\5.12.12\msvc2017_64\plugins\platforms