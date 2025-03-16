# 🚀 Ansible Playbook for Installing NGINX

## 🎯 Objective
Automate the configuration of a **web server** using **Ansible**. This playbook will:
✅ **Install & configure Nginx** 🛠️  
✅ **Ensure the service is running & enabled on boot** ⚙️  
✅ **Deploy a custom web page** 🌐  
✅ **Allow HTTP traffic via firewall** 🔥  

---

## 🏗 Steps to Complete the Task

### 1️⃣ Create & Configure the Inventory File 📋
✅ **Create a working directory for Ansible:**
```bash
mkdir -p ~/ansible/inventory && cd ~/ansible
```
✅ **Create the inventory file:**
```bash
vim inventory
```
✅ **Add target servers under `[hosts]`:**
```ini
[hosts]
192.168.19.132
192.168.19.133
```
📌 **Save and close the file.**

---

### 2️⃣ Configure `ansible.cfg` ⚙️
✅ **Create the Ansible configuration file:**
```bash
vim ansible.cfg
```
✅ **Add the following content:**
```ini
[defaults]
inventory = ./inventory
remote_user = ansibleusr
ask_pass = false

[privilege_escalation]
become = true
become_method = sudo
become_user = root
become_ask_pass = false
```
📌 **This ensures proper privilege escalation and inventory configuration.**

---

### 3️⃣ Create the Ansible Playbook 📜
✅ **Create a playbook file:**
```bash
vim playbook.yaml
```
✅ **Add the following Ansible playbook:**
```yaml
---
- name: Configure Nginx
  hosts: hosts        
  become: yes                  
  tasks:
    - name: Install Nginx
      apt:
        name: nginx
        state: present
        update_cache: yes

    - name: Start & enable Nginx service
      service:
        name: nginx
        state: started
        enabled: yes

    - name: Deploy a basic HTML page
      copy:
        content: "<h1>Hello, Nginx from Ansible</h1>"
        dest: /var/www/html/index.html

    - name: Allow HTTP through the firewall
      ufw:
        rule: allow
        port: '80'
        proto: tcp

    - name: Ensure firewall is enabled
      ufw:
        state: enabled
```
📌 **Breakdown of tasks:**
- ✅ **Install Nginx** 🛠️
- ✅ **Ensure Nginx is running & enabled on boot** 🔄
- ✅ **Deploy a simple HTML page** 📝
- ✅ **Open HTTP (port 80) on the firewall** 🔥

---

### 4️⃣ Run the Playbook 🚀
✅ **Execute the playbook:**
```bash
ansible-playbook playbook.yaml -i inventory
```
📌 **This will install and configure Nginx on all listed hosts.**

---

### 5️⃣ Verify the Configuration 🔍

✅ **Check the web server:**
- Open a browser & navigate to the **server’s IP address**.
- You should see **“Hello, Nginx from Ansible”** displayed.

✅ **Verify Nginx service status:**
```bash
sudo systemctl status nginx
```
📌 **Ensure that Nginx is running & enabled.**

---

🎉 **Your Nginx server is now fully configured using Ansible!** 🚀

