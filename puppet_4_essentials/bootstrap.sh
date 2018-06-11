#!/bin/bash

set -x

while read line
do
    if [[ ! "${line}" =~ $(hostname) ]]; then
        echo ${line} >> /etc/hosts
    fi
done </vagrant/hosts

export DEBIAN_FRONTEND=noninteractive

wget https://apt.puppetlabs.com/puppetlabs-release-pc1-jessie.deb

dpkg -i puppetlabs-release-pc1-jessie.deb

rm puppetlabs-release-pc1-jessie.deb

apt-get update

echo "America/Sao_Paulo" > /etc/timezone
dpkg-reconfigure tzdata
sed -i -e 's/# pt_BR.UTF-8 UTF-8/pt_BR.UTF-8 UTF-8/' /etc/locale.gen
echo 'LANG="pt_BR.UTF-8"'>/etc/default/locale
dpkg-reconfigure locales
update-locale LANG=pt_BR.UTF-8

apt-get dist-upgrade -y

case $(hostname) in
  puppetmaster*)
     apt-get install ntp puppetserver -y
     echo 'certname = puppetmaster.vagrant.local' >> /etc/puppetlabs/puppet/puppet.conf
     echo '*.vagrant.local' > /etc/puppetlabs/puppet/autosign.conf
     systemctl enable puppetserver
     service puppetserver start
     ;;
  dev-*)
    echo "Provisioning DEV instances"
    apt-get install vim ntp puppet-agent -y
    service puppet start
    ;;
  prod-*)
    echo "Provisioning PROD instances"
    apt-get install vim ntp puppet-agent -y
    service puppet start
    ;;
  *)
    echo "Provisioning GENERIC instances"
    apt-get install vim ntp puppet-agent -y
    service puppet start
    ;;
esac

apt-get autoremove -y

apt-get clean

update-alternatives --set editor /usr/bin/vim.basic

sed -i 's/# export LS/export LS/g' /root/.bashrc
sed -i 's/# eval /eval /g' /root/.bashrc
sed -i 's/# alias ls/alias ls/g' /root/.bashrc
sed -i 's/# alias ll=/alias ll=/g' /root/.bashrc
sed -i 's/# alias l=/alias l=/g' /root/.bashrc

cp /vagrant/bash.bashrc /etc
cp /vagrant/.bashrc /home/vagrant
