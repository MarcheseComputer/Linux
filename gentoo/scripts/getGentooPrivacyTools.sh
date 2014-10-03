#!/bin/bash
# This script gets all the tools that were suggested on the Gentoo wiki. I use some of them daily and most of them when setting up new systems.
# https://wiki.gentoo.org/wiki/Troubleshooting

# Check for which Linux drivers to use on these sites:
# http://kmuto.jp/debian/hcl/
# https://wikidevi.com/wiki/Main_Page

VERSION="0.1.0"

if [ `whoami` != root ]; then
echo "Please run this script as root or use sudo."
exit
fi

emerge -uND net-misc/tor 

