#!/bin/bash
#utilizando o curl para recuperar o retorno HTTP
reposta_http=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost)

if [  $resposta_http -eq 200 ]
then
	echo "Servidor esta de funcionando"
else
	echo "Servidor esta down"
	echo "Restart no servidor"
	systemctl restart apache2
	echo "... Servidor reinicializando"
fi

#Para agendar a execucao deste script pode utilizar o crontab
#sudo crontab -e

# m h  dom mon dow      command
#m : minutos
#h : horas
#dom : dia do mês
#mon : mês
#dow : dia da semana
#command : caminho completo para o script





