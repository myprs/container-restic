# container-restic
Container to backup containerized applications with restic.

## Abstract

## Environment Variables

There are seveal environment variables which can be used to control the behaviour of the container script. 

**CDEBUG**: Set the debug level of the container script.

**CSLEEP_SEC**: let the container wait for given amount of seconds after being finished operation. This gives the oportunity to inspect the container if container terminates immediately.  

## Examples

Running container quietly with final pause:

```podman run  -ti --rm -e CDEBUG=1 -e CSLEEP_SEC=120 container-restic:dev-latest```

Running container verbosely with final pause:

```podman run  -ti --rm -e CDEBUG=11 -e CSLEEP_SEC=120 container-restic:dev-latest```