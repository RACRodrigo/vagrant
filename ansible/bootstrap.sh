#!/bin/bash

set -x

while read line
do
    if [[ ! "${line}" =~ $(hostname) ]]; then
        echo ${line} >> /etc/hosts
    fi
done </vagrant/hosts

export DEBIAN_FRONTEND=noninteractive

apt-get install software-properties-common

apt-add-repository ppa:ansible/ansible

apt-get update

echo "America/Sao_Paulo" > /etc/timezone
dpkg-reconfigure tzdata
locale-gen pt_BR.UTF-8
update-locale LANG="pt_BR.UTF-8" LANGUAGE="pt_BR"
dpkg-reconfigure locales

apt-get dist-upgrade -y

case $(hostname) in
  controller*)
     echo "=== Provisioning CONTROLLER instance ==="
     apt-get install ntp ansible -y
     while read line
     do
       if [[ ! "${line}" =~ $(hostname) ]]; then
         host=$(echo ${line} | awk '{ print $3 }')
         echo "${host}" >> /etc/ansible/hosts
      fi
     done </vagrant/hosts
     sed -i 's/#remote_user = root/remote_user = vagrant/g' /etc/ansible/ansible.cfg
     sed -i 's/#host_key_checking = False/host_key_checking = False/g' /etc/ansible/ansible.cfg
     sed -i 's|#private_key_file = /path/to/file|private_key_file = /vagrant/insecure_private_key|g' /etc/ansible/ansible.cfg
     ;;
  *)
    echo "=== Provisioning GENERIC instances ==="
    apt-get install ntp -y
    ;;
esac

apt-get remove chef puppet --purge -y

apt-get autoremove -y

apt-get clean

update-alternatives --set editor /usr/bin/vim.basic

sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/g' /home/vagrant/.bashrc
sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/g' /root/.bashrc
