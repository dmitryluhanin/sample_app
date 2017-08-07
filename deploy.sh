#!/bin/sh
echo "Copy bash script"
scp ./deploy_host.sh $DEPLOY_USER@$DEPLOY_HOST:/home/$DEPLOY_USER/deploy_host.sh
echo "Run bash script"
ssh $DEPLOY_USER@$DEPLOY_HOST  '/bin/sh ~/deploy_host.sh'
sleep 10
