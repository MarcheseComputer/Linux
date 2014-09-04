#!/bin/bash
# Initial creation on May 5th, 2014 by Matthew Marchese
# This rsync script is used to sync Gentoo distfiles and the Portage tree to a local mirror.
# Todo: add binary package (buildpkg) support

echo -e "Updating the local repository of distfiles...\n"
rsync --verbose --progress --stats --recursive --times --perms rsync://rsync.gtlib.gatech.edu/gentoo/distfiles/ /mirror/distfiles

echo -e "Updating this machine's Portage tree along with any layman packages...\n"
eix-sync

echo -e "Syncing this machine's Portage tree to the local mirror location...\n"
sleep 3
rsync --recursive --links --safe-links --perms --times --omit-dir-times --compress --force --whole-file --delete --stats --human-readable --timeout=180 --exclude=/distfiles --exclude=/local --exclude=/packages --verbose /usr/portage/ /mirror/portage-tree

# Enable the commands below and run this script to update our internal distfiles
# rsync --verbose --progress --stats --resursive --times --perms /mirror/portage-tree /mirror/portage-tree-internal
# rsync --verbose --progress --stats --recursive --times --perms /mirror/distfiles/ /mirror/distfiles-internal


