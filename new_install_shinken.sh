apt-get install curl && curl -L http://install.shinken-monitoring.org | /bin/bash
service shinken stop
chown -R shinken:shinken /usr/local/shinken
service shinken start
