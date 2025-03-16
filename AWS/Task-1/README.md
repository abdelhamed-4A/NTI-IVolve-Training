# 🔒 AWS Security Setup 🚀

## 🎯 Objective
Set up an AWS account, configure billing alerts and budgets, manage IAM groups and users, and verify access restrictions.

---

## 🛠 Steps

### 1️⃣ Create an AWS Account 🏗
- Sign up at [AWS Sign-Up](https://aws.amazon.com/signup/).

---

### 2️⃣ Set Up AWS Budgets 💰

✅ **Navigate to AWS Budgets:**  
   - AWS Console → **Billing Dashboard** → **Budgets**.

✅ **Create a Budget:**  
   - **Type:** Cost Budget  
   - **Name:** `budget-account1`  
   - **Period:** Monthly  
   - **Amount:** Set threshold (e.g., `$10`).

✅ **Configure Notifications:**  
   - **Thresholds:**  
     - 🚨 **80%**: Send notification.  
     - 🔴 **100%**: Send critical alert.
   - **Channels:**  
     - Add **email** or **SNS topic**.

✅ **Review and Create:**  
   - Verify settings and click **Create Budget**.

📌 ![image](./images/budget.jpg)

---

### 3️⃣ Set a Billing Alarm ⏰

✅ **Navigate to CloudWatch:**  
   - AWS Console → **CloudWatch**.

✅ **Create Billing Alarm:**  
   - **Steps:**  
     - Select **Alarms** → **Create Alarm**.  
     - Choose **Billing** → **Total Estimated Charges**.  
     - Set a threshold (e.g., `$10`).  
     - Set up **email notifications**.

📌 ![image](./images/billing-alarm.jpg)

---

### 4️⃣ Create IAM Groups 👥

✅ **Navigate to IAM Dashboard:**  
   - AWS Console → **IAM** → **Groups**.

✅ **Create Groups:**  
   - 🛡 **admin-group**: Attach **AdministratorAccess** policy.  
   - 🛠 **developer-group**: Attach **AmazonEC2ReadOnlyAccess** policy.

📌 ![image](./images/iam-groups.jpg)

---

### 5️⃣ Create IAM Users 🔑

✅ **Create `admin-1` User (Console Access Only)**
   - **Access Type**: Console access.
   - **Group**: `admin-group`.
   - **Enable MFA** ✅.

✅ **Create `admin-2-prog` User (CLI Access Only)**
   - **Access Type**: Programmatic access.
   - **Group**: `admin-group`.

✅ **Create `dev-user` (Console & CLI Access)**
   - **Access Type**: Both console & programmatic.
   - **Group**: `developer-group`.

📌 ![image](./images/iam-users.jpg)

---

### 6️⃣ Configure AWS CLI for `admin-2-prog` & `dev-user` 💻

✅ **Install AWS CLI:** [AWS CLI Installation](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).  

✅ **Configure AWS CLI:**
```bash
aws configure
```

📌 ![image](./images/aws-cli-config.jpg)

---

### 7️⃣ List Users & Groups Using AWS CLI 📜

✅ **Run Command:**
```bash
aws iam list-users
```
📌 ![image](./images/aws-list-users.jpg)

---

### 8️⃣ Verify Access Restrictions for `dev-user` 🚫

#### 🔍 **Access EC2 Console**
✅ **Log in as `dev-user`**  
   - Navigate to **EC2 Dashboard**.
✅ **Verify Read-Only Access:**  
   - Ensure `dev-user` can **view** instances but **cannot modify** them.

📌 ![image](./images/ec2-readonly.jpg)

#### 🔐 **Attempt to Access S3**
✅ **Log in as `dev-user`**  
   - Navigate to **S3 Dashboard**.
✅ **Verify Access Denied:**  
   - `dev-user` should see an **Access Denied** message when trying to access S3.

📌 ![image](./images/s3-access-denied.jpg)

---

🎉 **AWS Security Setup is Complete!** 🚀

