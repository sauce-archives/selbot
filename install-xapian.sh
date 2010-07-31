#!/bin/bash

if [ $UID != 0 ]; then
    echo "error: you need to be root to do that"
    exit 1
fi

aptitude install xapian-omega
aptitude install xapian-tools
