# ⚙️ Ansible Installation & Configuration 🚀

## 🎯 Objective
Install and configure **Ansible Automation Platform** on a control node, set up an inventory of managed hosts, and execute ad-hoc commands to verify functionality.

---

## 🛠️ Steps to Complete the Task

### 1️⃣ Install Ansible on Control Node (Ubuntu)
```bash
sudo apt update -y
sudo apt install ansible -y
```

✅ **Verify the installation:**
```bash
ansible --version
which ansible
ansible-config dump
```

📌 **Ansible should now be installed on your control node.**

---

### 2️⃣ Create a Common User for Ansible Activities 👤

🔹 **Create a user named `ansibleusr` and set a password:**
```bash
sudo useradd -m -s /bin/bash ansibleusr
sudo passwd ansibleusr
```

🔹 **Provide Sudoer Permissions:**
```bash
sudo visudo
```
✏️ **Add the following line at the end:**
```bash
ansibleusr ALL=(ALL) NOPASSWD: ALL
```

🔹 **Switch to the `ansibleusr` user:**
```bash
su - ansibleusr
```

📌 **The user `ansibleusr` now has passwordless sudo access.**

---

### 3️⃣ Enable SSH Connection Across the Instances 🔑

🔹 **Edit the SSH configuration file:**
```bash
sudo vim /etc/ssh/sshd_config
```
✅ **Ensure the following line is set:**
```bash
PasswordAuthentication yes
```

🔹 **Restart the SSH service:**
```bash
sudo systemctl restart sshd
```

📌 **SSH is now configured for password-based authentication.**

---

### 4️⃣ Set Up Managed Nodes 🖥️
✅ **Repeat the user creation and configuration steps on all managed nodes:**
```bash
sudo useradd -m -s /bin/bash ansibleusr
sudo passwd ansibleusr
sudo visudo
```
✅ **Add the same sudo permission:**
```bash
ansibleusr ALL=(ALL) NOPASSWD: ALL
```
✅ **Enable SSH access:**
```bash
sudo vim /etc/ssh/sshd_config
```
✅ **Ensure the line:**
```bash
PasswordAuthentication yes
```
✅ **Restart SSH:**
```bash
sudo systemctl restart sshd
```

📌 **All managed nodes are now configured for Ansible access.**

---

### 5️⃣ Configure Password-less Authentication 🔐

💡 **Perform this step on the control node as `ansibleusr`.**

🔹 **Generate an SSH key pair:**
```bash
ssh-keygen -t rsa
```

🔹 **Copy the public key to all managed nodes:**
```bash
ssh-copy-id ansibleusr@Managed-node-1
ssh-copy-id ansibleusr@Managed-node-2
ssh-copy-id ansibleusr@Managed-node-3
```

🔹 **Verify password-less authentication:**
```bash
ssh Managed-node-IP
```

📌 **Now, `ansibleusr` can SSH into managed nodes without a password!**

---

### 6️⃣ Configure Ansible Inventory 📋

📌 **By default, Ansible creates three important files in `/etc/ansible/`:**
1️⃣ `ansible.cfg`  
2️⃣ `hosts` (inventory)  
3️⃣ `roles/`

🔹 **Edit the inventory file (`hosts`):**
```bash
sudo vim /etc/ansible/hosts
```
✅ **Example inventory file:**
```ini
[webservers]
web1 ansible_host=192.168.1.10
web2 ansible_host=192.168.1.11

dbservers]
db1 ansible_host=192.168.1.20
```

📌 **Managed nodes are now added to the Ansible inventory.**

---

### 7️⃣ Verify Ansible Configuration ✅

🔹 **List all managed hosts:**
```bash
ansible all --list-hosts
```

🔹 **Ping all nodes to check connectivity:**
```bash
ansible all -m ping -v
```

🔹 **Ping a specific group:**
```bash
ansible webservers -m ping
```

📌 **If the output returns `"pong"`, Ansible is successfully configured!** 🎉

---

🎉 **Your Ansible setup is complete! You can now start automating configurations and deployments across your servers.** 🚀

