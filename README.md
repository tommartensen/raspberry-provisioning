# Raspberry Provisioning

This repository sets up development tools and runtimes on my Raspberry Pi running Ubuntu Server 20.04 LTS.

## Initial setup

1. Plug the Raspberry to give power, connect monitor and keyboard.
1. Follow the initial password change procedure for the default `ubuntu` user.
1. Run this command to install the latest security updates, create a user (pass the `username` to the script) and set the `hostname`.

```bash
curl --silent https://raw.githubusercontent.com/tommartensen/raspberry-provisioning/master/provision.sh | sh <username> <hostname>
```

1. Finally, the Raspberry will reboot and you can connect from your workstation as follows:

```bash
ssh <username>@<external IP from previous output>
```

1. The default password is `Toor1234` and you will be asked to change that immediately.
