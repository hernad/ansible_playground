#!/bin/bash
# basic cobbler setup, just to give some idea of the commands you will need to run...
 
cobbler-ubuntu-import precise-x86_64
 
# FIXME: need to template out various things
profile_kopts="ksdevice=bootif locale=en_US text netcfg/confirm_static=true netcfg/get_gateway=2.2.1.1 priority=critical netcfg/get_nameservers=2.2.1.254 netcfg/disable_autoconfig=true netcfg/dhcp_options='Configure network manually' netcfg/no_default_route=true netcfg/choose_interface=auto partman-auto/disk=/dev/sda netcfg/get_netmask=255.255.255.0 netcfg/dhcp_failed=true"
echo "profile options = $profile_kopts"
 
cmd="cobbler profile add --name=openstack --distro=precise-x86_64 --kickstart=/etc/cobbler/preseeds/cisco-preseed --kopts=\"${profile_kopts}\" --clobber"
eval $cmd
 
 
# just adding for DNS, it cannot reinstall itself
cmd=<< EOM
    cobbler system add --name=cvf2-server-b1 \
    --mac-address=90:e2:ba:0d:28:08 \
    --ip-address=2.2.1.254 \
    --dns-name=cvf2-server-b1.local.lab \
    --profile=openstack \
    --power-type=ipmitool \
    --power-user=administrator \
    --power-pass=password \
    --power-address=cvf2-server-b1-cimc.cisco.com \
    --netboot-enabled=0
    --kopts='netcfg/get_ipaddress=2.6.1.254' \
    --clobber
EOM
eval $cmd
 
cmd=<< EOM
    cobbler system add --name=control01 \
    --mac-address=90:e2:ba:0f:6c:ec \
    --ip-address=2.2.1.2 \
    --dns-name=control01.local.lab \
    --profile=openstack \
    --power-type=ipmitool \
    --power-user=admin \
    --power-pass=password \
    --power-address=cvf2-server-b2-cimc.cisco.com \
    --netboot-enabled=0 \
    --kopts='netcfg/get_ipaddress=2.2.1.2' \
    --clobber
EOM
eval $cmd
 
cobbler sync
