#!/bin/bash

###############################################################################
## ISCTE-IUL: Trabalho prático de Sistemas Operativos
##
## Aluno: ETI-A6 Nº:a98647   Nome: João Monteiro
## Nome do Módulo: lista_cidadaos.sh
## Descrição/Explicação do Módulo: 
##
##
###############################################################################

## se já existir o ficheiro cidadaos.txt erá eliminá-lo
if [ -f cidadaos.txt ] ; then 
   rm cidadaos.txt
   fi 


#Loop em que é criado um file "listagem.txt" para que o lista_cidadaos.sh leia a listagem
file='listagem.txt'
while read line; do
echo $line
done < $file

# echo para dar um nome para a nossa lista de pessoas
echo -------------------lista de cidadãos do sistema Covid-IUL------------------- > cidadaos.txt
echo >> cidadaos.txt
echo >> cidadaos.txt

i=1
#variavél que conta as linhas do ficheiro
word_count=$( cat listagem.txt | wc -l )



while [ $i -le $word_count ]; do

#Variável que vai buscar o ano em que cada utente nasceu
ano_em_que_utente_nasceu=$( cat listagem.txt | cut -d "-" -f3 | cut -d"|" -f1 | head -$i |tail -1 )
#O número de utente será igual a linha de cada utente
numero_de_utente=$(( i+10000 ))
#encontrar o nome do utente
nome=$( cat listagem.txt | cut -d":" -f2 | cut -d"|" -f1 | cut -d" " -f1,-2 | head -$i | tail -1 )
#Usa a variável em cima criada para calcular a idade do utente
idade=$(( 2021-ano_em_que_utente_nasceu ))
#Encontra a Localidade de cada utente
localidade=$( cat listagem.txt | cut -d"|" -f3 | cut -d":" -f2 | cut -d" " -f1 | head -$i | tail -1 )
#Encontra o número de telemóvel de cada utente
telemovel=$( cat listagem.txt | cut -d"|" -f4 | cut -d":" -f2 | head -$i | tail -1 )
estado_vacinacao=0



# Criação das variáveis que precisamos para cada categoria
echo "$numero_de_utente:$nome:$idade:$localidade:$telemovel:$estado_vacinacao" >> cidadaos.txt

i=$(($i+ 1))

done

clear 

cat cidadaos.txt