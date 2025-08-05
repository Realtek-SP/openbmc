#!/bin/bash

MAC_ADDR=$(fw_printenv -n ethaddr)
IP_ADDR=$(fw_printenv -n ipaddr)

if echo "$MAC_ADDR" | grep -q -E "^([0-9a-fA-F]{2}:){5}[0-9a-fA-F]{2}$" ; then
	busctl set-property xyz.openbmc_project.Network /xyz/openbmc_project/network/eth0 xyz.openbmc_project.Network.MACAddress MACAddress s "$MAC_ADDR"
	busctl call xyz.openbmc_project.Network /xyz/openbmc_project/network/eth0 xyz.openbmc_project.Network.IP.Create IP ssys "xyz.openbmc_project.Network.IP.Protocol.IPv4" "$IP_ADDR" 20 "10.0.128.1"
	exit 0
else
	echo "ERROR: No valid BMC MAC Address available"
	exit 1
fi
