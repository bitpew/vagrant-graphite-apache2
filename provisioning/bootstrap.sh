#!/usr/bin/env bash

sudo DEBIAN_FRONTEND=noninteractive apt-get install -y graphite-carbon graphite-web apache2 libapache2-mod-wsgi

sudo cp /vagrant/provisioning/etc/default/graphite-carbon /etc/default/graphite-carbon
sudo cp /vagrant/provisioning/etc/carbon/carbon.conf /etc/carbon/carbon.conf
sudo cp /vagrant/provisioning/etc/carbon/storage-schemas.conf /etc/carbon/storage-schemas.conf
sudo cp /vagrant/provisioning/etc/graphite/local_settings.py /etc/graphite/local_settings.py
sudo cp /vagrant/provisioning/etc/apache2/sites-available/graphite-web.conf /etc/apache2/sites-available/graphite-web.conf

sudo a2ensite graphite-web
sudo service apache2 reload

sudo update-rc.d carbon-cache defaults 95 10
sudo service carbon-cache start

sudo graphite-manage syncdb --noinput

sudo chmod 666 /var/lib/graphite/graphite.db
sudo chmod 755 /usr/share/graphite-web/graphite.wsgi