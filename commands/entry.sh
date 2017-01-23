#!/bin/bash

COMMANDS_BASE="/root/commands/"
case "${SSH_ORIGINAL_COMMAND}" in
    help|shell|authConfig\ *|changePassword\ *|addKey\ *|rmKey\ *)
        ${COMMANDS_BASE}/${SSH_ORIGINAL_COMMAND}
        ;;
    *)
        echo "Unrecognised command: ${SSH_ORIGINAL_COMMAND}"
        ${COMMANDS_BASE}/help
        ;;
esac
exit 0
