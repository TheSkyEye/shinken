#http://www.samuelpoggioli.fr/shinken-2-installation-de-pnp4nagios/
apt-get install -y apache2 php5 libapache2-mod-php5 rrdtool librrds-perl php5-gd
wget --no-check-certificate http://downloads.sourceforge.net/project/pnp4nagios/PNP-0.6/pnp4nagios-0.6.24.tar.gz
tar -xzf pnp4nagios-0.6.24.tar.gz
cd pnp4nagios-0.6.24/
./configure --with-nagios-user=shinken --with-nagios-group=shinken
make all
make fullinstall
#/etc/httpd/conf.d/pnp4nagios.conf
#sed -i "s|    AuthName "Nagios Access"|    # AuthName "Nagios Access"|" /etc/httpd/conf.d/pnp4nagios.conf
#sed -i "s|    AuthType Basic|    # AuthType Basic|" /etc/httpd/conf.d/pnp4nagios.conf
#sed -i "s|    AuthUserFile /usr/local/nagios/etc/htpasswd.users|    # AuthUserFile /usr/local/nagios/etc/htpasswd.users|" /etc/httpd/conf.d/pnp4nagios.conf
#sed -i "s|    Require valid-user|    # Require valid-user|" /etc/httpd/conf.d/pnp4nagios.conf
cp -a /etc/httpd/conf.d/pnp4nagios.conf /etc/apache2/sites-available/
a2ensite pnp4nagios
#Si vous avez l’erreur 403 “You don’t have permission to access /pnp4nagios on this server”, il faut modifier la ligne “Require all denied” par “Require all granted” dans le fichier /etc/apache2/apache2.conf (voir dans les commentaires, merci Romain). Puis
sed -i "s|Require all denied|Require all granted|" /etc/apache2/apache2.conf
service apache2 restart
mv /usr/local/pnp4nagios/share/install.php /usr/local/pnp4nagios/share/install.php.old
pip install passlib
sudo -E shinken install npcdmod
sudo -E shinken install ui-pnp
sed -i "s|    modules|    modules    webui2,npcdmod|" /etc/shinken/brokers/broker-master.cfg
/etc/init.d/npcd restart
/etc/init.d/shinken restart
# si problème de conecttion :
#vérifier que les lignes sont bien commenté dans :
#/etc/apache2/sites-available/pnp4nagios.conf  
# AuthName "Nagios Access"    
# AuthType Basic    
# AuthUserFile /usr/local/nagios/etc/htpasswd.users
# Require valid-user
