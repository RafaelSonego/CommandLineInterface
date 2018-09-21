#!/bin/bash

cd /mnt/c/Users/rafae/Desktop/Curso_Shell/ShellScript/apache-log

#-z verifica se a variavel esta vazia
if [ -z $1  ]
then
	while [ -z $conteudo ]
	do
		#-p significa na mesma linha
		#read espera que o usuario informe algum conteudo
		#conteudo -> a variavel conteudo eh o valor que esperado que o usuario informe
	
		read -p "informe um conteudo: " conteudo
		to_upper_case=$(echo $conteudo | awk '{ print toupper($1) }')
	done
else
	to_upper_case=$(echo $1 | awk '{ print toupper($1) }')
fi

#if [ $to_upper_case == "GET"  ]
#then
#	cat apache.log | grep GET
#elif [ $1 == "POST" ]
#then
#	cat apache.log | grep POST
#else
#	echo "test"
#fi

case $to_upper_case in
	GET)
	cat apache.log | grep GET
	;;

	POST)
	cat apache.log | grep POST
	;;

	PUT)
	cat apache.log | grep PUT
	;;

	DELETE)
	cat apache.log | grep DELETE
	;;

	*)
	echo "valor default"
	;;
esac 













