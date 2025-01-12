#!/bin/bash

# Common functions and variables for scripts

################################################################################
#                                  Internals                                   #
################################################################################

# ANSI color codes
GRAY="\033[0;37m"
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
RESET="\033[0m"

# Logging prefixes
DEBUG="${GRAY}[DEBUG]${RESET}"
SUCCESS="${GREEN}[SUCCESS]${RESET}"
WARNING="${YELLOW}[WARNING]${RESET}"
ERROR="${RED}[ERROR]${RESET}"

# Get the directory of the script
SCRIPT_DIR="$(dirname "$(readlink -f "${0}")")"

# The repository path on GitHub
REPOSITORY="csci-442-mines/student-env"

# Current release version
CURRENT_VERSION="v0.0.0-alpha.0"

# Latest release API URL
LATEST_URL="https://api.github.com/repos/${REPOSITORY}/releases/latest"

# Latest release version
LATEST_VERSION=$(curl -sS "${LATEST_URL}" | jq -r .tag_name)

# Common preflight checks
# Arguments:
#   - skip-check-for-update: Skip the check for a newer version of the script
# Returns:
#   None
preflight_checks() {
  # Check if the script directory is the workspace directory
  if [ "${SCRIPTS_DIR}" != "/workspace/scripts/common.sh" ]; then
      echo -e "${ERROR} This script appears to be in the wrong directory. This indicates that your student environment is misconfigured/corrupted. Please contact course staff for assistance."
      exit 1
  fi

  # Check for a newer version of the script
  if [ "${1}" == "skip-check-for-update" ] && [ "${LATEST_VERSION}" != "${CURRENT_VERSION}" ]; then
    echo -e "${WARNING} A newer version of the script is available (${CURRENT_VERSION} -> ${LATEST_VERSION}). Please run the update-scripts.sh script to update."
  fi
}
