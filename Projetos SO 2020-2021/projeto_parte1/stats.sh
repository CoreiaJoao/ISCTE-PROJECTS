#!/bin/bash

###############################################################################
## ISCTE-IUL: Trabalho prático de Sistemas Operativos
##
## Aluno:ITE-A6 Nº:a98647    Nome: João Monteiro
## Nome do Módulo: stats.sh
## Descrição/Explicação do Módulo: 
##
##
###############################################################################

#criação dos argumentos que precisamos de introduzir

cidadaos=$1
registados=$1
enfermeiros=$1
localidade=$2

numero_de_cidadaos_registados_localidade=$( cat cidadaos.txt | cut -d":" -f4 | grep -x "$localidade" | wc -l )

if [ "$idade" -gt 60 ]; then 
cidadao_mais_60=$( cat cidadaos.txt | cut -d"" -f1  | cut -d":" -f2 | sort )

echo "$nome:$numero_de_utente"
fi

echo "O número de cidadãos registados em "$2" é $numero_de_cidadaos_registados_localidade"
