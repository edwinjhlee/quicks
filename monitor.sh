#! /bin/bash

# bash -c "while true; do sleep 1s; if redis-cli get restart | grep -q 1; then redis-cli set restart 0; echo restart; exit; else echo not; fi; done"

# bash -c "source /c/ellib.sh; monitor_restart"

monitor_restart(){
  while true; do 
    sleep 1s; 
    if redis-cli get restart | grep -q 1; then 
      redis-cli set restart 0; echo restart; exit; 
    else 
      echo not; 
    fi;
  done
}

post_restart(){
  redis-cli -h $1 -p ${2:-6379} psetex restart 3000 1
}

dingding(){
  wget "https://oapi.dingtalk.com/robot/send?access_token=177f6f77417d56400944ebee452bb85dcbb5aaf4c5e9c861baa92fd21676cd59" \
       --post-data='{ "msgtype":"text", "text": { "content": "'"$1"'"} }'\
       --header='Content-Type: application/json'
}

