FROM gitpod/workspace-full

# Install necessary dependencies (if not already installed)
RUN sudo apt-get update && sudo apt-get install -y curl

# RUN curl -sSL https://github.com/devcontainers/features/blob/main/src/aws-cli/install.sh
