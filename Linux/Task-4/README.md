# 💾 Disk Management & Logical Volume Setup 🚀

## 🎯 Objective
Attach a **15GB disk** to your VM and configure partitions as follows:
✅ **4GB** → Formatted as a file system 📂  
✅ **2GB** → Configured as a **swap partition** 🔄  
✅ **6GB** → Created as a **Volume Group (VG) & Logical Volume (LV)** 🏗️  
✅ **Extend the LV** by adding the **last 3GB** partition ➕  

---

## 🛠 Steps to Complete the Task

### 1️⃣ Identify the New Disk 🧐
```bash
lsblk
```
📌 **Lists available disks and partitions.**

---

### 2️⃣ Create Partitions 🏗️
```bash
sudo fdisk /dev/sdb
```
📌 **Follow these sizes:**
- ✅ **4GB** → **Primary Partition** (File System)
- ✅ **2GB** → **Primary Partition** (Swap)
- ✅ **6GB** → **Primary Partition** (LVM)
- ✅ **3GB** → **Primary Partition** (LVM Extension)

---

### 3️⃣ Format the 4GB Partition 📂
```bash
sudo mkfs.ext4 /dev/sdb1
```
📌 **Formats `/dev/sdb1` as an EXT4 file system.**

---

### 4️⃣ Set Up the 2GB Swap Partition 🔄
```bash
sudo mkswap /dev/sdb2
sudo swapon /dev/sdb2
```
📌 **Configures and activates swap memory.**

---

### 5️⃣ Create a Volume Group & Logical Volume 🏗️
```bash
sudo vgcreate my_vg /dev/sdb3
sudo lvcreate -L 6G -n my_lv my_vg
sudo mkfs.ext4 /dev/my_vg/my_lv
```
📌 **Creates an LVM structure with a 6GB logical volume.**

---

### 6️⃣ Extend the Logical Volume ➕
```bash
sudo vgextend my_vg /dev/sdb4
sudo lvextend -L +3G /dev/my_vg/my_lv
sudo resize2fs /dev/my_vg/my_lv
```
📌 **Adds the 3GB partition to the existing LV and resizes the file system.**

---

### 7️⃣ Verify Configuration ✅
```bash
lsblk
sudo mount /dev/sdb1 /mnt
sudo mount /dev/my_vg/my_lv /mnt/lvm
```
📌 **Confirms partitions and logical volume setup.**

---

🎉 **Your disk and logical volume setup is now complete!** 🚀

