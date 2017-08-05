#!/bin/sh
echo "Copy bash script"
scp ./deploy_host.sh $DEPLOY_USER:$DEPLOY_PASS@$DEPLOY_HOST:/root/deploy_host.sh
echo "Run bash script"
ssh $DEPLOY_USER@$DEPLOY_HOST  '/bin/sh /root/deploy_host.sh  $DOCKER_EMAIL $DOCKER_USER $DOCKER_PASS'
sleep 10
