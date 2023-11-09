FROM amazonlinux:2

# Set up environment variables for NVM and Node.js
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 16

# Install system dependencies required by AWS Amplify, Node.js, and Playwright
RUN yum update -y && \
    yum install -y curl git openssl tar gzip openssh-clients which && \
    yum clean all && rm -rf /var/cache/yum

# Install NVM and Node.js
RUN mkdir -p $NVM_DIR && \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash && \
    echo ". $NVM_DIR/nvm.sh" >> $HOME/.bashrc && \
    . $NVM_DIR/nvm.sh && \
    nvm install $NODE_VERSION && nvm use $NODE_VERSION && nvm alias default $NODE_VERSION

# Add NVM to PATH directly (these commands will be in effect for all interactive bash sessions)
RUN echo 'export NVM_DIR="$NVM_DIR"' >> $HOME/.bashrc && \
    echo 'export PATH="$NVM_DIR/versions/node/$(nvm version)/bin:$PATH"' >> $HOME/.bashrc

# Install AWS Amplify CLI and Playwright
RUN . $NVM_DIR/nvm.sh && npm install -g @aws-amplify/cli && \
    npm install -g playwright && \
    npx playwright install

# Set a working directory for the application
WORKDIR /app

# Modify the ENTRYPOINT command to source NVM and provide a fallback to bash if no command is specified
ENTRYPOINT [ "/bin/bash", "--login", "-c" ]
