docker run -dit --name centos --privileged -p 2222:22 -v /sys/fs/cgroup:/sys/fs/cgroup centos:7.7.1908 /usr/sbin/init
