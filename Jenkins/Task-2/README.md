# 🛡️ Role-Based Authorization in Jenkins

## 🎯 Objective
- Create two users: **user1** and **user2**.
- Assign the **admin** role to **user1**.
- Assign the **read-only** role to **user2**.

---

## ✅ Prerequisites

### 1️⃣ Ensure Jenkins is Installed and Running
- Jenkins should be set up and accessible.

### 2️⃣ Install the Role-Based Authorization Strategy Plugin
- Navigate to **Jenkins Dashboard > Manage Jenkins > Plugin Manager**.
- Install the **Role-Based Authorization Strategy** plugin.

📌 ![Image](./images/Role-Based_Authorization_Strategy.jpg)

---

## 🔧 Configuration Steps

### 1️⃣ Configure Role-Based Authorization

#### 🔹 Change Authorization Strategy
- Go to **Jenkins Dashboard > Manage Jenkins > Configure Global Security**.
- Under **Authorization**, select **Role-Based Strategy**.
- Save the changes.

📌 ![Image](./images/Role-Based_Strategy.jpg)

#### 🔹 Access Role Management
- Navigate to **Manage Jenkins > Manage and Assign Roles > Manage Roles**.

---

### 2️⃣ Create Roles

#### 🔹 Admin Role 👑
- Add a role named **admin**.
- Under **Permissions**, enable **all permissions**.

#### 🔹 Read-Only Role 🔍
- Add a role named **read-only**.
- Enable only **view-related** permissions:
  - **Overall**: Read
  - **Job**: Read
  - **View**: Read

📌 ![Image](./images/Manage_Roles.jpg)

---

### 3️⃣ Create Users 👥

#### 🔹 Add Users
- Navigate to **Manage Jenkins > Manage Users**.
- Create the following users:
  - **user1** (Admin role)
  - **user2** (Read-only role)

📌 ![Image](./images/Users.jpg)

---

### 4️⃣ Assign Roles to Users 🎭

#### 🔹 Assign Roles
- Navigate to **Manage Jenkins > Manage and Assign Roles > Assign Roles**.
- Assign the **admin** role to **user1**.
- Assign the **read-only** role to **user2**.

📌 ![Image](./images/Assign_Roles.jpg)

---

### 5️⃣ Test User Permissions 🧪

#### 🔹 Verify **user1** (Admin) 👑
- Log in as **user1**.
- Ensure full access to all Jenkins functionalities.

📌 ![Image](./images/user1.jpg)

#### 🔹 Verify **user2** (Read-Only) 🔍
- Log in as **user2**.
- Confirm restricted access, allowing only viewing but no modifications or builds.

📌 ![Image](./images/user2.jpg)

---

✅ **Success!** You have successfully configured Role-Based Authorization in Jenkins! 🚀

