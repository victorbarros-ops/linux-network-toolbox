# Linux Network Toolbox 🛠️

A collection of Bash scripts designed for network engineering tasks, system administration, and security auditing. These tools streamline daily operations such as connectivity monitoring, configuration backups, and log analysis.

## 📂 Included Tools

### 1. Network Monitor (`net_monitor.sh`)
* **Purpose:** Automates connectivity checks for a list of critical devices.
* **Features:** Reads IP addresses from a file, performs a ping sweep, and logs the status (ONLINE/OFFLINE) with timestamps.
* **Usage:**
    ```bash
    # Create a list of IPs
    echo "8.8.8.8" > ip_list.txt
    echo "192.168.1.1" >> ip_list.txt

    # Run the script
    chmod +x net_monitor.sh
    ./net_monitor.sh
    ```

### 2. Configuration Backup (`config_backup.sh`)
* **Purpose:** Ensures disaster recovery readiness by backing up critical configuration directories.
* **Features:** Compresses files into `.tar.gz` archives with timestamps and implements a **7-day retention policy** (automatically deletes old backups).
* **Usage:**
    ```bash
    chmod +x config_backup.sh
    ./config_backup.sh
    ```

### 3. SSH Auth Audit (`ssh_auth_audit.sh`)
* **Purpose:** Enhances server security by monitoring access logs.
* **Features:** Parses system authentication logs to count failed SSH login attempts and triggers an alert if a threshold is breached (useful for detecting brute-force attacks).
* **Usage:**
    ```bash
    # Requires root privileges to read /var/log/auth.log
    chmod +x ssh_auth_audit.sh
    sudo ./ssh_auth_audit.sh
    ```

## 🚀 Requirements
* Linux Environment (Ubuntu/Debian/CentOS/RHEL)
* Bash Shell
* Root/Sudo privileges (specifically for the Security Audit script)

---
*Created by Victor Barros - Network & Systems Engineer*
