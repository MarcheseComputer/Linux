#!bin/bash

# 
time emerge -uDN --with-bdeps=y @world

# 
emerge --depclean

# Make sure libraries are delightful
time revdep-rebuild 
time emerge @preserved-rebuild
# 
if [ -e / ]
time perl-cleaner all

# A way to update config files...
# dispatch-conf
# etc-config

# 
time python-updater