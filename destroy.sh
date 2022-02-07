#!/bin/bash

USAGE="
Usage:
    
destroy <vcpe_name> 
    being:
        <vcpe_name>: the name of the network service instance in OSM 
"

if [[ $# -ne 1 ]]; then
        echo ""       
    echo "ERROR: incorrect number of parameters"
    echo "$USAGE"
    exit 1
fi

VNF1="mn.dc1_$1-1-ubuntu-1"
VNF2="mn.dc1_$1-2-ubuntu-1"

sudo ovs-docker del-port AccessNet veth0 $VNF1
sudo ovs-docker del-port ExtNet eth2 $VNF2
osm ns-delete $1

sleep 10

osm nsd-delete vCPE
osm vnfd-delete vclass
osm vnfd-delete vcpe
osm vnfd-delete arpwatch
osm ns-list
