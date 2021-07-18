# Specifics to Cover

## Server Hardening

- Adding `sudo` users

  ```bash
  adduser dani
  usermod -aG sudo dani
  ```

- `/etc/ssh/sshd_config` modifications to harden SSH
- `ufw`
- `fail2ban`

## SSH

### Using Your Public Key

```bash
$ ssh-copy-id -i ~/.ssh/id_rsa.pub -p 22 root@ssh.rainbowco.in

/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/Users/droxey/.ssh/id_rsa.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
root@ssh.rainbowco.in's password:

Number of key(s) added:        1

Now try logging into the machine, with:   "ssh -p '22' 'root@ssh.rainbowco.in'"
and check to make sure that only the key(s) you wanted were added.
```

## Fields of Cybersecurity

- penetration testing - white hat, consensual hacking
- incident response - recovery
- breach detection - knowing when you're attacked/being attacked
- digital forensics - logs and breadcrumbs
- digital anti-forensics - not leaving a trace
