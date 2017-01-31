name             'oun'
maintainer       'One University Network'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures oun'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'
depends "apt"
depends "ntp"
depends "locale"
depends "unattended_upgrades"
depends 'sysctl'
supports "ubuntu"
depends 'sensu'
depends 'oun-sensu'
