# Capistrano Vagrant Docker integration test
> This repository is intended to test Capistrano integration with SAS on Docker containers running on Vagrant virtual machine (Ubuntu 12.04 precise) **

## Installations

### Capistrano
Use `capistrano.sh` to install latest stable rvm version on the host server. 
* RVM installs Ruby 2.1
* Uses this Ruby version
* Does `bundle install` to install gems `capistrano` and `capistrano-notifier` from RubyGems.org 

### Installing Docker
Use `docker.sh` to get the latest stable version

### Installing Vagrant
You need [Vagrant](http://www.vagrantup.com/downloads.html) with [Oracle VirtualBox](https://www.virtualbox.org/wiki/Downloads)

## Requirements

### SSH Agent forwarding
SSH Agent forwarding is a technique to facilitate deployment to a remote server by allowing to use local SSH keys instead of leaving passphrase-less keys sitting on the remote servers concerned.
Custom rake file is created `host_setup.rake` as part of the check to see if the file is setup then makes appropriate changes to allow this in currently logged in user's config level.

The setup is:
```
Host *
ForwardAgent yes
AllowAgentForwarding yes
```

### Git on remote servers
Git on both host and remote servers need to be installed. Custom rake file `check_revision.rake` is there to check if the branch you're cloning (or pulling) is matching with the remote servers that you're deploying to.
This is done prior to every deployment

### Write permissions
Custom rake task `remote.rake` includes checking of write permissions on the to be deployed remote server
This is done prior to every deployment

