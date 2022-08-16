#!/bin/bash

aarch64=$(curl -s https://api.github.com/repos/adoptium/temurin8-binaries/releases/latest | grep -wo 'https.*' | grep -m1 'OpenJDK8U-jdk_aarch64_linux_hotspot' | sed '/^$/d' | sed 's/"//g')
ppc64el=$(curl -s https://api.github.com/repos/adoptium/temurin8-binaries/releases/latest | grep -wo 'https.*' | grep -m1 'OpenJDK8U-jdk_ppc64le_linux_hotspot' | sed '/^$/d' | sed 's/"//g')
amd64=$(curl -s https://api.github.com/repos/adoptium/temurin8-binaries/releases/latest | grep -wo 'https.*' | grep -m1 'OpenJDK8U-jdk_x64_linux_hotspot' | sed '/^$/d' | sed 's/"//g')


ARCH="$(dpkg --print-architecture)"; \
    case "${ARCH}" in \
       aarch64|arm64) \
         BINARY_URL="$aarch64"; \
         ;; \
       ppc64el|powerpc:common64) \
         BINARY_URL="$ppc64el"; \
         ;; \
       amd64|i386:x86-64) \
         BINARY_URL="$amd64"; \
         ;; \
       *) \
         echo "Unsupported arch: ${ARCH}"; \
         exit 1; \
         ;; \
    esac;

curl -LfsSo /tmp/openjdk.tar.gz ${BINARY_URL}