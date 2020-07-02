rem  windows需要添加路由到vEthernet (Default Switch) 网卡的地址，ipconfig查看
rem route add 172.28.0.0/16 mask 255.255.255.0 192.168.240.129 -p
rem docker-compose -f compose/01_network.yml -f compose/02_consul.yml up

for /l %%i in (1,1,3) do mkdir volume\consul\node%%i\data
for /l %%i in (1,1,6) do mkdir volume\redis\node%%i\data
mkdir volume\mysql\master
mkdir volume\mysql\slave

docker-compose -f compose/01_network.yml -f compose/02_consul.yml -f compose/04_redis.yml up

rem docker-compose -f compose/01_network.yml -f compose/04_redis.yml up