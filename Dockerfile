# Copyright (c) 2023 LG Electronics Inc.
# SPDX-License-Identifier: MIT

FROM ubuntu:20.04 AS builder

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get clean
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    g++-multilib-arm-linux-gnueabi \
    gcc-arm-none-eabi \
    gcc-multilib-arm-linux-gnueabi \
    libstdc++-arm-none-eabi-newlib \
    qemu-system-arm \
    tzdata

FROM ubuntu:20.04

COPY --from=builder /usr /usr

ENV TZ=Asia/Seoul

CMD ["bin/bash"]
