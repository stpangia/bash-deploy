bash-deploy
===========

BASH deployment script 

Uses rsync and tar to deploy from staging to production on same host

## Setup

* unzip to staging webroot
* chmod +x bash-deploy/deploy.sh
* edit bash-deploy/deploy_exclude to reflect the directories and files you don't want sync'ed
* edit bash-deploy/deploy.sh to set the DESTINATION variable to your production directory 

## Usage
from webroot:

./bash-deploy/deploy.sh test
- does an rsync dry run and prints results

./bash-deploy/deploy.sh live
- tars production directory and saves it to ./bash-deploy, overwriting any previous backup
- performs rsync on root directory

