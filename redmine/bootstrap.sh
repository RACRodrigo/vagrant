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
sed -i -e 's/# pt_BR.UTF-8 UTF-8/pt_BR.UTF-8 UTF-8/' /etc/locale.gen
echo 'LANG="pt_BR.UTF-8"'>/etc/default/locale
dpkg-reconfigure locales
update-locale LANG=pt_BR.UTF-8

apt-get dist-upgrade -y

apt-get install -y ntp vim libpam-systemd mysql-server bundler imagemagick zlib1g-dev libmysqlclient-dev libmagickcore-dev libmagickwand-dev libapache2-mod-passenger apache2

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

mysql -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('root');"
echo -e "[client]\nuser=root\npassword=root\n" > /root/.my.cnf
mysql -e "SET PASSWORD FOR 'root'@'127.0.0.1' = PASSWORD('root');"
mysql -e "SET PASSWORD FOR 'root'@'::1' = PASSWORD('root');"
mysql -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
mysql -e "CREATE DATABASE redmine CHARACTER SET utf8 COLLATE utf8_general_ci;"
mysql -e "CREATE USER 'redmine'@'localhost' IDENTIFIED BY 'redmine';"
mysql -e "GRANT ALL PRIVILEGES ON redmine.* TO 'redmine'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"

groupadd redmine
useradd -c "Redmine User Account" -d /opt/redmine -g redmine -m -s /bin/bash redmine

wget -q http://www.redmine.org/releases/redmine-3.3.0.tar.gz

tar xzf redmine-3.3.0.tar.gz -C /opt/redmine
rm redmine-3.3.0.tar.gz

chown -R redmine:redmine /opt/redmine/redmine-3.3.0
chown -R www-data /opt/redmine/redmine-3.3.0/files /opt/redmine/redmine-3.3.0/log /opt/redmine/redmine-3.3.0/tmp /opt/redmine/redmine-3.3.0/public/plugin_assets

cp /opt/redmine/redmine-3.3.0/config/database.yml.example /opt/redmine/redmine-3.3.0/config/database.yml
sed -i '9s/username: root/username: redmine/' /opt/redmine/redmine-3.3.0/config/database.yml
sed -i '10s/password: ""/password: "redmine"/' /opt/redmine/redmine-3.3.0/config/database.yml

cp /etc/sudoers.d/vagrant /etc/sudoers.d/redmine
sed -i 's/vagrant/redmine/' /etc/sudoers.d/redmine

sudo -i -u redmine bash -c "cd /opt/redmine/redmine-3.3.0; bundle install --without development test"
sudo -i -u redmine bash -c "cd /opt/redmine/redmine-3.3.0; bundle exec rake generate_secret_token"
sudo -i -u redmine bash -c "cd /opt/redmine/redmine-3.3.0; bundle exec rake db:migrate RAILS_ENV=\"production\""

chown -R www-data:www-data /opt/redmine/redmine-3.3.0/Gemfile.lock
 
ln -s /opt/redmine/redmine-3.3.0/public /var/www/html/redmine

sed -i 's|DocumentRoot /var/www/html|DocumentRoot /var/www/html\n\n\t<Location /redmine>\n\t\tRailsEnv production\n\t\tRackBaseURI /redmine\n\t\tOptions -MultiViews\n\t</Location>|' /etc/apache2/sites-available/000-default.conf

sed -i 's|</IfModule>|  PassengerUser www-data\n</IfModule>|' /etc/apache2/mods-available/passenger.conf

service apache2 restart
