#!/bin/bash

if [ ! -d log ]
then
	mkdir log
fi

get_process(){
	#recupera a lista de processos
	process=$(ps -e -o pid --sort -size | head -n 11 | grep [0-9])

	#Para cada processo..
	for pid in $process
	do
		#recupera o nome do comando
		local command_name=$(ps -p $pid -o comm=)
		if [ ! -z "$command_name" ]
		then
			#grava um arquivo com o nome_do_comando.log
			echo -n $(date +%F,%H:%M:%S, ) >> log/$command_name.log
			
			#recupera o tamanho do processo
			local size_process=$(ps -p $pid -o size | grep [0-9])
		
			#converte o tamanho do processo em MB
			local size_process_mb="$(bc <<< "scale=2;$size_process/1024") MB"

			#grava no arquivo de log criado posteriormente
			echo $size_process_mb >> log/$command_name.log
		fi
	done
}

#executa o processo
get_process

if [ $? -eq 0 ]
then
	echo "sucesso!"
else
	echo "deu ruim =("
fi

