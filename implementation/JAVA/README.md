# Readme

## Java with VIM

Build image

    docker build -t my-temurin-vim-docker https://github.com/sebivenlo/esd-2024-jit-compiler.git#main:implementation/JAVA

Run container

    docker run -it --name java_dev_machine --mount type=bind,source="$(pwd)",target=/usr/src/app my-temurin-vim-docker bash