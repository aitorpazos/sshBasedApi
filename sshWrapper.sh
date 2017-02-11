#!/bin/bash

# Enable job control
set -m

SSHD_KILL_GRACE_TIME=3
RUNNING_SSHD=""

function restartSshd() {
    echo "USR1 signal received. Restarting SSH server"
    if [ -n "$RUNNING_SSHD" ]; then
        kill $RUNNING_SSHD
        sleep $SSHD_KILL_GRACE_TIME
        kill -9 $RUNNING_SSHD 2&>1 /dev/null
    fi
    
    /usr/sbin/sshd -D -e &
    RUNNING_SSHD=$!
}

function exitWrapper() {
    echo "Quit signal received. Exiting"
    if [ -n "$RUNNING_SSHD" ]; then
        kill $RUNNING_SSHD
        sleep $SSHD_KILL_GRACE_TIME
        kill -9 $RUNNING_SSHD 2&>1 /dev/null
    fi
    
    exit 0
}

trap "restartSshd" USR1
trap "exitWrapper" SIGINT SIGTERM

/usr/sbin/sshd -D -e &
RUNNING_SSHD=$!

while true ; do
        sleep 5; # This script is not really doing anything.
done
