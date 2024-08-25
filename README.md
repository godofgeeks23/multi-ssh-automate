# Multiserver SSH Automation

A quick bash script to automate the process of connecting to multiple servers via SSH, and executing commands on them.

Sometimes you need to connect to multiple servers and execute the same command on all of them. This script will help you do that.
I know there are other tools like Ansible, but this is a quick and dirty way to do it.

## Usage

1. Clone the repository
2. Add your servers to the `sample.env` file
3. Rename `sample.env` to `.env`
4. Edit `automator.sh` and add your commands to run on the servers
5. Run the script