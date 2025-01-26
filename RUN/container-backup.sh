#!/bin/sh

# set CDEBUG to negative values silences all messsages, including warnings and infos
CDEBUG=${CDEBUG:=0}


[ "$CDEBUG" -ge 11 ] && set -xv



#############################################################################
#
#  set defaults
#


set_defaults ()

{

    [ "$CDEBUG" -ge 2 ] && echo "DEBUG2: Entering function \"set_defaults\". "


    DFLT_BASEDIR="/backup"

    DFLT_RUNDIR="RUN"
    DFLT_CONFDIR="etc"
    DFLT_BACKUPDIR="BACKUP"
    DFLT_MOUNTSDIR="MOUNTS"
    
    DFLT_CONF_RESTICDIR="restic"
    DFLT_RUN_LOCALDDIR="local.d"
    
    DFLT_RUN_LOCALD_PREDIR="pre"
    DFLT_RUN_LOCALD_POSTDIR="post"


    [ "$CDEBUG" -ge 2 ] && echo "DEBUG2: Leaving function \"set_defaults\". "

}


#############################################################################
#
#  set environment
#


set_environment ()

{

    [ "$CDEBUG" -ge 2 ] && echo "DEBUG2: Entering function \"check_env\". "


    #########################################################################
    # set variables

    ## inside top-dir
    BASEDIR=${BASEDIR:="$DFLT_BASEDIR"}
    [ "$CDEBUG" -ge 10 ] && echo "DEBUG10: Variable  \"BASEDIR\" set to >$BASEDIR<." 


    ## inside basedir
    RUNDIR=${RUNDIR:="$BASEDIR/$DFLT_RUNDIR"}
    [ "$CDEBUG" -ge 10 ] && echo "DEBUG10: Variable  \"RUNDIR\" set to >$RUNDIR<." 

    CONFDIR=${CONFDIR:="$BASEDIR/$DFLT_CONFDIR"}
    [ "$CDEBUG" -ge 10 ] && echo "DEBUG10: Variable  \"CONFDIR\" set to >$CONFDIR<." 

    BACKUPDIR=${BACKUPDIR:="$BASEDIR/$DFLT_BACKUPDIR"}
    [ "$CDEBUG" -ge 10 ] && echo "DEBUG10: Variable  \"BACKUPDIR\" set to >$BACKUPDIR<." 

    MOUNTSDIR=${MOUNTSDIR:="$BASEDIR/$DFLT_MOUNTSDIR"}
    [ "$CDEBUG" -ge 10 ] && echo "DEBUG10: Variable  \"MOUNTSDIR\" set to >$MOUNTSDIR<." 

    ## inside conf-dir
    CONF_RESTICDIR=${CONF_RESTICDIR:="$CONFDIR/$DFLT_CONF_RESTICDIR"}
    [ "$CDEBUG" -ge 10 ] && echo "DEBUG10: Variable  \"CONF_RESTICDIR\" set to >$CONF_RESTICDIR<." 

    ## inside run-dir
    RUN_LOCALDDIR=${RUN_LOCALDDIR:="$RUNDIR/$DFLT_RUN_LOCALDDIR"}
    [ "$CDEBUG" -ge 10 ] && echo "DEBUG10: Variable  \"RUN_LOCALDDIR\" set to >$RUN_LOCALDDIR<." 

    
    ## inside run-locald-dir
    RUN_LOCALD_PREDIR=${RUN_LOCALD_PREDIR:="$RUN_LOCALDDIR/$DFLT_RUN_LOCALD_PREDIR"}
    [ "$CDEBUG" -ge 10 ] && echo "DEBUG10: Variable  \"RUN_LOCALD_PREDIR\" set to >$RUN_LOCALD_PREDIR<." 

    RUN_LOCALD_POSTDIR=${RUN_LOCALD_POSTDIR:="$RUN_LOCALDDIR/$DFLT_RUN_LOCALD_POSTDIR"}
    [ "$CDEBUG" -ge 10 ] && echo "DEBUG10: Variable  \"RUN_LOCALD_POSTDIR\" set to >$RUN_LOCALD_POSTDIR<." 




    [ "$CDEBUG" -ge 2 ] && echo "DEBUG2: Leaving function \"check_env\". "

}


#############################################################################
#
#  check environment
#


check_environment ()

{

    [ "$CDEBUG" -ge 2 ] && echo "DEBUG2: Entering function \"check_env\". "


    #########################################################################
    # check for run-parts
    CMD_RUN_PARTS=$(which run-parts)
    [ -z "$CMD_RUN_PARTS" ] && [ "$CDEBUG" -ge 0 ] && echo "WARNING: executabel \"run-parts\" could not be found. Not running any pre- or post-scripts.";  


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

set_environment

check_environment

run_pre

run_restic_backup

run_post



# To have a means to run a container in case the function implemented returns immediately,
# or to inspect the environment after script execution, e.g for debugging purposes:
# Set DCDEBUG >=1 and CSLEEP_SEC to the seconds to keep the the continer up.
test -n "$CSLEEP_SEC" && { test "$CDEBUG" -ge 1 &&  sleep "$CSLEEP_SEC"; }