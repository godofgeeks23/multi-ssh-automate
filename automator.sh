#!/bin/bash

# Extract aliases and corresponding SSH commands directly from the .env file
mapfile -t servers < <(grep -oP '^[a-zA-Z0-9_-]+=".*"' .env)

for entry in "${servers[@]}"; do
    # Extract alias name and command
    alias_name=$(echo "$entry" | cut -d '=' -f 1)
    server_command=$(echo "$entry" | cut -d '"' -f 2)

    echo "SSHing into $alias_name..."
    echo "----------------------------------------"

    # Run the SSH command with the corresponding server - enter the commands to be executed on the server
    $server_command <<EOF
    echo "SSHed into $alias_name"
    sudo docker ps
    logout
EOF

    echo "Finished running commands on $alias_name"
    echo "----------------------------------------"
done
