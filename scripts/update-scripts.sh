#!/bin/bash

# Fix line endings

################################################################################
#                                  Internals                                   #
################################################################################

# Get the directory of the script
SCRIPT_DIR="$(dirname "$(readlink -f "${0}")")"

# Common functions and variables for scripts
. "${SCRIPT_DIR}/common.sh"

# Common preflight checks
preflight_checks skip-check-for-update

# Check that the latest version is not the same as the current version
if [ "${LATEST_VERSION}" == "${CURRENT_VERSION}" ]; then
  echo -e "${ERROR} The latest version of the script is the same as the current version (${CURRENT_VERSION})."
  exit 1
fi

# Get the latest release zipball URL
LATEST_ZIPBALL_URL=$(curl -sS "${LATEST_URL}" | jq -r .zipball_url)

# Download the latest release zipball
curl -sSL "${LATEST_ZIPBALL_URL}" -o /tmp/latest.zip

# Extract the latest release zipball
unzip -qo /tmp/latest.zip -d /tmp/latest

# Move the latest release files to the scripts directory
mv /tmp/latest/*/* "${SCRIPT_DIR}/.."

# Clean up
rm -rf /tmp/latest /tmp/latest.zip

# Print success message
echo -e "${SUCCESS} Updated from ${CURRENT_VERSION} to ${LATEST_VERSION}."
