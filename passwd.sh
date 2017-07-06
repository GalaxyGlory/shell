#! /bin/bash

if grep -q ^root /etc/passwd;then
	echo 'root is here!'
fi
