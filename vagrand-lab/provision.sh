#!/usr/bin/env bash

# Atualizando o sistema
yum update -y

# Instalando pacotes necessários
yum install -y gcc kernel-devel kernel-headers dkms make bzip2 perl

# Instalando repositório EPEL e dkms
yum install -y epel-release && yum install -y dkms

# Montar a imagem ISO das Guest Additions
mkdir /mnt/iso
mount -o loop /home/vagrant/VBoxGuestAdditions.iso /mnt/iso

# Instalar as Guest Additions
/mnt/iso/VBoxLinuxAdditions.run

# Desmontar a imagem ISO
umount /mnt/iso
rmdir /mnt/iso

echo "instalando apache e configurando.."
yum install -y httpd
cp -r /vagrant/html/* /var/www/html/
service httpd start
