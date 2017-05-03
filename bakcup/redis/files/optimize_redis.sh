#!/bin/bash

echo 2048 > /proc/sys/net/core/somaxconn
echo never > /sys/kernel/mm/transparent_hugepage/enabled
echo "vm.overcommit_memory = 1" >> /etc/sysctl.conf
sysctl -p
