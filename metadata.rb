name             "cloudfoundry"
maintainer       "Andrea Campi"
maintainer_email "andrea.campi@zephirworks.com"
license          "Apache 2.0"
description      "Installs/Configures cloudfoundry"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.3.4"

%w{ ubuntu }.each do |os|
  supports os
end

%w{ apt git logrotate rbenv }.each do |cb|
  depends cb
end
