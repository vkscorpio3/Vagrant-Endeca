#!/bin/bash
# Provision the db vm

ALL_PROVISIONERS="check setup install service"

if [[ $@ ]]; then
    PROVISIONERS=$@
else
    PROVISIONERS=$ALL_PROVISIONERS
fi

for p in $PROVISIONERS
do
    case "$p" in 
        check)
            source /vagrant/scripts/endeca11_1/provision_check_software.sh
            ;;
        setup)
            /vagrant/scripts/endeca11_1/provision_setup.sh
            ;;
        install)
            /vagrant/scripts/endeca11_1/provision_install.sh
            ;;
        service)
            /vagrant/scripts/endeca11_1/provision_service_setup.sh
            ;;

        *)
            echo "Invalid provisioning arg $p.  Valid args are: $ALL_PROVISIONERS"
    esac
done

