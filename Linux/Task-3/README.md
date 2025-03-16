# 🖥️ Shell Scripting - Ping Server Checker 🚀

## 🎯 Objective
Create a **shell script** to **ping** every server in the `172.16.17.x` subnet (`x` = 0 to 255). Based on the response:
✅ **If the server is up** → Display: `Server 172.16.17.x is up and running ✅`
✅ **If the server is unreachable** → Display: `Server 172.16.17.x is unreachable ❌`

---

## 🛠 Steps to Complete the Task

### 1️⃣ Create the Shell Script 📜
✅ **Create a new script file:**
```bash
vim ping_servers.sh
```
✅ **Add the following script:**
```bash
#!/bin/bash

for i in {0..255}; do
    ping -c 1 -W 1 172.16.17.$i > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "✅ Server 172.16.17.$i is up and running"
    else
        echo "❌ Server 172.16.17.$i is unreachable"
    fi
done
```
📌 **This script iterates through all IPs in the subnet and pings each one.**

---

### 2️⃣ Make the Script Executable 🛠️
```bash
sudo chmod +x ping_servers.sh
```
📌 **Grants execution permission to the script.**

---

### 3️⃣ Run the Script 🚀
```bash
./ping_servers.sh
```
📌 **Executes the script and checks the status of all servers in the subnet.**

---

## 🔍 Sample Output:
```bash
❌ Server 172.16.17.0 is unreachable
✅ Server 172.16.17.1 is up and running
❌ Server 172.16.17.2 is unreachable
...
```

🎉 **Your ping checker script is now ready!** 🚀

