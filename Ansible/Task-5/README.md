# ⚡ Ansible Dynamic Inventories

## 🎯 Objective
Set up **Ansible Dynamic Inventories** to **automatically discover and manage infrastructure**, and use **Ansible Galaxy** to install **Apache** on managed nodes. 🚀

---

## 🛠 Steps to Complete the Task

### 1️⃣ Install Required Dependencies 🏗️
Before setting up the dynamic inventory, ensure the necessary tools are installed.

#### 🔹 Install `boto3` (for AWS integration)
If you're using **AWS**, install `boto3` to enable dynamic inventory management:
```bash
sudo apt install python3 -y
pip install boto3
```

#### 🔹 Install Ansible
Ensure **Ansible** is installed on the control node:
```bash
sudo apt update
sudo apt install ansible -y
```

---

### 2️⃣ Configure Dynamic Inventory 📋
Create a **Dynamic Inventory Configuration** file for AWS EC2:
```bash
vim aws_ec2.yml
```
✅ **Add the following configuration:**
```yaml
---
plugin: amazon.aws.aws_ec2
regions:
  - us-east-1
filters:
  "tag:Name": ivolve
  instance-state-name: running  
keyed_groups:
  - key: tags.Name
    prefix: tag
```
📌 **This config will dynamically fetch all running AWS EC2 instances tagged as `ivolve`.**

---

### 3️⃣ Configure AWS Credentials 🔐
Ensure AWS credentials are set up properly:
```bash
aws configure
```
📌 **Enter your AWS Access Key, Secret Key, Region, and Output format.**

---

### 4️⃣ Set Up Ansible Configuration ⚙️
Create an **`ansible.cfg`** file:
```bash
vim ansible.cfg
```
✅ **Add the following configuration:**
```ini
[defaults]
inventory = ./aws_ec2.yml
remote_user = ansibleusr
```
📌 **This sets up Ansible to use the dynamic inventory automatically.**

---

### 5️⃣ Test the Dynamic Inventory ✅
Run the following command to check if Ansible can retrieve instances dynamically:
```bash
ansible-inventory -i aws_ec2.yml --list
```
📌 **This should return a list of EC2 instances detected via AWS API.**

---

### 6️⃣ Install Apache using Ansible Galaxy 🌍
Install the **Apache Role** from **Ansible Galaxy**:
```bash
ansible-galaxy install geerlingguy.apache
```
📌 **This downloads a pre-configured Ansible role to automate Apache installation.**

---

### 7️⃣ Create the Ansible Playbook 📜
✅ **Create a playbook file:**
```bash
vim playbook.yml
```
✅ **Add the following playbook:**
```yaml
---
- name: Install Apache
  hosts: all
  become: yes
  roles:
    - geerlingguy.apache
```
📌 **This playbook installs Apache on all dynamically detected hosts.**

---

### 8️⃣ Run the Playbook with Dynamic Inventory 🚀
Execute the playbook:
```bash
ansible-playbook playbook.yml -i aws_ec2.yml
```
📌 **Ansible will automatically discover instances and install Apache on them.**

---

### 9️⃣ Verify Apache Installation 🔍
✅ **Check Apache status on managed nodes:**
```bash
sudo systemctl status apache2
```
✅ **Test in a browser:**
- Open a browser and navigate to the **IP address** of the managed nodes.
- You should see the **default Apache web page.** 🎉

---

🎉 **Your Apache deployment is now automated using Ansible Dynamic Inventories & Galaxy Roles!** 🚀

