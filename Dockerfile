# Use the latest Eclipse Temurin image for JDK 23 (Java Development Kit)
FROM eclipse-temurin:23-noble

# Update package list and install Python, cURL and Vim
RUN apt-get update && \
    apt-get install -y vim python3 python3-pip python3-numpy curl && \
    apt-get clean

# Display Python path, pip location, and permissions
# RUN python3 --version
# RUN python3 -m pip --version
# RUN which python3
# RUN which pip3
# RUN ls -l $(which python3)
# RUN ls -l $(which pip3)

# Install Node.js and npm (for JavaScript support)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Install required packages for PyPy compatibility
RUN apt-get install -y \
    curl \
    build-essential \
    libffi-dev \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    libsqlite3-dev \
    libncurses5-dev \
    libncursesw5-dev

# Download PyPy tarball
# RUN curl -sSL https://downloads.python.org/pypy/pypy3.8-v7.3.9-linux64.tar.bz2 -o pypy.tar.bz2
RUN curl -sSL https://downloads.python.org/pypy/pypy3.10-v7.3.17-aarch64.tar.bz2 -o pypy.tar.bz2

# Extract PyPy tarball
RUN tar -xvf pypy.tar.bz2 && rm pypy.tar.bz2

# Move PyPy to /opt and create a symbolic link
# RUN mv pypy3.8-v7.3.9-linux64 /opt/pypy
RUN mv pypy3.10-v7.3.17-aarch64 /opt/pypy

RUN ln -s /opt/pypy/bin/pypy3 /usr/local/bin/pypy3

# Verify installation of PyPy
RUN /opt/pypy/bin/pypy3 -V

# Download get-pip.py script to install pip
RUN curl -sSL https://bootstrap.pypa.io/get-pip.py -o get-pip.py

# Install pip using PyPy
RUN /opt/pypy/bin/pypy3 get-pip.py && rm get-pip.py

# Install NumPy using PyPy’s pip
RUN /opt/pypy/bin/pypy3 -m pip install numpy

# Step 9: Verify installation of NumPy
RUN pypy3 -m pip show numpy

# Set the working directory
WORKDIR /usr/src/app

# Default command (bash, can be overridden when running the container)
CMD ["bash"]