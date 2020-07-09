#!/bin/sh
usage() {
  echo "It takes two arguments to run.
  First argument: Monitored file name
  Second argument: command executed when the monitored file is updated
  ex: ./entrypoint.sh a.cpp 'g++ a.cpp && ./a.cpp'"
}
update() {
  if [ -e $1 ]; then
    echo `openssl sha256 -r $1 | awk '{print $1}'`
  fi
}
if [ $# -ne 2 ];
then
  usage
  exit 1
fi

# Monitoring interval, specified in seconds
INTERVAL=1
no=0
last=`update $1`
while true;
do
  sleep $INTERVAL
  current=`update $1`
  if [ "$last" != "$current" ];
  then
    nowdate=`date '+%Y/%m/%d'`
    nowtime=`date '+%H:%M:%S'`
    echo "no:$no\tdate:$nowdate\ttime:$nowtime\tfile:$1"
    eval $2
    last=$current
    no=`expr $no + 1`
  fi
done