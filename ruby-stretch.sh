# Etape 1 - Add Stretch repository to apt for Ruby 2.3 packages
echo "deb http://archive.raspbian.org/raspbian/ stretch main" > /etc/apt/sources.list.d/stretch.list

# Etape 2 - Update the Apt index
apt-get update

# Etape 3 - Mark Apt package
apt-mark hold apt

# Etape 4 - Install packages
DEBIAN_FRONTEND=interactive apt-get install --no-install-recommends -y ruby ruby-dev curl autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev

# Etape 5 - Delete Stretch repository
rm  /etc/apt/sources.list.d/stretch.list

# Etape 6 - Install the following gems
gem install moneta --no-rdoc --no-ri --verbose
gem install net-ssh-gateway --no-rdoc --no-ri --verbose
gem install net-ssh --no-rdoc --no-ri --verbose
gem install ohai --no-rdoc --no-ri --verbose
gem install chef --no-rdoc --no-ri --verbose