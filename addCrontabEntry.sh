#!/bin/sh


crontab -l -u root | echo "* */4 * * *    `pwd`/backupMongodb.sh vizir-prod" | crontab -u root -
#echo "0 0 1 0 0 /`pwd`/backupMongodb.sh vizir-preprod" >> /etc/crontab

