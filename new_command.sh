#!/bin/bash

caminho_default=/mnt/c/Users/rafae/Desktop/Curso_Shell/ShellScript/new_imagens-livros

show_file_name(){
	#Variavel local recebido por parametro 
	local caminho_completo=$1

	#remove a extensao do caminho recebido
	local caminho_sem_extensao=$(ls $caminho_completo | awk -F. '{ print $1 }')

	#imprimi o caminho sem extensao
	echo $caminho_sem_extensao
}

varrer_diretorio(){
	#funcao ira receber um parametro que sera o nome do diretorio $1
	#vai para o caminho especifico
	cd $1
	
	for file in *
	do
		echo $file

		
		#Excuta o comando find passando o caminho default configurado no comeco do script e o nome do file que esta no for corrente
		local caminho_arquivo=$(find $caminho_default -name $file)
		
		#Verifica se o caminho encontrado eh um diretorio e faz uma chamada recursiva
		if [ -d $caminho_arquivo ]
		then
	
		#	#echo "eh um diretorio: "
		#	#echo $caminho_arquivo

			varrer_diretorio $caminho_arquivo
		else
			show_file_name $caminho_arquivo
		fi
	done
}

varrer_diretorio $caminho_default

if [ $? -eq 0 ]
then
	echo "sucesso!"
else
	echo "deu ruim!"
fi

