# Open Source Audit: MySQL Capstone Project

**Student Name:** ABHINAV KUMAR MISHRA  
**Registration Number:** 24BCE10161  
**Chosen Software:** MySQL  

## Project Overview
This repository contains the practical shell scripting components for the Open Source Software (OSS) Capstone Project. It consists of five interactive Bash scripts designed to audit, analyze, and interact with the Linux ecosystem, specifically focusing on the MySQL database server.

## Script Descriptions
* **`script1_identity.sh` (System Identity Report):** Introduces the Linux environment. It dynamically fetches and displays the OS distribution, kernel version, current user, system uptime, and current date/time, along with a statement regarding the OS's open-source license.
* **`script2_inspector.sh` (FOSS Package Inspector):** Checks the local Linux system to verify if MySQL is installed. It retrieves package details (version, maintainer) and outputs a brief philosophical note about the software's role in the open-source ecosystem.
* **`script3_auditor.sh` (Disk and Permission Auditor):** Loops through critical system directories (and the MySQL configuration directory) to audit their disk usage, ownership, and read/write/execute permissions, ensuring the database is securely isolated.
* **`script4_loganalyzer.sh` (Log File Analyzer):** Parses standard Linux log files (e.g., `/var/log/syslog`) line by line to count the occurrences of specific keywords (like "error"). It includes error handling for empty/missing files and outputs the last five matching lines for quick debugging.
* **`script5_manifesto.sh` (The Open Source Manifesto Generator):** An interactive script that prompts the user with three questions about their relationship with open-source software. It uses string concatenation to generate a personalized philosophy statement and saves it to a local text file.

## System Dependencies
To run these scripts successfully, your Linux environment requires the following:
* **Shell:** Bash (`/bin/bash`)
* **Standard GNU Utilities:** `grep`, `awk`, `cut`, `du`, `ls`, `uname`, `uptime`, `date`, `cat`, `tail`
* **Package Manager:** `dpkg` (The scripts are configured for Debian/Ubuntu-based systems. If using Fedora/RHEL, change `dpkg` to `rpm` in script 2).
* **Target Software:** MySQL (`mysql-server`) should be installed for Script 2 and Script 3 to generate complete outputs.

## Step-by-Step Instructions to Run

1. **Open your Linux Terminal.**

2. **Clone this repository** to your local machine:
   ```bash
   git clone [https://github.com/abhinavgithub01/oss-audit-24BCE10161.git](https://github.com/abhinavgithub01/oss-audit-24BCE10161.git)
3.Navigate into the project directory:

Bash
cd oss-audit-24BCE10161
4.Make all shell scripts executable:

Bash
chmod +x *.sh
5.Execute the scripts: You can run each script using the specific commands below.

Run Script 1: System Identity Report

Bash
./script1_identity.sh
Run Script 2: FOSS Package Inspector

Bash
./script2_inspector.sh
Run Script 3: Disk and Permission Auditor

Bash
./script3_auditor.sh
Run Script 4: Log File Analyzer
(Note: You must provide a log file path as an argument. The search keyword is optional and defaults to 'error'.)

Bash
./script4_loganalyzer.sh /var/log/syslog
# OR search for a specific keyword like "warning":
./script4_loganalyzer.sh /var/log/syslog warning
Run Script 5: The Open Source Manifesto Generator
(Note: This script is interactive and will prompt you to answer three questions in the terminal.)

Bash
./script5_manifesto.sh
