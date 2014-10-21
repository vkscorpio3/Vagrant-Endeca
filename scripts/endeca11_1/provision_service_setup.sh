echo "setting up endeca services"

mkdir -p /home/vagrant/scripts
chown vagrant.vagrant /home/vagrant/scripts

cp /vagrant/scripts/endeca11_1/endeca/endecaplatform /etc/init.d/endecaplatform
chmod 750 /etc/init.d/endecaplatform
chkconfig --add endecaplatform

cp /vagrant/scripts/endeca11_1/endeca/endecaworkbench /etc/init.d/endecaworkbench
chmod 750 /etc/init.d/endecaworkbench
chkconfig --add endecaworkbench

cp /vagrant/scripts/endeca11_1/endeca/endecacas /etc/init.d/endecacas
chmod 750 /etc/init.d/endecacas
chkconfig --add endecacas

# start all services
/vagrant/scripts/endeca11_1/start_endeca_services.sh

echo "endeca service setup complete"