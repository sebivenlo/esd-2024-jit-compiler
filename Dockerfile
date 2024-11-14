# Use the latest Eclipse Temurin image for JDK 23 (Java Development Kit)
FROM eclipse-temurin:23-noble

RUN apt-get update && \
    apt-get install -y vim python3 pypy3 curl && \
    apt-get clean

# Install Node.js and npm (for JavaScript support)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Set the working directory
WORKDIR /workspace

# Default command (bash, can be overridden when running the container)
CMD ["bash"]