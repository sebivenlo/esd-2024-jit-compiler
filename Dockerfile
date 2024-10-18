# Dockerfile 
# TODO merge other Dockerfiles (Python, JavaScript) into this Dockerfile, so the complete project only has 1 Dockerfile in the root directory

# Use the latest Eclipse Temurin image for JDK 23
FROM eclipse-temurin:23-noble

# Update package list and install Vim
RUN apt-get update && apt-get install -y vim && apt-get clean

# Set the working directory
WORKDIR /usr/src/app

# Default command to keep the container running (optional)
CMD ["bash"]