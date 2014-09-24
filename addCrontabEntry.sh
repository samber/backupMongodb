#!/bin/sh


crontab -l -u root | echo "0 6 * * *    `pwd`/backupMongodb.sh vizir-prod" | crontab -u root -
crontab -l -u root | echo "0 6 * * *    `pwd`/backupMongodb.sh vizir-dev" | crontab -u root -


