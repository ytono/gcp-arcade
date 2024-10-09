sudo yum -y install buildah
sudo yum -y install podman

buildah unshare

microcontainer=$(buildah from registry.hub.docker.com/keycloak/keycloak:25.0.2)
micromount=$(buildah mount $microcontainer)

yum install --installroot $micromount --releasever 9 --setopt install_weak_deps=false --nodocs -y iproute gawk
yum clean all --installroot $micromount

buildah umount $microcontainer
buildah commit $microcontainer <image>

gcloud auth print-access-token | podman login -u oauth2accesstoken --password-stdin https://us-central1-docker.pkg.dev

podman push <image>


1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 brd 127.255.255.255 scope global lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: tunl0@NONE: <NOARP> mtu 1480 qdisc noop state DOWN group default qlen 1000
    link/ipip 0.0.0.0 brd 0.0.0.0
3: ip6tnl0@NONE: <NOARP> mtu 1452 qdisc noop state DOWN group default qlen 1000
    link/tunnel6 :: brd :: permaddr 3278:c63c:fe9c::
6: ipvlan-eth0@if2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 65000 qdisc noqueue state UNKNOWN group default 
    link/ether 42:00:a9:fe:01:02 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 169.254.8.1/16 brd 169.254.255.255 scope global ipvlan-eth0
       valid_lft forever preferred_lft forever
    inet6 fddf:3978:feb1:d745::c001/64 scope global nodad 
       valid_lft forever preferred_lft forever
    inet6 fe80::4200:a900:1fe:102/64 scope link 
       valid_lft forever preferred_lft forever
7: ipvlan-eth1@if3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UNKNOWN group default 
    link/ether 42:00:4e:49:43:00 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 169.254.9.1/24 brd 169.254.9.255 scope global ipvlan-eth1
       valid_lft forever preferred_lft forever
    inet 169.254.169.1/25 brd 169.254.169.127 scope global ipvlan-eth1
       valid_lft forever preferred_lft forever
    inet6 fe80::4200:4e00:149:4300/64 scope link 
       valid_lft forever preferred_lft forever
Main:
  +-- 0.0.0.0/0 3 0 5
     |-- 0.0.0.0
        /0 universe UNICAST
     +-- 127.0.0.0/8 2 0 2
        +-- 127.0.0.0/31 1 0 0
           |-- 127.0.0.0
              /8 host LOCAL
           |-- 127.0.0.1
              /32 host LOCAL
        |-- 127.255.255.255
           /32 link BROADCAST
     +-- 169.254.0.0/16 2 0 1
        +-- 169.254.0.0/20 2 0 2
           +-- 169.254.0.0/23 2 0 2
              |-- 169.254.0.0
                 /16 universe UNICAST
              |-- 169.254.1.0
                 /24 universe UNICAST
           +-- 169.254.8.0/23 2 0 1
              |-- 169.254.8.1
                 /32 host LOCAL
              +-- 169.254.9.0/31 1 0 0
                 |-- 169.254.9.0
                    /24 universe UNICAST
                 |-- 169.254.9.1
                    /32 host LOCAL
              |-- 169.254.9.255
                 /32 link BROADCAST
        +-- 169.254.169.0/25 2 0 2
           +-- 169.254.169.0/31 1 0 0
              |-- 169.254.169.0
                 /25 universe UNICAST
              |-- 169.254.169.1
                 /32 host LOCAL
           |-- 169.254.169.127
              /32 link BROADCAST
        |-- 169.254.255.255
           /32 link BROADCAST
Local:
  +-- 0.0.0.0/0 3 0 5
     |-- 0.0.0.0
        /0 universe UNICAST
     +-- 127.0.0.0/8 2 0 2
        +-- 127.0.0.0/31 1 0 0
           |-- 127.0.0.0
              /8 host LOCAL
           |-- 127.0.0.1
              /32 host LOCAL
        |-- 127.255.255.255
           /32 link BROADCAST
     +-- 169.254.0.0/16 2 0 1
        +-- 169.254.0.0/20 2 0 2
           +-- 169.254.0.0/23 2 0 2
              |-- 169.254.0.0
                 /16 universe UNICAST
              |-- 169.254.1.0
                 /24 universe UNICAST
           +-- 169.254.8.0/23 2 0 1
              |-- 169.254.8.1
                 /32 host LOCAL
              +-- 169.254.9.0/31 1 0 0
                 |-- 169.254.9.0
                    /24 universe UNICAST
                 |-- 169.254.9.1
                    /32 host LOCAL
              |-- 169.254.9.255
                 /32 link BROADCAST
        +-- 169.254.169.0/25 2 0 2
           +-- 169.254.169.0/31 1 0 0
              |-- 169.254.169.0
                 /25 universe UNICAST
              |-- 169.254.169.1
                 /32 host LOCAL
           |-- 169.254.169.127
              /32 link BROADCAST
        |-- 169.254.255.255
           /32 link BROADCAST

