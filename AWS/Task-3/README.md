# 🌍 Create AWS Load Balancer 🚀

## 🎯 Objective
Set up an **AWS VPC** with **2 public subnets**, launch **2 EC2 instances** (one with **Nginx**, one with **Apache**), and configure a **Load Balancer** to distribute traffic between them.

📌 **Key Features:**
✅ **VPC with Public Subnets**  
✅ **EC2 Instances with Web Servers**  
✅ **Security Groups for Controlled Access**  
✅ **Application Load Balancer for Traffic Distribution**  

---

## 🏗 Steps Overview
1️⃣ **Create a VPC with 2 Public Subnets**  
2️⃣ **Launch 2 EC2 Instances (Nginx & Apache)**  
3️⃣ **Configure Security Groups**  
4️⃣ **Set Up an Application Load Balancer (ALB)**  
5️⃣ **Test Load Balancer Functionality**  

---

## 🏗 Infrastructure Setup

### 🔹 **1. Create a VPC** 🌐
✅ **Navigate to AWS VPC Dashboard**  
- AWS Management Console → **VPC** → **Create VPC**

✅ **VPC Configuration:**  
- **Name:** `ivolve-vpc`  
- **CIDR Block:** `10.0.0.0/16`

✅ **Create 2 Public Subnets:**  
- **Subnet 1:** `ivolve-Public-Subnet-1` (CIDR: `10.0.1.0/24`, AZ: `us-east-1a`)  
- **Subnet 2:** `ivolve-Public-Subnet-2` (CIDR: `10.0.2.0/24`, AZ: `us-east-1b`)

✅ **Attach Internet Gateway (IGW):**  
- **Name:** `Lab2-IGW`  
- Attach IGW to `ivolve-vpc`.

✅ **Set Up Route Tables:**  
- **Public Route Table:** `Public-RouteTable`  
  - Route `0.0.0.0/0` → **Lab2-IGW**  
  - Associate both public subnets.

📌 ![vpc](images/vpc.png)

---

## 🖥 EC2 Instances

### 🔹 **2. Launch 2 EC2 Instances** 🖥️
✅ **Instance 1 (Nginx Server):**  
- **AMI:** Amazon Linux 2  
- **Instance Type:** t2.micro  
- **Subnet:** `ivolve-Public-Subnet-1`  
- **User Data:**
  ```bash
  #!/bin/bash
  sudo yum update -y
  sudo yum install nginx -y
  sudo systemctl start nginx
  sudo systemctl enable nginx
  echo "<h1>Welcome to Nginx Server</h1>" | sudo tee /usr/share/nginx/html/index.html
  ```

✅ **Instance 2 (Apache Server):**  
- **AMI:** Amazon Linux 2  
- **Instance Type:** t2.micro  
- **Subnet:** `ivolve-Public-Subnet-2`  
- **User Data:**
  ```bash
  #!/bin/bash
  sudo yum update -y
  sudo yum install httpd -y
  sudo systemctl start httpd
  sudo systemctl enable httpd
  echo "<h1>Welcome to Apache Server</h1>" | sudo tee /var/www/html/index.html
  ```

📌 ![ec2](images/Ec2.png)

---

## 🔐 Security Configuration

### 🔹 **3. Configure Security Groups** 🔒
✅ **Create a Security Group for the Load Balancer:**  
- **Inbound:** Allow **HTTP (port 80)** from **0.0.0.0/0**.  
- **Outbound:** Allow all traffic.

✅ **Assign Security Groups to EC2 Instances:**  
- Allow **SSH (22) & HTTP (80)**.

---

## ⚖️ Load Balancer Setup

### 🔹 **4. Create a Load Balancer** 🌍
✅ **Navigate to EC2 Dashboard → Load Balancers**  
- Click **Create Load Balancer**.

✅ **Configure Load Balancer:**  
- **Type:** Application Load Balancer (ALB)  
- **Name:** `ivolve-ALB`  
- **Scheme:** Internet-facing  
- **Listeners:** HTTP on port 80  
- **Availability Zones:** Select AZs with public subnets.

✅ **Create Target Group:**  
- **Name:** `ivolve-TG`  
- **Target Type:** Instance  
- Register the **two EC2 instances**.

✅ **Deploy Load Balancer & Get DNS Name**  
📌 ![Alp-tg](images/ALB-tg.png)  
📌 ![Alp](images/ALP.png)

---

## 🛠 Testing the Load Balancer

### 🔹 **5. Verify Load Balancer Functionality** 🖥
✅ **Open a Web Browser**  
✅ **Enter Load Balancer DNS Name**  
✅ **Refresh Page:**
- You should see **both Nginx & Apache responses** (alternating due to load balancing).

📌 ![test-1](images/test-1.png)  
📌 ![test-2](images/test-2.png)

---

## 🗑 Cleanup (Optional)
✅ **Terminate EC2 instances**  
✅ **Delete Load Balancer & Target Group**  
✅ **Delete VPC & Associated Resources**  

---

🎉 **Your AWS Load Balancer setup is now complete!** 🚀

