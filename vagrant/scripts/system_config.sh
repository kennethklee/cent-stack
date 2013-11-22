#!/usr/bin/env bash

# Run the scripts in the proper, hackish order to get things working.
sudo sh ./add_users_and_groups.sh
sudo sh ./build_path_structure.sh
sudo sh ./install_subversion_modules.sh
sudo sh ./grant_permissions.sh
sudo sh ./make_symlinks.sh
