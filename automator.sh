#!/bin/bash

# Extract aliases and corresponding SSH commands directly from the .env file
mapfile -t servers < <(grep -oP '^[a-zA-Z0-9_-]+=".*"' .env)

for entry in "${servers[@]}"; do
    # Extract alias name and command
    alias_name=$(echo "$entry" | cut -d '=' -f 1)
    server_command=$(echo "$entry" | cut -d '"' -f 2)

    echo "SSHing into server: $alias_name..."
    echo "----------------------------------------"

    # Run the SSH command with the corresponding server - enter the commands to be executed on the server
    $server_command <<EOF
    echo "SSHed successfully into server: $alias_name"
    # Run the commands on the server
    sudo docker ps
    logout
EOF

    echo "Finished running commands on server: $alias_name"
    echo "----------------------------------------"
done
