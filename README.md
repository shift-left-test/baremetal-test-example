# baremetal-test-example

This project provides a guide on running tests and obtaining code coverage data specifically for embedded systems.

## Prerequisites

You need to create a Docker image using the following command:

    $ docker build . -t baremetal-dev

Once the Docker image is created, you can run a new Docker container with the current directory mounted to the /test/ directory inside the container using the following command:

    $ docker run --rm -it -v `pwd`:/test -u `id -u`:`id -g` baremetal-dev

## How to build and run

You can build and run the baremetal application on QEMU using the following command:

    $ cd /test
    $ cmake .
    $ make run

Then, you will see the following output on screen:

```bash
Hello world!
```

To exit the QEMU system, press Ctrl + A and then X.

## Licenses

This project source code is available under MIT license. See [LICENSE](LICENSE).

Please refer to the individual licenses for more details on the permissions and restrictions imposed by each library.