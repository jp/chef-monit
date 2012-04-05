maintainer       "Alex Soto"
maintainer_email "apsoto@gmail.com"
license          "MIT"
description      "Configures monit.  Originally based off the 37 Signals Cookbook."
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.7"

recipe           "monit::default", "install/configure monit"
recipe           "monit::services", "configure services for monit to monitor"

%w{ ubuntu debian }.each do |os|
  supports os
end
