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

emerge -uND app-portage/gentoolkit app-portage/eix app-portage/pfl app-portage/genlop app-portage/elogv sys-apps/pciutils sys-apps/usbutils sys-process/htop sys-process/iotop net-analyzer/net-top app-text/wgetpaste net-irc/weechat


