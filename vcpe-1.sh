#!/bin/bash
./vclass_start.sh vcpe-1 10.255.0.1 10.255.0.2
./vyos_start.sh vcpe-1 192.168.255.1 10.2.3.1
sudo vnx -f vnx/nfv3_home_lxc_ubuntu64.xml -x dhclient-h11
sudo vnx -f vnx/nfv3_home_lxc_ubuntu64.xml -x dhclient-h12
