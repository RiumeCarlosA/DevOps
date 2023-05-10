#/bin/sh

yum update -y

yum install -y gcc kernel-devel kernel-headers dkms make bzip2 perl

yum install -y epel-release && yum install -y dkms

mkdir /mnt/iso
mount -o loop /home/vagrant/VBoxGuestAdditions.iso /mnt/iso

/mnt/iso/VBoxLinuxAdditions.run

umount /mnt/iso
rmdir /mnt/iso

echo "inicio da instalação do ansible"
sudo yum -y install ansible
cat <<EOT >> /etc/hosts
192.168.56.2 control-node
192.168.56.3 app01
192.168.56.4 db01
EOT
