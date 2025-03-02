# AWS Security Setup

## Objective
Set up an AWS account, configure billing alerts and budgets, manage IAM groups and users, and verify access restrictions.

---

## Steps

### 1. Create an AWS Account
- Sign up at [AWS Sign-Up](https://aws.amazon.com/signup/).

---

### 2. Set Up AWS Budgets
1. **Navigate to AWS Budgets:**  
   - AWS Management Console → Billing Dashboard → Budgets.

2. **Create a Budget:**  
   - **Type:** Cost Budget  
   - **Name:** `budget-account1`  
   - **Period:** Monthly  
   - **Amount:** Set threshold (e.g., `$10`).  

3. **Configure Notifications:**  
   - **Thresholds:**  
     - 80%: Send notification.  
     - 100%: Send critical notification.  
   - **Channels:**  
     - Add email or SNS topic.  

4. **Review and Create:**  
   - Verify settings and click **Create Budget**.

---

### 3. Set a Billing Alarm
1. **Navigate to CloudWatch:**  
   - AWS Management Console → CloudWatch.

2. **Create Billing Alarm:**  
   - **Steps:**  
     - Select **Alarms** → **Create Alarm**.  
     - Choose **Billing** → **Total Estimated Charges**.  
     - Set a threshold (e.g., `$10`).  
     - Set up email notifications.

---

### 4. Create IAM Groups
1. **Navigate to IAM Dashboard:**  
   - AWS Console → IAM → Groups.

2. **Create Groups:**  
   - `admin-group`: Attach **AdministratorAccess** policy.  
   - `developer-group`: Attach **AmazonEC2ReadOnlyAccess** policy.  

---

### 5. Create IAM Users
1. **Create `admin-1` User (Console Access Only):**  
   - Access Type: Console access.  
   - Add to Group: `admin-group`.  
   - Enable MFA.

2. **Create `admin-2-prog` User (CLI Access Only):**  
   - Access Type: Programmatic access.  
   - Add to Group: `admin-group`.

3. **Create `dev-user` (Console & CLI Access):**  
   - Access Type: Both console and programmatic access.  
   - Add to Group: `developer-group`.

---

### 6. Configure AWS CLI for `admin-2-prog` and `dev-user`
1. **Install AWS CLI:** [AWS CLI Installation](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).  

2. **Configure AWS CLI:**  
   ```bash
   aws configure
   ```

---

### 7. List Users and Groups Using AWS CLI
1. **Run Command:**  
   ```bash
   aws iam list-users
   ```

---

### 8. Verify Access Restrictions for `dev-user`

#### **Access EC2 Console**
1. **Log in as `dev-user`**  
   - Navigate to **EC2 Dashboard**.

2. **Verify Read-Only Access:**  
   - Ensure `dev-user` can view instances but cannot modify them.

#### **Attempt to Access S3**
1. **Log in as `dev-user`**  
   - Navigate to **S3 Dashboard**.

2. **Verify Access Denied:**  
   - `dev-user` should see an **Access Denied** message when attempting to access S3 resources.

---

