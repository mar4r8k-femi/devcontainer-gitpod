FROM gitpod/workspace-base

# Copy the install_tool.sh script into the image
RUN sudo mkdir -p /usr/local/devcontainer-feature
COPY install_tool.sh /usr/local/devcontainer-feature/install_tool.sh
RUN sudo chmod +x /usr/local/devcontainer-feature/install_tool.sh

# =============================================
# INSTALL AWS CLI
ENV TOOL="aws-cli"
ENV VERSION="1.0.7"
ENV REPO_TYPE="devcontainers"
RUN /usr/local/devcontainer-feature/install_tool.sh
# =============================================

# ===============================================
# INSTALL HASKELL
ENV TOOL="haskell"
ENV VERSION="2.2.1"
ENV INCLUDE_HLS=true
ENV REPO_TYPE="devcontainers-contrib"
RUN /usr/local/devcontainer-feature/install_tool.sh
# ===============================================

# ===============================================
# INSTALL MYSQL
ENV TOOL="mysql-homebrew"
ENV VERSION="1.0.18"
ENV REPO_TYPE="devcontainers-contrib"
RUN /usr/local/devcontainer-feature/install_tool.sh
# ===============================================
