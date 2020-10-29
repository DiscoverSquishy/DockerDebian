# ENV NODE_VERSION=12.6.0
# RUN apt install -y curl
# RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.36.0/install.sh | bash
# ENV NVM_DIR=/root/.nvm
# RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
# RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
# RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
# ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
# RUN node --version
# RUN npm --version

# NODE_VERSION=12.6.0
# apt install -y curl
# curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.36.0/install.sh | bash
# NVM_DIR=/root/.nvm
# "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
# "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
# "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
# PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
# node --version
# npm --version