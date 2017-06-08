#! /bin/bash

#MSG代表信件文件名

MSG=${filename:-"testmsg.txt"}

cat > $MSG <<HERE
From: im@example.edu.cn
To: yr@example.edu.cn
Subject:测试一下

这是一封测试信，请勿回复！
HERE
