# 🚀 Jenkins Installation Guide

## 🎯 Objective
Install Jenkins as a container on a Linux system using Docker.

---

## ✅ Prerequisites

### 1️⃣ Update System Packages
```bash
sudo apt update -y && sudo apt upgrade -y
```

### 2️⃣ Install Docker 🐳
```bash
sudo apt install docker.io -y
```

### 3️⃣ Enable and Start Docker Service ⚙️
```bash
sudo systemctl enable --now docker
```

### 4️⃣ Verify Docker Installation 🔍
```bash
docker --version
```

---

## 🔧 Jenkins Installation Steps

### 1️⃣ Pull the Jenkins Image 📥
```bash
sudo docker pull jenkins/jenkins:lts
```

### 2️⃣ Run the Jenkins Container 🏃
```bash
sudo docker run -d \
  --name jenkins \
  -p 8080:8080 -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  --restart unless-stopped \
  jenkins/jenkins:lts
```

### 3️⃣ Verify Jenkins Container is Running ✅
```bash
sudo docker ps
```

---

## 🔑 Configure Jenkins

### 1️⃣ Access Jenkins Web Interface 🌐
- Open a browser and go to: `http://localhost:8080`

📌 ![Image](./images/Unlock_Jenkins.jpg)

### 2️⃣ Retrieve Admin Password 🔐
```bash
sudo docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

### 3️⃣ Complete Jenkins Setup 🛠️
- Use the retrieved password to log in.
- Install **recommended plugins**.
- Create an **admin account**.

📌 ![Image](./images/Customize_Jenkins.jpg)

---

## 🔄 Post-Installation Steps

### 🛠 Manage Jenkins Settings ⚙️
- Navigate to `Manage Jenkins` > `Manage Plugins` to install additional plugins.

### 🔑 Set Up SSH for Automation (Optional) 🔄
```bash
sudo apt install -y openssh-server
```

### 🔄 Restart Jenkins if Needed 🔄
```bash
sudo docker restart jenkins
```

---

🎉 **Congratulations! Jenkins is now installed and configured!** 🚀

