#!/usr/bin/env bash

# Run the scripts in the proper, hackish order to get things working.
sudo sh /vagrant/scripts/add_users_and_groups.sh
sudo sh /vagrant/scripts/build_path_structure.sh
sudo sh /vagrant/scripts/install_subversion_modules.sh
sudo sh /vagrant/scripts/grant_permissions.sh
sudo sh /vagrant/scripts/make_symlinks.sh
