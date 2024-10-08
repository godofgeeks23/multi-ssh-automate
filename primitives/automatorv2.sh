#!/bin/bash

# version 2 - SSH into multiple serverss

# Define the alias array corresponding to each server
aliases=(
    "server1"
    "server2"
    "server3"
    "server4"
)

# Array of SSH commands for each server
servers=(
    "ssh -i ~/key.pem user@xx.xx.xx.xx"
    "ssh -i ~/key.pem user@xx.xx.xx.xx"
    "ssh -i ~/key.pem user@xx.xx.xx.xx"
    "ssh -i ~/key.pem user@xx.xx.xx.xx"
)

for i in "${!servers[@]}"; do
    server="${servers[$i]}"
    alias="${aliases[$i]}"

    echo "SSHing into server: $alias..."
    echo "----------------------------------------"

    # Run the SSH command with the corresponding server
    $server <<EOF
    echo "SSHed into $alias"
    sudo docker ps
    logout
EOF

    echo "Finished running commands on server: $alias"
    echo "----------------------------------------"
done
