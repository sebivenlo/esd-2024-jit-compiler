# Use the latest Eclipse Temurin image for JDK 23 (Java Development Kit)
FROM eclipse-temurin:23-noble

RUN apt-get update && \
    apt-get install -y vim python3 pypy3 python3-pip python3.12-venv curl && \
    apt-get clean

# Install Node.js and npm (for JavaScript support)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Create a virtual environment
RUN python3 -m venv /opt/venv

# Activate the virtual environment and install dependencies
# Use the full path to pip in the virtual environment
RUN /opt/venv/bin/pip install --no-cache-dir llvmlite

# Set the default PATH to include the virtual environment
ENV PATH="/opt/venv/bin:$PATH"

# Set the working directory
WORKDIR /workspace

# Default command (bash, can be overridden when running the container)
CMD ["bash"]