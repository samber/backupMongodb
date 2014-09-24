#!/bin/sh

ROOT_DIRECTORY="/var/backup"
DATE=`date +%Y-%m-%d:%H:%M:%S`
BACKUP_DIRECTORY="$ROOT_DIRECTORY/$DATE"
DATABASE=$1



_mongoexport () {
    tmp_file="/tmp/totoAimeLesFrites.js"
    echo "print('_ ' + db.getCollectionNames())" > $tmp_file
    cols=`mongo $DATABASE $tmp_file | grep '_' | awk '{print $2}' | tr ',' ' '`
    for c in $cols
    do
	mongoexport -d $DATABASE -c $c -o "$BACKUP_DIRECTORY/exp_${DATABASE}_${c}.json"
    done
    rm $tmp_file

    echo "MongoExport done for every collections"
}


_mongodump () {
    mongodump -d "$DATABASE" -o "BACKUP_DIRECTORY"
    echo "MongoDump done"
}


main () {
    if [ ! -d "$ROOT_DIRECTORY" ]; then
	mkdir "$ROOT_DIRECTORY"
    fi

    mkdir "$BACKUP_DIRECTORY"

#    _mongodump
    _mongoexport
}




main
