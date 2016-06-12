### raspbian_bootstrap ###

### install chef-client on raspberry pi (raspbian).  

Chef doesn't offer a omnibus chef-client for raspberry pi yet. This bootstrap script helps get around that by using ruby2.3 from Stretch and gem installing chef-client onto the node.  

Before you start check the following:
* your chef workstation environment is setup and ready with knife
* your pi is on the network and you can login as root

This script has been tested against raspbian-jessie but should likely work gracefully for other linux systems.

## installation ##

    knife bootstrap -t raspbian-jessie-gems.erb -x root address_of_your_pi

Or to sudo in via pi user if you don't have root access (I set up my ssh keys first)

    knife bootstrap -t raspbian-jessie-gems.erb --ssh-user pi --sudo address_of_your_pi

A full on example of one that applies  What I personally will be doing later for new Pi's is applying my [d-base](https://github.com/dayne/d-base) cookbook as part of default run list.

    knife bootstrap -t raspbian-jessie-gems.erb --ssh-user pi --ssh-password '{{password}}' --sudo --node-name NODE_NAME_YOU_WANT --run-list 'recipe[d-base::default]'

## Ramifications of using this script ##

* pi's clock will be synchronized and pi running [ntpd](http://doc.ntp.org/4.1.0/ntpd.htm) (network time protocol daemon).
* `/usr/local/bin/chef-client` to run chef-client with right path for chef & ruby.

# Credits and Contributors

* @tinoschroeter : [Tino Schröter](https://github.com/tinoschroeter/raspbian_bootstrap) as original author
* @dayne : [dayne](http://dayne.broderson.org) updated and evolved to support Chef 12
* @in-bto : [ino-bto](https://github.com/ino-bto) for [trusted certs forwarding to client node](https://github.com/dayne/raspbian_bootstrap/pull/1)
* @Edubits: [Edubits](https://github.com/Edubits) updated to Jessie