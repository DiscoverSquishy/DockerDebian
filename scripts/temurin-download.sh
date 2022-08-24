#!/bin/bash

JAVA_VERSION=${1}

aarch64=$(curl -s "https://api.github.com/repos/adoptium/temurin$JAVA_VERSION-binaries/releases/latest" | grep -wo 'https.*' | grep -m1 "OpenJDK"$JAVA_VERSION"U-jdk_aarch64_linux_hotspot" | sed 's/.$//')
arm=$(curl -s "https://api.github.com/repos/adoptium/temurin$JAVA_VERSION-binaries/releases/latest" | grep -wo 'https.*' | grep -m1 "OpenJDK"$JAVA_VERSION"U-jdk_arm_linux_hotspot" | sed 's/.$//')
ppc64el=$(curl -s "https://api.github.com/repos/adoptium/temurin$JAVA_VERSION-binaries/releases/latest" | grep -wo 'https.*' | grep -m1 "OpenJDK"$JAVA_VERSION"U-jdk_ppc64le_linux_hotspot" | sed 's/.$//')
s390x=$(curl -s "https://api.github.com/repos/adoptium/temurin$JAVA_VERSION-binaries/releases/latest" | grep -wo 'https.*' | grep -m1 "OpenJDK"$JAVA_VERSION"U-jdk_s390x_linux_hotspot" | sed 's/.$//')
amd64=$(curl -s "https://api.github.com/repos/adoptium/temurin$JAVA_VERSION-binaries/releases/latest" | grep -wo 'https.*' | grep -m1 "OpenJDK"$JAVA_VERSION"U-jdk_x64_linux_hotspot" | sed 's/.$//')

ARCH="$(dpkg --print-architecture)"; \
  case "${ARCH}" in \
    aarch64|arm64) \
      BINARY_URL="$aarch64"; \
      ;; \
    armhf|arm) \
      BINARY_URL="$arm"; \
      apt-get update && \
      apt-get install -y --no-install-recommends libatomic1 && \
      rm -rf /var/lib/apt/lists/* \
      ;; \
    ppc64el|powerpc:common64) \
      BINARY_URL="$ppc64el"; \
      ;; \
    s390x|s390:64-bit) \
      BINARY_URL="$s390x"; \
      ;; \
    amd64|i386:x86-64) \
      BINARY_URL="$amd64"; \
      ;; \
  *) \
         echo "Unsupported arch: ${ARCH}"; \
         exit 1; \
         ;; \
  esac;

curl -LfsSo /tmp/openjdk.tar.gz "${BINARY_URL}"