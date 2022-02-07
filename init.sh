#!/bin/bash

sudo ovs-vsctl --if-exists del-br AccessNet
sudo ovs-vsctl --if-exists del-br ExtNet
sudo ovs-vsctl add-br AccessNet
sudo ovs-vsctl add-br ExtNet

sudo docker image load -i img/vnf-vyos/vyos-rolling-1.3.tar.gz

# Crear imagenes docker
sudo docker build -t vnf-img img/vnf-img
sudo docker build -t vnf-vyos img/vnf-vyos
sudo docker build -t vnf-arpwatch img/vnf-arpwatch

# Subir a OSM
osm vnfd-create pck/vnf-vclass.tar.gz
osm vnfd-create pck/vnf-vcpe.tar.gz
osm vnfd-create pck/arpwatch.tar.gz
osm nsd-create pck/ns-vcpe.tar.gz

# Instanciar vCPE
osm ns-create --ns_name vcpe-1 --nsd_name vCPE --vim_account emu-vim
osm ns-create --ns_name vcpe-2 --nsd_name vCPE --vim_account emu-vim

sleep 30

# Creacion de redes residenciales
sudo vnx -f vnx/nfv3_home_lxc_ubuntu64.xml -t

# Creacion red servers
sudo vnx -f vnx/nfv3_server_lxc_ubuntu64.xml -t
