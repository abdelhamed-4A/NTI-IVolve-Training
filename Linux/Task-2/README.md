# MySQL Installation and Backup Automation

## Objective
Install MySQL and configure a cron job to take a backup every Sunday at 5 AM and save it to a designated location.

## Steps to Complete the Task

### 1. Install MySQL
```bash
sudo yum install mysql-server -y
systemctl enable --now mysqld
systemctl status mysqld
```

### 2. Secure MySQL Installation
```bash
sudo mysql_secure_installation
```
Follow the prompts to set up security settings.

### 3. Create a Backup Script
Create a backup script `/usr/local/bin/mysql_backup.sh`:
```bash
sudo nano /usr/local/bin/mysql_backup.sh
```
Add the following content:
```bash
#!/bin/bash
date=$(date +"%Y-%m-%d_%H-%M-%S")
mkdir -p /backup
mysqldump -u root -predhat --all-databases > /backup/mysql_backup_$date.sql
```
Save the file and make it executable:
```bash
sudo chmod +x /usr/local/bin/mysql_backup.sh
```

### 4. Set Up a Cron Job
Edit the crontab file:
```bash
sudo crontab -e
```
Add this line to schedule the backup every Sunday at 5 AM:
```bash
0 5 * * 0 /usr/local/bin/mysql_backup.sh
```

### 5. Verification Steps
- Check if MySQL is installed:
```bash
mysql --version
```
- Manually run the backup script to ensure it works:
```bash
sudo /usr/local/bin/mysql_backup.sh
```
- Check the backup directory to verify the generated backup files:
```bash
ls -lh /backup
```

