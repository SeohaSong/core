#!/bin/bash
[[ "$PWD" =~ "$DDD_PATH" ]]

if $DDD __is-ddd__; then
    $@
else
    opt='--tty --interactive'
    $DDD docker exec $opt --workdir /home/ddd/DDD/${PWD#$DDD_PATH} ddd $@
fi
