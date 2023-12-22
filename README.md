# baremetal-test-example

This project provides a guide on running tests and obtaining code coverage data specifically for embedded systems.

## Prerequisites

You need to create a Docker image using the following command:

    $ docker build . -t baremetal-dev

Once the Docker image is created, you can run a new Docker container with the current directory mounted to the /test/ directory inside the container using the following command:

    $ docker run --rm -it -v `pwd`:/test -u `id -u`:`id -g` baremetal-dev

## How to build and run

You can build and run the baremetal application on QEMU inside the container using the following command:

    $ cd /test
    $ cmake .
    $ make run

Then, you will see the following output on screen:

```bash
Hello world!
```

To exit the QEMU system, press Ctrl + A and then X.

## References

You may find more information about baremetal application and testing on QEMU from the following links.

- https://balau82.wordpress.com/2010/02/28/hello-world-for-bare-metal-arm-using-qemu/
- https://technfoblog.wordpress.com/2016/11/05/code-coverage-using-eclipse-gnu-arm-toolchain-and-gcov-for-embedded-systems/
- https://mcuoneclipse.com/2023/11/21/gnu-coverage-gcov-for-an-embedded-target-with-vs-code/
- https://dzone.com/articles/code-coverage-embedded-target
- https://github.com/balau/arm-sandbox
- https://github.com/winksaville/baremetal-hi
- https://github.com/ahcbb6/baremetal-helloqemu

You may find more information about the ARM GNU toolchain from the following link.

- https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads

## Licenses

This project source code is available under MIT license. See [LICENSE](LICENSE).

Please refer to the individual licenses for more details on the permissions and restrictions imposed by each library.