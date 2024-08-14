#!/bin/bash

set -e

# Determine the base URL based on the repo type
if [ "$REPO_TYPE" == "devcontainers" ]; then
  BASE_URL="https://raw.githubusercontent.com/devcontainers/features/main/src/${TOOL}"
elif [ "$REPO_TYPE" == "devcontainers-contrib" ]; then
  BASE_URL="https://raw.githubusercontent.com/devcontainers-contrib/features/main/src/${TOOL}"
else
  echo "Unknown repository type: $REPO_TYPE"
  exit 1
fi

# Create the directory
sudo mkdir -p /usr/local/devcontainer-feature/${TOOL}
cd /usr/local/devcontainer-feature/${TOOL}

# Download the installation script
sudo curl -sSL "${BASE_URL}/install.sh" -o /usr/local/devcontainer-feature/${TOOL}/install.sh

# Check for library_scripts.sh, download if it exists
LIBRARY_SCRIPT_URL="${BASE_URL}/library_scripts.sh"
if curl --output /dev/null --silent --head --fail "$LIBRARY_SCRIPT_URL"; then
  sudo curl -sSL "$LIBRARY_SCRIPT_URL" -o /usr/local/devcontainer-feature/${TOOL}/library_scripts.sh
  sudo chmod +x /usr/local/devcontainer-feature/${TOOL}/library_scripts.sh
fi

# Make install.sh executable
sudo chmod +x /usr/local/devcontainer-feature/${TOOL}/install.sh

# Run the installation script
sudo /usr/local/devcontainer-feature/${TOOL}/install.sh


# # Cleanup
# sudo rm -rf /usr/local/devcontainer-feature/${TOOL}
