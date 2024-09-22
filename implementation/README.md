
Go back - [root](../)

Notes:


why does it start slow? warming up -> show this in documentation

Show a difference between a function which takes any type of object(string and/or interger)

Use JIT in the ALDA projects we did(appoinment planner, sorter, etc)



## Docker

### OpenJDK
Docker was immediately shutting down when running/starting it. The following command made it possible to keep the container up.

    docker run -it --name java_dev -v $(pwd):/usr/src/app -w /usr/src/app eclipse-temurin bash
