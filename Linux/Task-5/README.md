# SSH Key Generation and Configuration

## Objective
Generate public and private SSH keys and enable key-based SSH access from your machine to another VM. Configure SSH so that you can run the command `ssh ivolve` without specifying the username, IP address, or key.

---

## Steps

### 1. Generate SSH Keys
Run the following command to generate a public-private key pair:
```bash
ssh-keygen -t rsa -b 4096
```

### 2. Copy the Public Key to the Remote VM
```bash
ssh-copy-id user@remote_vm_ip
```

### 3. Configure SSH for Key-Based Access
On the remote server, change the SSH service configuration:
```bash
sudo vim /etc/ssh/sshd_config
```
Uncomment or add the following lines:
```bash
PubkeyAuthentication yes
AuthorizedKeysFile .ssh/authorized_keys
```
Restart the SSH server:
```bash
sudo systemctl restart sshd
```

### 4. Create an SSH Config File for Simplified Access
On your local machine, create or edit the SSH config file:
```bash
vim ~/.ssh/config
```
Add the following entry:
```
Host ivolve
    HostName <remote_vm_ip>
    User <user>
    IdentityFile ~/.ssh/id_rsa
```

### 5. Test the Connection
Run:
```bash
ssh ivolve
```
If configured correctly, it should log in without requiring a password.

