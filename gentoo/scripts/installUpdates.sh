#!bin/bash

# Update world, even down to the deepest depths
time emerge -uDN --with-bdeps=y @world

# Clean out old, unused packages
time emerge --depclean

# Make sure libraries are delightfully linked
time revdep-rebuild 
time emerge @preserved-rebuild

# Have perl-cleaner run 
if [ -e / ]
time perl-cleaner --all

# A way to update config files...
# dispatch-conf
# etc-config

# If you change python versions, use this command
# time python-updater