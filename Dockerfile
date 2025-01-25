FROM alpine:latest

#########################################################################
#
# The Basics
#


LABEL version=0.1.0 \
      version=dev

CMD apk update; apk --no-cache upgrade

CMD mkdir -p /backup/etc/restic; mkdir -p /backup/BACKUP; mkdir -p /backup/MOUNTS mkdir -p /backup/RUN/local.d
WORKDIR /backup/RUN



#########################################################################
#
# restic
#


CMD mkdir /opt/restic

# Install local restic version to make sure we have "restic self-update" available.
# alpine apk version does not provide self-update!
COPY bin/restic /opt/restic/.

## update erstic
CMD cd /opt/restic ; ./restic self-update

ENV PATH=$PATH:/opt/restic



#########################################################################
#
# Container Function Script
#


COPY RUN /backup/RUN
# ENTRYPOINT [ "/bin/sh" , "-c /backup/RUN/container-backup.sh" ]
ENTRYPOINT /bin/sh -c /backup/RUN/container-backup.sh




#########################################################################
#
# application centric stuff
#

# put your stuff here....

