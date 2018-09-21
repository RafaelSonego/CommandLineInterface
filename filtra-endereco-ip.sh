#!/bin/bash

#diretorio onde esta o log
cd /mnt/c/Users/rafae/Desktop/Curso_Shell/ShellScript/apache-log

#regular expression to validate IP
regex="\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"

if [[ $1 =~ $regex ]]
then
	cat apache.log | grep $1
	if [ $? -ne 0 ]
	then
		echo "Nenhum registro encontrado"
	fi
else
	echo "invalid IP"
fi









