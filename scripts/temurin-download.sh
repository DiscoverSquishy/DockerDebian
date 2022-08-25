#!/bin/bash
# Script written and maintaned by DiscoverSquishy
# https://github.com/DiscoverSquishy


JAVA_VERSION=${1}
ARCH="$(dpkg --print-architecture)"

output(){
    echo -e '\e[95m'"$1"'\e[0m';
}

bad_output(){
    echo -e '\e[91m'"$1"'\e[0m';
}

aarch64=$(curl -s "https://api.github.com/repos/adoptium/temurin$JAVA_VERSION-binaries/releases/latest" | grep -wo 'https.*' | grep -m1 "OpenJDK""$JAVA_VERSION""U-jdk_aarch64_linux_hotspot" | sed 's/.$//')
arm=$(curl -s "https://api.github.com/repos/adoptium/temurin$JAVA_VERSION-binaries/releases/latest" | grep -wo 'https.*' | grep -m1 "OpenJDK""$JAVA_VERSION""U-jdk_arm_linux_hotspot" | sed 's/.$//')
ppc64el=$(curl -s "https://api.github.com/repos/adoptium/temurin$JAVA_VERSION-binaries/releases/latest" | grep -wo 'https.*' | grep -m1 "OpenJDK""$JAVA_VERSION""U-jdk_ppc64le_linux_hotspot" | sed 's/.$//')
s390x=$(curl -s "https://api.github.com/repos/adoptium/temurin$JAVA_VERSION-binaries/releases/latest" | grep -wo 'https.*' | grep -m1 "OpenJDK""$JAVA_VERSION""U-jdk_s390x_linux_hotspot" | sed 's/.$//')
amd64=$(curl -s "https://api.github.com/repos/adoptium/temurin$JAVA_VERSION-binaries/releases/latest" | grep -wo 'https.*' | grep -m1 "OpenJDK""$JAVA_VERSION""U-jdk_x64_linux_hotspot" | sed 's/.$//')


if [ "$ARCH" = "aarch64" ] || [ "$ARCH" = "arm64" ]; then
  BINARY_URL="$aarch64"
  output "$ARCH detected...\n"
elif [ "$ARCH" = "armhf" ] || [ "$ARCH" = "arm" ]; then
  BINARY_URL="$arm"
  output "$ARCH detected...\n"
elif [ "$ARCH" = "ppc64el" ] || [ "$ARCH" = "powerpc" ] || [ "$ARCH" = "common64" ]; then
  BINARY_URL="$ppc64el"
  output "$ARCH detected...\n"
elif [ "$ARCH" = "s390x" ] || [ "$ARCH" = "s390" ] || [ "$ARCH" = "64-bit" ]; then
  BINARY_URL="$s390x"
  output "$ARCH detected...\n"
elif [ "$ARCH" = "amd64" ] || [ "$ARCH" = "i386" ] || [ "$ARCH" = "x86-64" ]; then
  BINARY_URL="$amd64"
  output "$ARCH detected...\n"
else
  bad_output "Unsupported Architecture..."
  exit 1
fi

curl -LfsSo /tmp/openjdk.tar.gz "${BINARY_URL}"
output "Eclipse-Temurin $JAVA_VERSION downloaded!\n"
output "Thanks for using me!"