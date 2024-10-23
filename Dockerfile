# Use the latest Eclipse Temurin image for JDK 23 (Java Development Kit)
FROM eclipse-temurin:23-noble

# Update package list and install Python, Node.js, and Vim
RUN apt-get update && \
    apt-get install -y vim python3 python3-pip curl && \
    apt-get clean

# Install Node.js and npm (for JavaScript support)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Set the working directory
WORKDIR /usr/src/app

# Default command (bash, can be overridden when running the container)
CMD ["bash"]
