#!/bin/bash

MAC_NAME=$(fw_printenv | awk -F= '/^ethaddr=/{print $2}')
Old_HostName=$(hostname)

New_HostName=${Old_HostName}-$(echo $MAC_NAME | awk -F : '{print $4$5$6}')
hostnamectl set-hostname  ${New_HostName}

# Prevent start at next boot time
touch "/var/lib/first-boot-set-hostname"