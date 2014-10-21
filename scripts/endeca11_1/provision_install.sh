# do this as vagrant
exec sudo -u vagrant /bin/sh - << eof

	# endeca

	# MDEX
	/vagrant/software/endeca11_1/OCmdex6.5.1-Linux64_829811.sh --silent --target /usr/local
	source /usr/local/endeca/MDEX/6.5.1/mdex_setup_sh.ini

	# platform services
	/vagrant/software/endeca11_1/OCplatformservices11.1.0-Linux64.bin --silent --target /usr/local/ < /vagrant/scripts/endeca11_1/endeca_platformservices_silent.silentinput 
	source /usr/local/endeca/PlatformServices/workspace/setup/installer_sh.ini

	# tools and frameworks
	export ENDECA_TOOLS_ROOT=/usr/local/endeca/ToolsAndFrameworks/11.1.0
	export ENDECA_TOOLS_CONF=/usr/local/endeca/ToolsAndFrameworks/11.1.0/server/workspace

	unzip -n /vagrant/software/endeca11_1/V46389-01.zip -d /vagrant/software

	/vagrant/software/endeca11_1/cd/Disk1/install/silent_install.sh /vagrant/scripts/endeca11_1/endeca_toolsandframeworks_silent_response.rsp \
		ToolsAndFrameworks /usr/local/endeca/ToolsAndFrameworks admin

	sudo /home/vagrant/oraInventory/orainstRoot.sh

	# CAS
	/vagrant/software/endeca11_1/OCcas11.1.0-Linux64.sh --silent --target /usr/local < /vagrant/scripts/endeca11_1/endeca_cas_silent.silentinput

	# setup bash profile now that the required files are installed

	echo "source /usr/local/endeca/MDEX/6.5.1/mdex_setup_sh.ini" >> /home/vagrant/.bash_profile \
	 && echo "source /usr/local/endeca/PlatformServices/workspace/setup/installer_sh.ini" >> /home/vagrant/.bash_profile

eof