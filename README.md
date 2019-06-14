# pyinstaller main.py
# -F 单个文件
# -i logo.ico logo信息
pyinstaller main.py -F -i resources/logo.ico -n execute-sql.exe

# 忽略 *.~*文件
