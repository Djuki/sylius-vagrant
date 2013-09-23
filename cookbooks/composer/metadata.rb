name             "composer"
maintainer       "Morphodo"
maintainer_email "development@morphodo.com"
license          "MIT"
description      "Recipe to install PHP package manager"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rst'))
version          "0.2.1"

%w{ ubuntu debian centos redhat fedora }.each do |os|
	supports os
end
