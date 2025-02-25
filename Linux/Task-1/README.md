# User and Group Management

## Objective
Create a new group named `ivolve` and a new user assigned to this group with a secure password. Configure the user’s permissions to allow installing Nginx with elevated privileges using `sudo`, without requiring a password.

---

## Steps to Complete the Task

### 1. Create a New Group
```bash
sudo groupadd ivolve
```

### 2. Create a New User and Assign to the Group
```bash
sudo useradd -m -G ivolve -s /bin/bash ivolveuser
```

### 3. Set a Secure Password for the User
```bash
sudo passwd ivolveuser
```
Enter a strong password when prompted.

### 4. Grant sudo Privileges to the User
Edit the sudoers file:
```bash
sudo visudo
```
Add this line at the end:
```bash
ivolveuser ALL=(ALL) NOPASSWD: /usr/bin/apt-get install nginx
```

### 5. Verification Steps

#### Switch to the New User
```bash
su - ivolveuser
```

#### Install Nginx Using sudo
```bash
sudo apt-get install nginx
```
This should proceed without a password prompt.

#### Check if Nginx is Installed
```bash
nginx -v
```

#### Test Restricted sudo Privileges
Try installing another package, like `httpd`, which should not be allowed:
```bash
sudo apt-get install httpd
```
It should prompt the user to enter a password.

This allows the user to install Nginx without requiring a password, but prevents the installation of other packages.