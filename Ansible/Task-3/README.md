# 🔒 Ansible Vault - Secure MySQL Deployment

## 🎯 Objective
Create an **Ansible playbook** that:
✅ **Installs MySQL** 🛠️  
✅ **Creates a database** named `ivolve` 🗄️  
✅ **Creates a user** with full privileges 👤  
✅ **Uses Ansible Vault** to encrypt sensitive data 🔐  

---

## 🏗 Steps to Complete the Task

### 1️⃣ Create an Ansible Vault File 🔐
✅ **Create a vault file to store the MySQL credentials:**
```bash
ansible-vault create mysql_cred.yml
```
✅ **Add the following content:**
```yaml
db_name: ivolve
db_user: ivolve_user
db_password: 12345
```
📌 **This file is encrypted and requires a vault password to access.**

---

### 2️⃣ Create the Ansible Playbook 📜
✅ **Create the playbook file:**
```bash
vim mysql.yml
```
✅ **Write the playbook:**
```yaml
---
- name: Deploy MySQL with Ansible Vault
  hosts: aws
  become: true
  
  vars_files:
    - ./mysql_cred.yml

  tasks:
    - name: Install MySQL
      ansible.builtin.apt:
        name: mysql-server
        state: present
        update_cache: yes

    - name: Verify MySQL service is running
      ansible.builtin.service:
        name: mysql
        enabled: true
        state: started

    - name: Create database and user with privileges
      ansible.builtin.shell: |
        mysql -u root -e "CREATE DATABASE IF NOT EXISTS {{ db_name }} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
        mysql -u root -e "CREATE USER IF NOT EXISTS '{{ db_user }}'@'%' IDENTIFIED BY '{{ db_password }}';"
        mysql -u root -e "GRANT ALL PRIVILEGES ON {{ db_name }}.* TO '{{ db_user }}'@'%'; FLUSH PRIVILEGES;"
```
📌 **Breakdown of tasks:**
- ✅ **Install MySQL** 🛠️
- ✅ **Ensure MySQL is running** 🔄
- ✅ **Create a secure database & user** 🏦

---

### 3️⃣ Encrypt the Playbook 🔒
✅ **Secure the playbook with Ansible Vault:**
```bash
ansible-vault encrypt mysql.yml
```
📌 **The playbook is now encrypted and requires a vault password to access.**

---

### 4️⃣ Run the Playbook 🚀
✅ **Execute the playbook securely:**
```bash
ansible-playbook mysql.yml --ask-vault-pass
```
📌 **You must enter the Vault password to run the playbook.**

---

🎉 **Your MySQL server is now securely deployed using Ansible Vault!** 🚀

