# Add Stretch repository to apt for Ruby 2.3 packages
echo "deb http://archive.raspbian.org/raspbian/ stretch main" > /etc/apt/sources.list.d/stretch.list

# Update the Apt index
apt-get update

# Remove any existing Ruby versions
apt-get purge ruby -y

# Install new packages
DEBIAN_FRONTEND=noninteractive apt-get install -y curl ruby2.3 ruby2.3-dev autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev

rm  /etc/apt/sources.list.d/stretch.list

apt-get update

# As we are using Stretch for the Ruby 2.3 packages not all dependencies can be correctly installed, force them
# apt-get -f install -y

ln -s /usr/bin/ruby2.3 /usr/local/bin/ruby
ln -s /usr/bin/gem2.3 /usr/local/bin/gem

gem install moneta --no-rdoc --no-ri --verbose
gem install net-ssh-gateway --no-rdoc --no-ri --verbose
gem install net-ssh --no-rdoc --no-ri --verbose
gem install ohai --no-rdoc --no-ri --verbose
gem install chef --no-rdoc --no-ri --verbose

