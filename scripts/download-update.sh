#!/bin/bash

# Downloads the latest version of the script

################################################################################
#                                  Internals                                   #
################################################################################

# Get the directory of the script
SCRIPT_DIR="$(dirname "$(readlink -f "${0}")")"

# Common functions and variables for scripts
. "${SCRIPT_DIR}/common.sh"

# Common preflight checks
preflight_checks skip-check-for-update

# Check that we should update the script
if ! semver_gt "${LATEST_VERSION}" "${CURRENT_VERSION}" || [ "${LATEST_VERSION}" == "${CURRENT_VERSION}" ]; then
  echo -e "${ERROR} The current version is already up to date."
  exit 1
fi

# Download the latest release zipball
curl -sSL "https://github.com/${REPOSITORY}/releases/latest/download/student-env.zip" -o /tmp/latest.zip

# Extract the latest release zipball
unzip -qo /tmp/latest.zip -d /tmp/latest

# Run the new release's apply-update script
/tmp/latest/*/*/scripts/apply-update.sh "${CURRENT_VERSION}" "${SCRIPT_DIR}"

# Print success message
echo -e "${SUCCESS} Updated from ${CURRENT_VERSION} to ${LATEST_VERSION}."
