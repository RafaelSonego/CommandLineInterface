#!/bin/bash

convert_image(){
#vai para o caminha especificado
cd /mnt/c/users/rafae/Desktop/ShellScript/imagens-livros

#-d verifica se o diretorio existe
if [ ! -d png ]
then
	echo "criando o diretorio png"
	mkdir png
fi

for imagem in *.jpg
do
	local nome_arquivo=$(ls $imagem | awk -F. '{print $1}')
	#echo $nome_arquivo
done

#forcando um erro para testar o if
cd /testeee

}

convert_image 2>> log.txt

if [ $? -eq 0  ]
then 
	echo "deu certo!"
else
	echo "deu ruim!"
fi 


