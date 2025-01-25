#!/bin/sh

CDEBUG=${CDEBUG:=0}


test "$CDEBUG" -ge 2 && set -xv

# To have a means to run a container in case the function implemented returns immediately:
# Set DCDEBUG >=1 and CSLEEP_SEC to the seconds to keep the the continer up.
test -n "$CSLEEP_SEC" && { test "$CDEBUG" -ge 1 &&  sleep "$CSLEEP_SEC"; }




