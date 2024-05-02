# Copyright (c) 2023 LG Electronics Inc.
# SPDX-License-Identifier: MIT

FROM ubuntu:20.04 AS builder

ARG DEBIAN_FRONTEND=noninteractive

RUN echo "dash dash/sh boolean false" | debconf-set-selections
RUN dpkg-reconfigure dash

COPY gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2 /tmp/

RUN tar -xjf /tmp/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2 -C /usr --strip=1

RUN apt-get clean
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    dos2unix \
    python3 \
    python3-pip \
    qemu-system-arm \
    tzdata \
    xxd
RUN python3 -m pip install -U pip
RUN python3 -m pip install -U gcovr

FROM ubuntu:20.04

COPY --from=builder /usr /usr

ENV TZ=Asia/Seoul

CMD ["/bin/bash"]
