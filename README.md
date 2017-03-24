Cookbook Name
=========

This is an example Xentaurs workshop project for Chef, Vagrant, and Kitchen integration

Dependencies
----------------

* Download and install [Chef Development Kit](https://downloads.chef.io/chefdk/stable/0.19.6#mac_os_x)
* Install RVM

        \curl -sSL https://get.rvm.io | bash
* Install Ruby 2.2

        rvm install ruby-2.2
* Use RVM to use ruby 2.2

        rvm use ruby-2.2
* Install Bundle Gem

        gem install bundle
* Install Gems

        bundle install
* Install Vagrant (https://www.vagrantup.com/docs/installation/)
* Install VirtualBox (https://www.virtualbox.org/wiki/Downloads)

Rake Commands
----------------

## Rake Commands

* Run Analyze (rubocop and foodcritic)

        bundle exec rake analyze
* Run Test:Unit (unit (chefspec) tests)

        bundle exec rake test:unit
* Run Kitchen:Create (Create Vagrant Instance)

        bundle exec rake vagrant:create
* Run Kitchen:Converge (Apply Chef Recipe To Vagrant Instance)

        bundle exec rake vagrant:converge
* Run Kitchen:Login (Log Into Vagrant Instance)

        bundle exec rake vagrant:login
* Run Kitchen:Verify (Inspec)

        bundle exec rake vagrant:verify
* Run Kitchen:Destroy

        bundle exec rake vagrant:destroy

License
-------

BSD

Author Information
------------------

Brian Carpio
bcarpio@xentaurs.com
