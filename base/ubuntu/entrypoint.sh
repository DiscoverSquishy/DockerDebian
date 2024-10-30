#!/bin/bash

set -euo pipefail

# Set the timezone to TZ environment variable or default to UTC
export TZ="${TZ:-UTC}"

# Obtain the internal IP address
if INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2); exit}'); then
    export INTERNAL_IP
else
    echo "[Error] Unable to determine INTERNAL_IP. Defaulting to 127.0.0.1."
    export INTERNAL_IP="127.0.0.1"
fi

# Change to the working directory
if ! cd /home/container; then
    echo "[Error] Directory /home/container does not exist."
    exit 1
fi

# Function to safely substitute variables in the STARTUP command
substitute_vars() {
    local cmd="$1"
    local max_loops=10  # Prevent potential infinite loops
    local i=0

    while [[ "$cmd" =~ \{\{([A-Za-z_][A-Za-z0-9_]*)\}\} ]]; do
        if (( i++ >= max_loops )); then
            echo "[Error] Variable substitution exceeded maximum iterations."
            break
        fi
        local var_name="${BASH_REMATCH[1]}"
        local var_value="${!var_name:-}"

        # Escape special characters in the variable value
        var_value="${var_value//\\/\\\\}"
        var_value="${var_value//\`/\\\`}"
        var_value="${var_value//\"/\\\"}"
        var_value="${var_value//\$/\\\$}"

        cmd="${cmd//\{\{$var_name\}\}/$var_value}"
    done
    echo "$cmd"
}

# Substitute variables in the STARTUP command
if [[ -z "${STARTUP:-}" ]]; then
    echo "[Error] STARTUP variable is not set."
    exit 1
fi

PARSED_CMD=$(substitute_vars "$STARTUP")

# Log the parsed command
echo -e "\033[1m\033[33m[DockerImages]~ \033[0m$PARSED_CMD"

# Split the command into an array while respecting quoted strings
read -r -a CMD_ARRAY <<< "$PARSED_CMD"

# Execute the command
exec "${CMD_ARRAY[@]}"