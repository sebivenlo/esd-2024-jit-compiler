# Use the official Python 3.9-slim as the base image
FROM python:3.9-slim as base

# Set the working directory in the container
WORKDIR /usr/src/app

# Install dependencies for PyPy and CPython
RUN apt-get update && apt-get install -y curl build-essential

# Install PyPy
RUN curl -L https://downloads.python.org/pypy/pypy3.9-v7.3.12-linux64.tar.bz2 -o pypy.tar.bz2 && \
    tar -xjf pypy.tar.bz2 && \
    mv pypy3.9-v7.3.12-linux64 /opt/pypy && \
    ln -s /opt/pypy/bin/pypy3 /usr/local/bin/pypy3 && \
    rm pypy.tar.bz2

# Install NumPy for both CPython and PyPy
RUN pip install --no-cache-dir numpy && \
    /opt/pypy/bin/pypy3 -m ensurepip && \
    /opt/pypy/bin/pypy3 -m pip install --no-cache-dir numpy

# Copy the script to the container
COPY mandelbrot.py .

# Default command to use CPython
CMD ["python", "./mandelbrot.py"]
