#!/bin/bash
\curl -sSL https://get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
sudo rvm install 2.1
sudo rvm use 2.1
sudo bundle install
