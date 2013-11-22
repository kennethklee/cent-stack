#!/usr/bin/env bash

# Run the scripts in the proper, hackish order to get things working.
./add_users_and_groups.sh
./build_path_structure.sh
./install_subversion_modules.sh
./grant_permissions.sh
./make_symlinks.sh
