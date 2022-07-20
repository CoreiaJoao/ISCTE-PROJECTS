#!/bin/bash

###############################################################################
## ISCTE-IUL: Trabalho prático de Sistemas Operativos
##
## Aluno:ETI-A6 Nº: a98647  Nome: João Monteiro
## Nome do Módulo: adiciona_enfermeiros.sh
## Descrição/Explicação do Módulo: 
##
##
###############################################################################

#criação dos argumentos pedidos ao utilizador para introduzir, sendo primeiro o nome e o ultimo a disponibilidade
nome=$1
numero_de_celula=$2
centro_saude_CS_Localidade=$3
disponibilidade=$4

#confirmar se todos os argumentos são necessários são dados, neste caso, 4 
#caso não o sejam exibe um erro , se todos os argumentos forem dados então o programa será executado
if [ $# -ne 4 ] ; 
then  echo "Erro: Síntaxe: $0 <número cédula profissional>:<nome>:<centro saúde associado>:<nº de vacinações efetuadas>:<disponibilidade>"
else 

#confirmar se existe o numero da celula nos ficheiros.txt
confirmar_numero_celula=$( cat enfermeiros.txt | cut -d":" -f1 | grep -x $numero_de_celula | wc -l )
#confirmar se existe o centro de saúde nos ficheiros.txt 
confirmar_centro_saude=$( cat enfermeiros.txt | cut -d":" -f3 | grep -x $centro_saude_CS_Localidade | wc -l )
 
#condição para verificiar se o número de celula e o centro de saude dados não são iguais a dados já existentes nos
#dados do ficheiro enfermeiros.txt, se já existirem então ocorre um erro que informa que esse enfermeiro já foi#registado anteriormente. Se os dados do enfermeiro dado forem diferentes dos já existentes no ficheiro
#então irá criar um enfermeiro com as devidas informações

if [ $confirmar_numero_celula -eq 0 ] && [ $confirmar_centro_saude -eq 0 ]; 
then

echo "$numero_de_celula:"$nome":"$centro_saude_CS_Localidade":0:$disponibilidade" >> enfermeiros.txt 

clear
cat enfermeiros.txt

else 

echo "Erro: O Centro de Saúde introduzido já tem um enfermeiro registado"

fi

fi

