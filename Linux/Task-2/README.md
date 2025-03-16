# 🛠️ MySQL Installation & Automated Backup 🚀

## 🎯 Objective
Set up **MySQL**, ensure security settings, and configure a **cron job** to automate backups **every Sunday at 5 AM**. 📅

---

## 🛠️ Steps to Complete the Task

### 1️⃣ Install MySQL 🗄️
```bash
sudo yum install mysql-server -y
systemctl enable --now mysqld
systemctl status mysqld
```
📌 **This installs MySQL, enables it at startup, and checks its status.**

---

### 2️⃣ Secure MySQL Installation 🔒
```bash
sudo mysql_secure_installation
```
📌 **Follow the prompts to:**
✅ Set the **root password** 🔑  
✅ Remove **anonymous users** ❌  
✅ Disable **remote root login** 🔐  
✅ Remove **test databases** 📛  

---

### 3️⃣ Create a Backup Script 📂
✅ **Create the script file:**
```bash
sudo nano /usr/local/bin/mysql_backup.sh
```
✅ **Add the following content:**
```bash
#!/bin/bash
# Backup MySQL databases with timestamp
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
mkdir -p /backup
mysqldump -u root -predhat --all-databases > /backup/mysql_backup_$DATE.sql
```
✅ **Save the file and make it executable:**
```bash
sudo chmod +x /usr/local/bin/mysql_backup.sh
```
📌 **This script creates a timestamped MySQL backup and saves it in `/backup/`.**

---

### 4️⃣ Automate Backup with Cron 🕒
✅ **Edit the crontab file:**
```bash
sudo crontab -e
```
✅ **Add this line to schedule the backup every Sunday at 5 AM:**
```bash
0 5 * * 0 /usr/local/bin/mysql_backup.sh
```
📌 **This ensures weekly backups without manual intervention.**

---

## 🔍 Verification Steps

✅ **Check if MySQL is installed:**
```bash
mysql --version
```
✅ **Manually run the backup script to ensure it works:**
```bash
sudo /usr/local/bin/mysql_backup.sh
```
✅ **Check the backup directory for generated backups:**
```bash
ls -lh /backup
```
📌 **You should see a `.sql` backup file with a timestamp.**

---

🎉 **Your MySQL installation & backup automation is now complete!** 🚀

