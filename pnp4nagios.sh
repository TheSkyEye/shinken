apt-get install -y apache2 php5 libapache2-mod-php5 rrdtool librrds-perl php5-gd
wget --no-check-certificate http://downloads.sourceforge.net/project/pnp4nagios/PNP-0.6/pnp4nagios-0.6.24.tar.gz
tar -xzf pnp4nagios-0.6.24.tar.gz
cd pnp4nagios-0.6.24/
./configure --with-nagios-user=shinken --with-nagios-group=shinken
make all
make fullinstall
