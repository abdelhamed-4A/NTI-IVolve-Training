# Ansible Installation

## Objective
Install and configure Ansible Automation Platform on control nodes, create inventories of managed hosts, and perform ad-hoc commands to check functionality.

---

## Steps to Complete the Task

### Install Ansible on Control Node (Ubuntu)
```bash
sudo apt update && sudo apt install ansible -y
```

Verify the installation:
```bash
ansible --version
which ansible
ansible-config dump
```

### Create a Common User for Ansible Activities

Create a user named `ansibleusr` and set a password:
```bash
sudo useradd -m -s /bin/bash ansibleusr
sudo passwd ansibleusr
```

### Provide Sudoer Permissions
Edit the sudoers file to grant `ansibleusr` passwordless sudo access:
```bash
sudo visudo
```

Add the following line:
```bash
ansibleusr ALL=(ALL) NOPASSWD: ALL
```

Switch to the `ansibleusr` user:
```bash
su - ansibleusr
```

### Enable SSH Connection Across the Instances
Edit the SSH configuration file:
```bash
sudo vim /etc/ssh/sshd_config
```

Ensure the following line is set:
```bash
PasswordAuthentication yes
```

Restart the SSH service:
```bash
sudo systemctl restart sshd
```

### Create the Common User on Managed Nodes
Repeat the user creation and configuration steps on all managed nodes:
```bash
sudo useradd -m -s /bin/bash ansibleusr
sudo passwd ansibleusr
sudo visudo
```

Add the same sudo permission:
```bash
ansibleusr ALL=(ALL) NOPASSWD: ALL
```

Enable SSH access:
```bash
sudo vim /etc/ssh/sshd_config
```
Ensure the line:
```bash
PasswordAuthentication yes
```

Restart SSH:
```bash
sudo systemctl restart sshd
```

### Configure Password-less Authentication
Perform this step on the control node as `ansibleusr`.

Generate an SSH key pair:
```bash
ssh-keygen -t rsa
```

Copy the public key to all managed nodes:
```bash
ssh-copy-id ansibleusr@Managed-node-1
ssh-copy-id ansibleusr@Managed-node-2
ssh-copy-id ansibleusr@Managed-node-3
```

Verify password-less authentication:
```bash
ssh Managed-node-IP
```

### Configure Ansible Inventory
By default, Ansible creates three important files in `/etc/ansible/`:
1. `ansible.cfg`
2. `hosts`
3. `roles/`

Edit the hosts file to define managed nodes and groups:
```bash
sudo vim /etc/ansible/hosts
```
Example inventory file:
```ini
[webservers]
web1 ansible_host=192.168.1.10
web2 ansible_host=192.168.1.11

dbservers
db1 ansible_host=192.168.1.20
```

### Verify Ansible Configuration

List all managed hosts:
```bash
ansible all --list-hosts
```

Ping all nodes:
```bash
ansible all -m ping -v
```

Ping specific groups:
```bash
ansible webservers -m ping
```

This ensures Ansible is installed and functioning correctly across your nodes.

