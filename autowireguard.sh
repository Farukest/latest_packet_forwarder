#!/bin/bash

hasFault=0

echo "Link detection..."
/usr/bin/wg | grep -q "interface: wg0"
if [ $? -ne 0 ]; then
    hasFault=1
    echo "Link down!"
else
    echo "Ok!"
fi
echo ""

echo "Ping detection..."
ping -c 1 10.66.66.1
if [ $? -ne 0 ]; then
    hasFault=1
    echo "Ping failed!"
else
    echo "Ok!"
fi
echo ""

echo "Status"
if [ $hasFault -eq 0 ]; then
    echo "Ok!"
    exit
fi

echo "Error!"
echo 'Restart...'

sudo wg-quick down wg0
sleep 5
sudo wg-quick up wg0
sleep 10
docker restart miner

# systemctl restart wg-quick@wg0.service
# systemctl --no-pager status wg-quick@wg0.service