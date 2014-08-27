#!/bin/bash
# Initial creation on May 5th, 2014 by Matthew Marchese
# This rsync script is used to sync Gentoo distfiles and the Portage tree to a local mirror.
# Todo: add binary package support

echo ""
echo "Updating the local repository of distfiles..."
echo ""
sleep 3
rsync --verbose --progress --stats --recursive --times --perms rsync://rsync.gtlib.gatech.edu/gentoo/distfiles/ /mirror/distfiles 

echo ""
echo "Updating this machine's Portage tree..."
echo ""
sleep 3
emerge --sync

echo ""
echo "Syncing this machine's Portage tree to the mirror..."
echo ""
sleep 3
rsync --verbose --progress --stats --recursive --exclude "distfiles/" --times --perms /usr/portage/ /mirror/portage-tree

echo ""
echo "Finished updating."
echo ""

# Enable the commands below and run this script to update our internal distfiles
# rsync --verbose --progress --stats --resursive --times --perms /mirror/portage-tree /mirror/portage-tree-internal
# rsync --verbose --progress --stats --recursive --times --perms /mirror/distfiles/ /mirror/distfiles-internal


