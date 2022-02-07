#!/bin/bash
./vclass_start.sh vcpe-2 10.255.0.3 10.255.0.4
./vyos_start.sh vcpe-2 192.168.255.2 10.2.3.2
#sudo vnx -f vnx/nfv3_home_lxc_ubuntu64.xml -x dhclient-h21
#sudo vnx -f vnx/nfv3_home_lxc_ubuntu64.xml -x dhclient-h22
