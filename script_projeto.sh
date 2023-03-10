#!/bin/bash

echo "migrando para root..."

su root

echo "Criando Diretórios..."

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "Criando Grupos..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando Usuários..."

useradd carlos -c "Carlos ADM" -s /bin/bash -m -p $(openssl passwd -crypto senha123)
passwd carlos -e

useradd maria -c "Maria ADM" -s /bin/bash -m -p $(openssl passwd -crypto senha123)
passwd maria -e

useradd joao -c "João ADM" -s /bin/bash -m -p $(openssl passwd -crypto senha123)
passwd joao -e

useradd debora -c "Débora VEN" -s /bin/bash -m -p $(openssl passwd -crypto senha123)
passwd debora -e

useradd sebastiana -c "Sebastiana VEN" -s /bin/bash -m -p $(openssl passwd -crypto senha123)
passwd sebastiana -e

useradd roberto -c "Roberto VEN"  -s /bin/bash -m -p $(openssl passwd -crypto senha123)
passwd roberto -e

useradd josefina -c "Josefina SEC" -s /bin/bash -m -p $(openssl passwd -crypto senha123)
passwd josefina -e

useradd amanda -c "Amanda SEC" -s /bin/bash -m -p $(openssl passwd -crypto senha123)
passwd amanda -e

useradd rogerio -c "Rogério SEC" -s /bin/bash -m -p $(openssl passwd -crypto senha123)
passwd rogerio -e

echo "Adicionando os usuários aos seus grupos..."

usermod -G GRP_ADM carlos

usermod -G GRP_ADM maria

usermod -G GRP_ADM joao

usermod -G GRP_VEN debora

usermod -G GRP_VEN sebastiana

usermod -G GRP_VEN roberto

usermod -G GRP_SEC josefina

usermod -G GRP_VEN amanda

usermod -G GRP_VEN rogerio

echo ""

chown root:root  /publico

chown root:GRP_ADM /adm

chown root:GRP_VEN /ven

chown root:GRP_SEC /sec


echo "Atribuindo Permissão às Pastas..."

chmod 777 /publico

chmod 700 /adm

chmod 700 /ven

chmod 700 /sec

echo "Finalizado!!"
