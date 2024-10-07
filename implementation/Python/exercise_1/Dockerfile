# Use an official Python image for the latest Python version
FROM python:latest

# Install PyPy
RUN apt-get update && apt-get install -y \
    pypy3 \
    vim

# Set up symbolic links for easy switching between CPython and PyPy
RUN ln -s /usr/bin/python3 /usr/bin/cpython \
    && ln -s /usr/bin/pypy3 /usr/bin/pypy

# Set the default shell to use bash
SHELL ["/bin/bash", "-c"]

# Optional: create a directory for your application
WORKDIR /app

# Optional: copy your application code
# COPY . /app

# Optional: Run an interactive terminal for quick access
CMD ["bash"]