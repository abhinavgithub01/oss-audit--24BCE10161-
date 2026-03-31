# Open Source Audit: MySQL Capstone Project

**Student Name:** ABHINAV KUMAR MISHRA  
**Registration Number:** 24BCE10161  
**Chosen Software:** MySQL  

## Project Overview
This repository contains the practical shell scripting components for the Open Source Software (OSS) Capstone Project. It consists of five interactive Bash scripts designed to audit, analyze, and interact with the Linux ecosystem, specifically focusing on the MySQL database server.

## Script Descriptions
* **`script1_identity.sh` (System Identity Report):** Introduces the Linux environment. It dynamically fetches and displays system details like OS, kernel, user, uptime, and date.
* **`script2_inspector.sh` (FOSS Package Inspector):** Checks whether MySQL is installed and displays package details.
* **`script3_auditor.sh` (Disk and Permission Auditor):** Audits system directories for permissions, ownership, and disk usage.
* **`script4_loganalyzer.sh` (Log File Analyzer):** Searches log files for keywords like "error" and displays occurrences.
* **`script5_manifesto.sh` (Open Source Manifesto Generator):** Generates a personalized manifesto using user input.

## System Dependencies
- Bash shell (`/bin/bash`)
- GNU utilities: `grep`, `awk`, `cut`, `du`, `ls`, `uname`, `uptime`, `date`, `cat`, `tail`
- Package manager: `dpkg` (for Ubuntu/Debian)
- MySQL (`mysql-server`)

## Step-by-Step Instructions to Run

1. Open your Linux Terminal

2. Clone this repository:
```bash
git clone https://github.com/abhinavgithub01/oss-audit-24BCE10161.git
```

3. Navigate into the folder:
```bash
cd oss-audit-24BCE10161
```

4. Make scripts executable:
```bash
chmod +x *.sh
```

5. Run the scripts:

Script 1:
```bash
./script1_identity.sh
```

Script 2:
```bash
./script2_inspector.sh
```

Script 3:
```bash
./script3_auditor.sh
```

Script 4:
```bash
./script4_loganalyzer.sh /var/log/syslog
```

Optional:
```bash
./script4_loganalyzer.sh /var/log/syslog warning
```

Script 5:
```bash
./script5_manifesto.sh
```
