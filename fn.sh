#! /bin/bash

fn=${1:?'错误！请提供要删除的目录名称！'}

echo '你要执行删除目录的指令是:'
echo "rm -Rf ~/$fn"
