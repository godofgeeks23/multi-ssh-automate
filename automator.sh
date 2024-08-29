#!/bin/bash

# Extract aliases and corresponding SSH commands from the .env file
mapfile -t servers < <(grep -oP '^[a-zA-Z0-9_-]+=".*"' .env)

for entry in "${servers[@]}"; do
    # Extract alias name and command
    alias_name=$(echo "$entry" | cut -d '=' -f 1)
    server_command=$(echo "$entry" | cut -d '"' -f 2)

    echo "----------------------------------------"
    echo "SSHing into server: $alias_name..."
    echo "----------------------------------------"

    # Run the after SSH commands - enter the commands to be executed on the server
    $server_command <<EOF
    echo "SSHed successfully into server: $alias_name"
    # Run the commands on the server
    sudo docker ps
    logout
EOF

    echo "----------------------------------------"
    echo "Finished running commands on server: $alias_name"
    echo "----------------------------------------"
done
