#!/bin/bash

set -x

while read line
do
    if [[ ! "${line}" =~ $(hostname) ]]; then
        echo ${line} >> /etc/hosts
    fi
done </vagrant/hosts

export DEBIAN_FRONTEND=noninteractive

wget https://apt.puppetlabs.com/puppetlabs-release-pc1-trusty.deb

dpkg -i puppetlabs-release-pc1-trusty.deb

rm puppetlabs-release-pc1-trusty.deb

apt-get remove chef --purge -y

apt-get update

echo "America/Sao_Paulo" > /etc/timezone
dpkg-reconfigure tzdata
locale-gen pt_BR.UTF-8
update-locale LANG="pt_BR.UTF-8" LANGUAGE="pt_BR"
dpkg-reconfigure locales

apt-get dist-upgrade -y

if [[ $(hostname) = "puppet" ]]; then
   ## apt-get install ntp puppetmaster-passenger -y
   apt-get install ntp puppetserver -y
   ## echo "dns_alt_names = puppet,puppet.vagrant" >> /etc/puppet/puppet.conf
   ## service apache2 stop
   ## puppet master --verbose --no-daemonize &
   ## PUPPET_MASTER_PID=$!
   ## sleep 10
   ## kill ${PUPPET_MASTER_PID}
   ## service apache2 start
else
   apt-get install ntp puppet-agent -y
   ## service puppet stop
fi

apt-get autoremove -y

apt-get clean

update-alternatives --set editor /usr/bin/vim.basic

sed -i 's/\"syntax on/syntax on/g' /etc/vim/vimrc

sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/g' /home/vagrant/.bashrc
sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/g' /root/.bashrc
