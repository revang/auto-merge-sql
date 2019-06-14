import os
import time

# 获取文件夹下的 sql 文件
def get_file_list(folderPath):
    file_list=[]
    for root, dirs, files in os.walk(folderPath):
        for file in files:
            # .sql 常用 SQL 脚本
            # .pck 包
            # .prc 存储过程
            # .fnc 函数
            # .trg 触发器
            if file.endswith(('.sql','.pck','.prc','.fnc','.trg')):
                file_list.append(os.path.join(root, file).replace(os.getcwd()+'\\',''))
    return file_list

# 写入 sql
def write_sql(file_list):
    # 如果没有 sql 文件，则不执行
    if file_list==[]:
        return

    filename = 'auto-merge-sql-{0}.sql'.format(time.strftime('%Y%m%d',time.localtime(time.time())))
    with open(filename, 'w') as file_object:
    	for file in file_list:
    		file_object.write('prompt execute {0}\n'.format(file))
    		file_object.write('prompt ====================\n')
    		file_object.write('prompt\n')
    		file_object.write('@@{0}\n'.format(file))
    		file_object.write('\n')

if __name__=='__main__':
    file_list=get_file_list(os.getcwd())
    write_sql(file_list)


            