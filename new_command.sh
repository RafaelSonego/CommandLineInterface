#!/bin/bash

caminho_default=/mnt/c/Users/rafae/Desktop/Curso_Shell/ShellScript/new_imagens-livros

show_file_name(){
	local caminho_completo=$1
	local caminho_sem_extensao=$(ls $caminho_completo | awk -F. '{ print $1 }')
	echo $caminho_sem_extensao
}


varrer_diretorio(){
	#funcao ira receber um parametro que sera o nome do diretorio
	#vai para o caminho especifico
	cd $1
	
	for file in *
	do
		echo $file
		local caminho_arquivo=$(find $caminho_default -name $file)
		if [ -d $caminho_arquivo ]
		then
			#echo "eh um diretorio: "
			#echo $caminho_arquivo
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

