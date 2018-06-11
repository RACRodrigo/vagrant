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

echo "deb http://deb.theforeman.org/ jessie 1.12" > /etc/apt/sources.list.d/foreman.list
echo "deb http://deb.theforeman.org/ plugins 1.12" >> /etc/apt/sources.list.d/foreman.list
wget -q https://deb.theforeman.org/pubkey.gpg -O- | apt-key add -

apt-get update

echo "America/Sao_Paulo" > /etc/timezone
dpkg-reconfigure tzdata
sed -i -e 's/# pt_BR.UTF-8 UTF-8/pt_BR.UTF-8 UTF-8/' /etc/locale.gen
echo 'LANG="pt_BR.UTF-8"'>/etc/default/locale
dpkg-reconfigure locales
update-locale LANG=pt_BR.UTF-8

apt-get dist-upgrade -y

apt-get install -y ntp vim foreman-installer

apt-get autoremove -y

apt-get clean

update-alternatives --set editor /usr/bin/vim.basic

sed -i 's/\"syntax on/syntax on/g' /etc/vim/vimrc

sed -i 's/# export LS/export LS/g' /root/.bashrc
sed -i 's/# eval /eval /g' /root/.bashrc
sed -i 's/# alias ls/alias ls/g' /root/.bashrc
sed -i 's/# alias ll=/alias ll=/g' /root/.bashrc
sed -i 's/# alias l=/alias l=/g' /root/.bashrc

cp /vagrant/bash.bashrc /etc
cp /vagrant/.bashrc /home/vagrant

foreman-installer -v --puppet-server-implementation=puppetserver --foreman-db-type=mysql --foreman-admin-password=dimarino

