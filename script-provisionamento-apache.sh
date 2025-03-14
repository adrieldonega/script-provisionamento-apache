#!/bin/bash

# Atualizando o servidor
echo "Atualizando o servidor..."
sudo apt update -y
sudo apt upgrade -y

# Instalando o Apache
echo "Instalando o Apache..."
sudo apt install apache2 -y

# Instalando o Unzip
echo "Instalando o Unzip..."
sudo apt install unzip -y

# Baixando e copiando os arquivos da aplicação
echo "Baixando e copiando os arquivos da aplicação..."
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip
sudo cp -R linux-site-dio-main/* /var/www/html/

# Ajustando permissões
echo "Ajustando permissões..."
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/

# Reiniciando o Apache
echo "Reiniciando o Apache..."
sudo systemctl restart apache2

echo "Provisionamento concluído com sucesso!"
