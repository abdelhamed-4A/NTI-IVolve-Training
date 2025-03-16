# 🔐 SSH Key Generation & Configuration 🚀

## 🎯 Objective
Set up **passwordless SSH authentication** to securely connect to a remote VM using SSH keys. After configuration, you can simply run:
```bash
ssh ivolve
```
✅ **No need to enter a username, IP, or key!** 🔥

---

## 🛠 Steps to Complete the Task

### 1️⃣ Generate SSH Key Pair 🔑
Run the following command on your local machine:
```bash
ssh-keygen -t rsa -b 4096
```
📌 **Creates a public (`id_rsa.pub`) and private (`id_rsa`) key.**

---

### 2️⃣ Copy Public Key to the Remote VM 📤
```bash
ssh-copy-id user@remote_vm_ip
```
📌 **This securely transfers your public key to the remote machine.**

---

### 3️⃣ Enable Key-Based Authentication on Remote VM ⚙️
Edit the SSH configuration file on the **remote server**:
```bash
sudo vim /etc/ssh/sshd_config
```
✅ **Ensure these lines are present and uncommented:**
```ini
PubkeyAuthentication yes
AuthorizedKeysFile .ssh/authorized_keys
```
✅ **Restart SSH service to apply changes:**
```bash
sudo systemctl restart sshd
```
📌 **This enables SSH key authentication for secure login.**

---

### 4️⃣ Create an SSH Config File for Quick Access ⚡
On your **local machine**, configure SSH for simplified login:
```bash
vim ~/.ssh/config
```
✅ **Add the following entry:**
```ini
Host ivolve
    HostName <remote_vm_ip>
    User <user>
    IdentityFile ~/.ssh/id_rsa
```
📌 **Now you can connect with just `ssh ivolve` instead of typing the full command!**

---

### 5️⃣ Test the Connection ✅
Run:
```bash
ssh ivolve
```
📌 **If configured correctly, you'll log in without a password prompt! 🎉**

---

🎉 **SSH key authentication is now set up for seamless, secure access!** 🚀

