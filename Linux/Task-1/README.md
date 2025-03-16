# 👥 User & Group Management with Sudo Privileges 🚀

## 🎯 Objective
Create a new **group & user**, assign appropriate **permissions**, and configure **sudo** access to allow Nginx installation **without a password**.

---

## 🛠 Steps to Complete the Task

### 1️⃣ Create a New Group 👥
```bash
sudo groupadd ivolve
```
📌 **Creates a group named `ivolve`.**

---

### 2️⃣ Create a New User & Assign to the Group 👤
```bash
sudo useradd -m -G ivolve -s /bin/bash ivolveuser
```
📌 **Creates `ivolveuser` and adds it to the `ivolve` group.**

---

### 3️⃣ Set a Secure Password 🔐
```bash
sudo passwd ivolveuser
```
📌 **Enter a strong password when prompted.**

---

### 4️⃣ Grant sudo Privileges 🛡️
Edit the sudoers file:
```bash
sudo visudo
```
✅ **Add this line at the end:**
```bash
ivolveuser ALL=(ALL) NOPASSWD: /usr/bin/yum install nginx
```
📌 **Allows `ivolveuser` to install Nginx without a password.**

---

## 🔍 Verification Steps

### 5️⃣ Switch to the New User 🏁
```bash
su - ivolveuser
```
📌 **Logs in as `ivolveuser`.**

### 6️⃣ Install Nginx Using sudo 🛠️
```bash
sudo yum install nginx
```
📌 **Nginx should install without a password prompt.**

### 7️⃣ Check If Nginx is Installed ✅
```bash
nginx -v
```
📌 **Confirms Nginx installation.**

### 8️⃣ Test Restricted sudo Privileges 🚫
Try installing another package (**should not be allowed**):
```bash
sudo yum install httpd
```
📌 **The system should prompt for a password.**

---

🎉 **Your user & group are now correctly configured with restricted sudo privileges!** 🚀

