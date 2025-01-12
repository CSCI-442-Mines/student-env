#!/bin/bash

# Update the scripts in the scripts directory to the latest version

################################################################################
#                                  Internals                                   #
################################################################################

# Get the directory of the script
SCRIPT_DIR="$(dirname "$(readlink -f "${0}")")"

# Common functions and variables for scripts
. "${SCRIPT_DIR}/common.sh"

# Common preflight checks
preflight_checks

# Find all files in the parent directory
find "${SCRIPT_DIR}/.." -type f -exec dos2unix {} \;

echo -e "${SUCCESS} Line endings have been fixed."
