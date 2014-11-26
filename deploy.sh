#!/bin/bash

DESTINATION="/Applications/MAMP/htdocs/test/test_deploy/"
ERROR="Deploy called with incorrect parameters. Try again."

if [ $# -eq 0 ]
    then
        echo $ERROR;
elif [ $1 == "test" ]
    then
        echo "Performing test dry-run"
        rsync --dry-run -a --force --delete --progress --exclude-from=deploy_exclude ../ $DESTINATION
elif [ $1 == "live" ]
    then
        echo "Backing up production..."
        tar -cvf ./deploy_backup.tar $DESTINATION
        echo "Performing production deployment"
        rsync -a --force --delete --progress --exclude-from=deploy_exclude ../ $DESTINATION
    else
        echo $ERROR;
fi
