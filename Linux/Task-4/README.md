# Disk Management and Logical Volume Setup

## Objective
Attach a 15GB disk to your VM and create four partitions: 4GB, 2GB, 6GB, and 3GB. Configure:
- 4GB partition as a file system
- 2GB partition as swap
- 6GB partition as a Volume Group (VG) with a Logical Volume (LV)
- Extend the LV by adding the last 3GB partition

## Steps to Complete the Task

### 1. Identify the New Disk
```bash
lsblk
```

### 2. Create Partitions
```bash
sudo fdisk /dev/sdb
```
Use the following sizes:
- 4GB (primary)
- 2GB (primary, swap)
- 6GB (primary, LVM)
- 3GB (primary, LVM extension)

### 3. Format the 4GB Partition
```bash
sudo mkfs.ext4 /dev/sdb1
```

### 4. Set Up the 2GB Swap Partition
```bash
sudo mkswap /dev/sdb2
sudo swapon /dev/sdb2
```

### 5. Create a Volume Group and Logical Volume
```bash
sudo vgcreate my_vg /dev/sdb3
sudo lvcreate -L 6G -n my_lv my_vg
sudo mkfs.ext4 /dev/my_vg/my_lv
```

### 6. Extend the Logical Volume
```bash
sudo vgextend my_vg /dev/sdb4
sudo lvextend -L +3G /dev/my_vg/my_lv
sudo resize2fs /dev/my_vg/my_lv
```

### 7. Verify Configuration
```bash
lsblk
sudo mount /dev/sdb1 /mnt
sudo mount /dev/my_vg/my_lv /mnt/lvm
```
This ensures that the partitions and logical volume are properly set up.

