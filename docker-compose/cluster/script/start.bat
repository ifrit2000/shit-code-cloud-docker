rem  windows需要添加路由到vEthernet (Default Switch) 网卡的地址，ipconfig查看
rem route add 172.28.2.0/16 mask 255.255.255.0 192.168.240.129 -p
rem docker-compose -f compose/01_network.yml -f compose/02_consul.yml up
rem linux 添加路由sudo route add -net 172.28.2.0 netmask 255.255.255.0 gw 192.168.2.222

rem linux 打开路由转发 /etc/sysctl.conf 配置 net.ipv4.ip_forward = 1
rem sysctl -p
rem /etc/default/ufw DEFAULT_FORWARD_POLICY="ACCEPT"


for /l %%i in (1,1,3) do mkdir volume\consul\node%%i\data
for /l %%i in (1,1,6) do mkdir volume\redis\node%%i\data
mkdir volume\mysql\master
mkdir volume\mysql\slave

docker-compose -f compose/01_network.yml -f compose/02_consul.yml -f compose/04_redis.yml up

rem docker-compose -f compose/01_network.yml -f compose/04_redis.yml up