FROM mcr.microsoft.com/playwright:focal

# Install system dependencies required by Playwright
RUN apt-get update && apt-get install -y \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdrm2 \
    libxcb1 \
    libxkbcommon0 \
    libatspi2.0-0 \
    libx11-6 \
    libxcomposite1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxrandr2 \
    libgbm1 \
    libpango-1.0-0 \
    libcairo2 \
    libasound2

RUN npm install -g npm@10.2.3

# Set up the working directory
WORKDIR /app

# Set a working directory for the application
WORKDIR /app

# Modify the ENTRYPOINT command to source NVM and provide a fallback to bash if no command is specified
ENTRYPOINT [ "/bin/bash", "--login", "-c" ]
