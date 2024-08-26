#!/bin/bash
ssh -i ~/key.pem user@xx.xx.xx.xx << EOF
    echo "SSHed into the server"
    
    echo "Listing the currently running containers..."
    sudo docker ps
    logout

EOF

