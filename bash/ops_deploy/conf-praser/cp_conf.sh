#!/usr/bin/env bash

cd `dirname $0`
cp -v  ./templates/db/*.conf ../../build/db/etc

cp -v  ./templates/gamecenter/*.conf ../../build/gamecenter/etc

cp -v  ./templates/gateway/*.conf ../../build/gateway/etc
cp -v  ./templates/gateway/*.xml ../../build/gateway/bin/conf/

cp -v  ./templates/login/*.conf  ../../build/login/etc
cp -v  ./templates/login/*.xml  ../../build/login/bin/conf

cp -v  ./templates/nickname/*.conf ../../build/nickname/etc

cp -v  ./templates/online/*.conf ../../build/online/etc
cp -v  ./templates/online/*.xml ../../build/online/etc

cp -v  ./templates/rank/*.conf ../../build/rank/etc

cp -v  ./templates/switch/*.conf ../../build/switch/etc
cp -v  ./templates/switch/*.xml  ../../build/switch/bin/conf

cp -v  ./templates/fighting/*.conf ../../build/fighting/etc

cp -v  ./templates/battle/*.conf ../../build/battle/etc
cp -v  ./templates/battle/*.xml ../../build/battle/etc
