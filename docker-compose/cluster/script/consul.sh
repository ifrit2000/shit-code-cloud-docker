#!/bin/bash

#consul的地址
CONSUL_ADDRESS="172.28.0.11:8500"

test -d logs || mkdir logs

echo "---------------" >> logs/`date +%Y%m%d`.log
# 获取当前consul中状态为critical的serviceID
CONSUL_CRITICAL=`curl -s -XGET http://${CONSUL_ADDRESS}/v1/health/state/critical | python -m json.tool | grep ServiceID | awk '{print $2}' |sed 's/"//g' | sed 's/,//g'`
for critical in ${CONSUL_CRITICAL}
do
  echo "${critical} 已删除" >> logs/`date +%Y%m%d`.log
  # 使用consul的API删除对于的serviceID
  curl -XPUT http://${CONSUL_ADDRESS}/v1/agent/service/deregister/${critical}
done