# Copyright (c) 2023 LG Electronics Inc.
# SPDX-License-Identifier: MIT

FROM ubuntu:20.04 AS builder

ARG DEBIAN_FRONTEND=noninteractive

COPY resources/ /tmp/

RUN apt-get clean
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    qemu-system-arm \
    tzdata
RUN tar -xjf /tmp/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2 -C /usr --strip=1

FROM ubuntu:20.04

COPY --from=builder /usr /usr

ENV TZ=Asia/Seoul

CMD ["bin/bash"]
