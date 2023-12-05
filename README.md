# baremetal-test-example

This project aims to provide a guide on running tests and obtaining code coverage data specifically for embedded systems.

## Prerequisite

To build and run this example, you need to create a docker image using the following command:

    $ docker build . -t baremetal-dev

Once the docker image is created, you can run a new docker container with the current directory mounted to the /test directory inside the container using the following command:

    $ docker run --rm -it -v `pwd`:/test baremetal-dev
