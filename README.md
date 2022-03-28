# solana-docker
# What is it?
A docker container with 
* NPM
* Solana
* Mocha
* Rust
* Anchor

Ports open:
* 22 for ssh
* 8899, 8900 for solana


# How to use
* Make sure docker + docker-compose are on your machine. You can get them at docker.com
* Download (and unzip) or clone this repo to your machine.
* Open a terminal in the folder where the files are.
* Type `docker-compose build` and hit enter to start the build process.
* Type `docker-compose up -d` to start running the container when it's done building.
* Use ssh to log in to the container.. `ssh sshuser@127.0.0.1`, the password is `password`
* Once in the container, type `./solana-install.sh` and enter `password` again when prompted.
* Follow any prompts and then wait until it's done.
* Type `exit` to leave the ssh session, then reconnect to begin playing with solana.
* (if you want to stop the container, type `docker-compose down` once you have exited ssh)

# Troubleshooting
### I get `-bash: ./solana-install.sh: /bin/bash^M: bad interpreter: No such file or directory` when I try to run the solana-install.sh
That's an issue with the line returns on the file.. just run this `sed -i -e 's/\r$//' solana-install.sh` to fix the file, and try again. 
