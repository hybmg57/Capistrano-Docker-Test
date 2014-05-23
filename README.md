# Capistrano Vagrant Docker integration test
> This repository is intended to test Capistrano integration with SAS on Docker containers running on Vagrant virtual machine (Ubuntu 12.04 precise 64 bit)

## Introduction
[Capistrano](http://capistranorb.com) is a remote server automation tool. It supports the scripting and execution of arbitrary tasks, and includes a set of sane-default deployment workflows.

Capistrano can be used to:

* Reliably deploy web application to any number of machines simultaneously, in sequence or as a rolling set
* To automate audits of any number of machines (checking login logs, enumerating uptimes, and/or applying security patches)
* To script arbitrary workflows over SSH
* To automate common tasks in software teams.
* To drive infrastructure provisioning tools such as chef-solo, Ansible or similar.

Capistrano is also very scriptable, and can be integrated with any other Ruby software to form part of a larger tool.

## Installations
### Installing Vagrant
You need [Vagrant](http://www.vagrantup.com/downloads.html) with [Oracle VirtualBox](https://www.virtualbox.org/wiki/Downloads)

### Installing Docker
Use `docker.sh` to get the latest stable version

### Capistrano
Use `capistrano.sh` to install latest stable rvm version on the host server. 
* RVM installs Ruby 2.1
* Uses this Ruby version
* Does `bundle install` to install gems `capistrano` and `capistrano-notifier` from RubyGems.org 

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


## Feature Comparison
| | PUPPET | CAPISTRANO |
| ---------------------- | --------------- | ---- |
| Configuration language | "Meta" language | Ruby |
| noop mode | yes | yes (since 2.5) |
| Idempotence | yes | no |
| Transactions | yes | yes |
| Rollback | no | yes |
| Ad-hoc server monitoring | no | yes |
| Mode of operation | deamon pulls config | user pushes changes |
| Dependency definition | Dependency trees with services, packages, and files | Single dependencies for dir, writability, command, gem and regex match |
| Dependency resolution | automatically | manually |

## Conclusion
Puppet and Capistrano can play nicely together. 
Puppet is more for environment provisioning for expressing infrastructure.
Capistrano is more for application code management.