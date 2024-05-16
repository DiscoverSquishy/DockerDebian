#!/usr/bin/env sh

# Script: API-Based Temurin Download
# Author: DiscoverSquishy
# Date: 2023-05-16
# Description: Downloads the latest Temurin OpenJDK binaries based on the specified Java version and architecture.

JAVA_VERSION="$1"
ARCH="$(uname -m)"

case "$ARCH" in
aarch64|arm*|x86_64) ;;
*) printf 'Unsupported Architecture...\n' >&2; exit 1 ;;
esac

api_response=$(curl -sL "https://api.github.com/repos/adoptium/temurin${JAVA_VERSION}-binaries/releases/latest")

case "$ARCH" in
aarch64) BINARY_URL=$(echo "$api_response" | grep -o 'https://[^"]*' | grep -m1 "OpenJDK${JAVA_VERSION}U-jdk_aarch64_linux_hotspot") ;;
arm*) BINARY_URL=$(echo "$api_response" | grep -o 'https://[^"]*' | grep -m1 "OpenJDK${JAVA_VERSION}U-jdk_arm_linux_hotspot") ;;
x86_64) BINARY_URL=$(echo "$api_response" | grep -o 'https://[^"]*' | grep -m1 "OpenJDK${JAVA_VERSION}U-jdk_x64_linux_hotspot") ;;
esac

curl -fsSL -o /tmp/openjdk.tar.gz "$BINARY_URL"