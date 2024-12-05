#!/bin/ash
# shellcheck shell=dash
set -e

# Setting the timezone to UTC
TZ=${TZ:-UTC}
export TZ
ln -snf "/usr/share/zoneinfo/$TZ" /etc/localtime
echo "$TZ" > /etc/timezone

# Make internal Docker IP address available to processes
INTERNAL_IP=$(hostname -i)
export INTERNAL_IP

# Change directory to /home/container
cd /home/container || exit 1

# Ensure STARTUP variable is set
if [ -z "${STARTUP}" ]; then
  echo "Error: STARTUP variable is not set."
  exit 1
fi

# Parse and replace startup variables
PARSED=$(echo "${STARTUP}" | envsubst)
printf "\033[1m\033[33m[DockerImages]~ \033[0m%s\n" "$PARSED"

# Run the Server
exec /bin/ash -c "$PARSED"