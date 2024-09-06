# Multi-server SSH Automation

A quick bash script to automate the process of connecting to multiple servers via SSH, and executing commands on them.

Sometimes you need to manually connect to multiple servers and execute the same commands on all of them. This script will help you do that.
I know there are other more powerful tools like Ansible, but this is a quick and dirty way to do it.

## Usage Instructions

1. Clone this github repo

```bash
git clone https://github.com/godofgeeks23/multi-ssh-automate.git
```

2. Add your servers and SSH credentials to the `sample.env` file
3. Rename `sample.env` file to `.env`

```bash
mv sample.env .env
```

4. Edit `automator.sh` and add your commands to run on the remote servers
5. Run the script

```bash
bash automator.sh
```

Done!

Made with ❤️ by godofgeeks23
