#!/bin/bash

set -x

while read line
do
    if [[ ! "${line}" =~ $(hostname) ]]; then
        echo ${line} >> /etc/hosts
    fi
done </vagrant/hosts

export DEBIAN_FRONTEND=noninteractive

apt-get update

echo "America/Sao_Paulo" > /etc/timezone
dpkg-reconfigure tzdata
locale-gen pt_BR.UTF-8
update-locale LANG="pt_BR.UTF-8" LANGUAGE="pt_BR"
dpkg-reconfigure locales

apt-get dist-upgrade -y

apt-get install curl openssh-server ca-certificates exim4 ntp vim -y

apt-get autoremove -y

apt-get clean

update-alternatives --set editor /usr/bin/vim.basic

sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/g' /home/vagrant/.bashrc
sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/g' /root/.bashrc

cp /vagrant/exim4.conf.localmacros /etc/exim4
mv /etc/exim4/update-exim4.conf.conf /etc/exim4/update-exim4.conf.conf.ORG
cp /vagrant/update-exim4.conf.conf /etc/exim4
mv /etc/exim4/passwd.client /etc/exim4/passwd.client.ORG
cp /vagrant/passwd.client /etc/exim4
chown root:Debian-exim /etc/exim4/passwd.client

sed -i 's/# export LS/export LS/g' /root/.bashrc
sed -i 's/# eval /eval /g' /root/.bashrc
sed -i 's/# alias ls/alias ls/g' /root/.bashrc
sed -i 's/# alias ll=/alias ll=/g' /root/.bashrc
sed -i 's/# alias l=/alias l=/g' /root/.bashrc

sed -i 's/#alias ll=/alias ll=/g' /home/vagrant/.bashrc
sed -i 's/#alias la=/alias la=/g' /home/vagrant/.bashrc
sed -i 's/#alias l=/alias l=/g' /home/vagrant/.bashrc
sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/g' /home/vagrant/.bashrc

curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash
apt-get install gitlab-ce
gitlab-ctl reconfigure
