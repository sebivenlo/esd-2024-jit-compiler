# Start with a JDK + Python (CPython) base image
FROM adoptopenjdk:11-jre-hotspot-bionic

# Install PyPy, curl, vim, Node.js 18, and npm
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        pypy3 \
        build-essential \
        curl \
        vim \
        python3-pip && \
    # Install Node.js 18 and npm
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    # Install numpy for both PyPy and CPython
    pypy3 -m ensurepip && \
    pypy3 -m pip install numpy && \
    python3 -m pip install numpy && \
    # Clean up
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set default working directory
WORKDIR /workspace

# Default command to start a shell for interactive use
# CMD ["/bin/bash"]
CMD ["bash"]