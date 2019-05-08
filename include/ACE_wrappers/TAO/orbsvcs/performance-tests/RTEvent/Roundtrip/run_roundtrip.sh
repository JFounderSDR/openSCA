#! /bin/sh
#
# $Id: run_roundtrip.sh 14 2007-02-01 15:49:12Z mitza $
#

. parameters

for c in $NCONSUMERS; do

  date
  echo $t $c $n

  /bin/rm -f $IOR
# ssh $REMOTE_HOST "cd $REMOTE_LOCATION ; ./server -ORBSvcConf ec.locking_${t}.conf -r -o $IOR" >server.log 2>&1 </dev/null &
  ./server -ORBSvcConf roundtrip.conf -o $IOR -n 4 >server.log 2>&1 </dev/null &
  while [ ! -f $IOR ]; do
    sleep 1
  done
  ./client -d -u -h 10000 -l 10000 -i $ITERATIONS -c $c -n 0 -k file://$IOR > ec_roundtrip.$c.txt 2>&1

  wait
done
