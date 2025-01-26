#!/bin/sh

CDEBUG=${CDEBUG:=0}


test "$CDEBUG" -ge 10 && set -xv

# To have a means to run a container in case the function implemented returns immediately:
# Set DCDEBUG >=1 and CSLEEP_SEC to the seconds to keep the the continer up.
test -n "$CSLEEP_SEC" && { test "$CDEBUG" -ge 1 &&  sleep "$CSLEEP_SEC"; }



#############################################################################
#
#  set defaults
#


set_defaults ()

{

    [ "$CDEBUG" -ge 2 ] && echo "DEBUG2: Entering function \"set_defaults\". "


    [ "$CDEBUG" -ge 2 ] && echo "DEBUG2: Leaving function \"set_defaults\". "

}


#############################################################################
#
#  check environment
#


check_env ()

{

    [ "$CDEBUG" -ge 2 ] && echo "DEBUG2: Entering function \"check_env\". "


    [ "$CDEBUG" -ge 2 ] && echo "DEBUG2: Leaving function \"check_env\". "

}


#############################################################################
#
#  run pre-scripts
#


run_pre ()

{

    [ "$CDEBUG" -ge 2 ] && echo "DEBUG2: Entering function \"run_pre\". "


    [ "$CDEBUG" -ge 2 ] && echo "DEBUG2: Leaving function \"run_pre\". "

}



#############################################################################
#
#  run restic backup
#


run_restic_backup ()

{

    [ "$CDEBUG" -ge 2 ] && echo "DEBUG2: Entering function \"run_restic_backup\". "


    [ "$CDEBUG" -ge 2 ] && echo "DEBUG2: Leaving function \"run_restic_backup\". "

}



#############################################################################
#
#  run post-scripts
#


run_post ()

{

    [ "$CDEBUG" -ge 2 ] && echo "DEBUG2: Entering function \"run_post\". "


    [ "$CDEBUG" -ge 2 ] && echo "DEBUG2: Leaving function \"run_post\". "

}


#############################################################################
#
#  main
#

set_defaults

check_env

run_pre

run_restic_backup

run_post

