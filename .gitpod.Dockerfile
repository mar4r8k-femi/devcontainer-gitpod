FROM ubuntu:latest

USER root

RUN apt-get update && apt-get install -y sudo curl git

RUN mkdir -p /usr/local/devcontainer-feature
COPY install_tool.sh /usr/local/devcontainer-feature/
RUN chmod +x /usr/local/devcontainer-feature/install_tool.sh


# =============================================
# INSTALL AWS CLI
RUN TOOL="aws-cli" \
    VERSION="1.0" \
    REPO_TYPE="devcontainers" \
    /usr/local/devcontainer-feature/install_tool.sh
# =============================================

# ===============================================
# INSTALL HTTP-SERVER
RUN TOOL="http-server" \
    VERSION="1.0.3" \
    REPO_TYPE="devcontainers-contrib" \
    /usr/local/devcontainer-feature/install_tool.sh
# ===============================================


USER gitpod