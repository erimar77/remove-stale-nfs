#!/bin/bash
  
dirs=`timeout -k 1m 30s df 2>&1 >/dev/null|awk '{ print $2 }'|cut -f1 -d\'|cut -c2-`
  
for d in $dirs; do
    echo "Cleaning: $d"
    fuser -mk $d;
    sleep 1
    umount $d;
done
