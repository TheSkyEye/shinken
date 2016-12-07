#http://www.samuelpoggioli.fr/shinken-2-procedure-dinstallation/
#https://debian-fr.org/t/shinken-webui-graphite-statsd/69997/2
useradd -m shinken
apt-get install -y build-essential python-pycurl libperl-dev python-setuptools python-pip nmap python-setuptools mongodb python-pymongo libmysqlclient-dev libevent-dev python-paste libsnmp-python lsb-release sqlite3 pyro snmpd gawk python-dev libsqlite3-dev
pip install shinken
/etc/init.d/shinken start
sudo -E shinken shinken --init
#sudo -E shinken install webui
sudo -E shinken install webui2
sudo -E shinken install statsd
sudo -E shinken install nsca
sudo -E shinken install mod-influxdb
sudo -E shinken install booster-nrpe
sudo -E shinken install kiosks-counters
sudo -E shinken install graphite
sudo -E shinken install ui-graphite
sudo -E shinken install ui-pnp
sudo -E shinken install npcdmod
sudo -E shinken install ip_tag
sudo -E shinken install auth-cfg-password
sudo -E shinken install sqlitedb
sudo -E shinken install glpidb
sudo -E shinken install auth-htpasswd
sudo -E shinken install livestatus
sudo -E shinken install aix
sudo -E shinken install apcupsd
sudo -E shinken install cisco
sudo -E shinken install ceph
sudo -E shinken install cert
sudo -E shinken install collectd
sudo -E shinken install cups
sudo -E shinken install dc
sudo -E shinken install dhcp
sudo -E shinken install dns
sudo -E shinken install exchange
sudo -E shinken install glpi-helpdesk
sudo -E shinken install hp
sudo -E shinken install hp-asm
sudo -E shinken install hp-blades-chassis
sudo -E shinken install hp-printers
sudo -E shinken install hpux
sudo -E shinken install http
sudo -E shinken install ibm-xseries
sudo -E shinken install iis
sudo -E shinken install ldap
sudo -E shinken install linux-snmp
sudo -E shinken install linux-ssh
sudo -E shinken install ntp
sudo -E shinken install postgresql
sudo -E shinken install server-ipmi
sudo -E shinken install router
sudo -E shinken install switch
sudo -E shinken install windows
sudo -E shinken install logstore-null
sudo -E shinken install sqlitelog
sudo -E shinken install logstore-sqlite
sudo -E shinken install sqlitedb
sudo -E shinken install npcdmod
sudo -E shinken install mongodb
sudo -E shinken install mysql
sed -i "s|    modules|    modules    webui2|" /etc/shinken/brokers/broker-master.cfg
/etc/init.d/shinken restart
service shinken check
wget --no-check-certificate https://www.monitoring-plugins.org/download/monitoring-plugins-2.1.1.tar.gz
tar -xvf monitoring-plugins-2.1.1.tar.gz
cd monitoring-plugins-2.1.1/
./configure --with-nagios-user=shinken --with-nagios-group=shinken --enable-libtap --enable-extra-opts --enable-perl-modules --libexecdir=/usr/lib/nagios/plugins
make install
cd ..
