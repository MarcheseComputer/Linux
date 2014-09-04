#!/bin/bash
# This script pulls in Ruby dependencies and installs Jekyll for Portage-based Linux distributions. 
# This script is a work in progress.
VERSION="0"

if [ `whoami` != root ]; then
echo "Please run this script as root or using sudo or as root."
exit
fi

while [ $VERSION -lt 1 ] 
do
echo "Would you like the (1) development, (2) pre-release, or (3) normal version of Jekyll?"
echo -ne "Enter 1, 2, or 3: "
read $VERSION
done


echo "dev-ruby/rubygems ruby_targets_ruby21" >> /etc/portage/package.use
echo "dev-ruby/rake ruby_targets_ruby21" >> /etc/portage/package.use
echo "dev-ruby/rdoc ruby_targets_ruby21" >> /etc/portage/package.use
echo "dev-ruby/json ruby_targets_ruby21" >> /etc/portage/package.use
echo "dev-ruby/racc ruby_targets_ruby21" >> /etc/portage/package.use

emerge -uN  dev-lang/ruby dev-ruby/rubygems dev-ruby/bundler net-libs/nodejs 


case "${VERSION}" in
	1)
		emerge www-apps/jekyll www-apps/jekyll-coffeescript www-apps/jekyll-watch
	;;
	2)
		gem install bundle
		gem install bundler
		gem install jekyll --pre
	;;
	3)
		if [ -d ~/code ]; 
		then
			cd ~/code
		else
			mkdir -p ~/code 
			cd ~/code
		fi	
		gem install bundle
		gem install bundler
		git clone git://github.com/jekyll/jekyll.git
		cd jekyll
		script/bootstrap
		bundle exec rake build
		ls pkg/*.gem | head -n 1 | xargs gem install -l
	;;
esac

echo -n "Regenerating your profile to grant you access to your new tools."
source /etc/profile && echo "...done!"
