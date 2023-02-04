#!/bin/bash
JAVA_VERSION=${1}
ARCH=$(dpkg --print-architecture)

output(){
  echo -e '\e[95m'"$1"'\e[0m'
}

bad_output(){
  echo -e '\e[91m'"$1"'\e[0m'
}

api_response=$(curl -s "https://api.github.com/repos/adoptium/temurin$JAVA_VERSION-binaries/releases/latest")

declare -A ARCHITECTURES
ARCHITECTURES=(
  [aarch64]=$(echo "$api_response" | grep -wo 'https.*' | grep -m1 "OpenJDK""$JAVA_VERSION""U-jdk_aarch64_linux_hotspot" | sed 's/.$//')
  [arm]=$(echo "$api_response" | grep -wo 'https.*' | grep -m1 "OpenJDK""$JAVA_VERSION""U-jdk_arm_linux_hotspot" | sed 's/.$//')
  [ppc64el]=$(echo "$api_response" | grep -wo 'https.*' | grep -m1 "OpenJDK""$JAVA_VERSION""U-jdk_ppc64le_linux_hotspot" | sed 's/.$//')
  [s390x]=$(echo "$api_response" | grep -wo 'https.*' | grep -m1 "OpenJDK""$JAVA_VERSION""U-jdk_s390x_linux_hotspot" | sed 's/.$//')
  [amd64]=$(echo "$api_response" | grep -wo 'https.*' | grep -m1 "OpenJDK""$JAVA_VERSION""U-jdk_x64_linux_hotspot" | sed 's/.$//')
)

BINARY_URL=${ARCHITECTURES[$ARCH]}
if [ -z "$BINARY_URL" ]; then
  bad_output "Unsupported Architecture..."
  exit 1
else
  output "$ARCH detected...\n"
fi

curl -LfsSo /tmp/openjdk.tar.gz "$BINARY_URL"
output "Eclipse-Temurin $JAVA_VERSION downloaded!\n"
output "Thanks for using me!"