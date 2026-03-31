#!/bin/bash
# =============================================================================
# Script 1: System Identity Report
# Author:   ABHINAV KUMAR MISHRA | Roll: 24BCE10161
# Course:   Open Source Software | Chosen Software: Git
# Purpose:  Display a welcome screen showing Linux system info and OSS context
# =============================================================================

# --- Variables ---
STUDENT_NAME=" ABHINAV KUMAR MISHRA "
ROLL_NUMBER="24BCE10161"
SOFTWARE_CHOICE="Git"

# --- Gather system information using command substitution ---
KERNEL=$(uname -r)
DISTRO=$(lsb_release -d | cut -f2-)
USER_NAME=$(whoami)
HOME_DIR=$HOME
UPTIME=$(uptime -p)
CURRENT_DATE=$(date '+%A, %d %B %Y')
CURRENT_TIME=$(date '+%H:%M:%S %Z')
OS_LICENSE="GNU General Public License version 2 (GPL v2)"

# --- Display formatted report ---
echo "============================================================"
echo "         OPEN SOURCE AUDIT — SYSTEM IDENTITY REPORT        "
echo "============================================================"
echo ""
echo "  Student  : $STUDENT_NAME ($ROLL_NUMBER)"
echo "  Project  : Auditing $SOFTWARE_CHOICE"
echo ""
echo "  Distribution : $DISTRO"
echo "  Kernel       : $KERNEL"
echo "  Date         : $CURRENT_DATE"
echo "  Time         : $CURRENT_TIME"
echo "  Uptime       : $UPTIME"
echo ""
echo "  Logged-in User : $USER_NAME"
echo "  Home Directory : $HOME_DIR"
echo ""
echo "  License : $OS_LICENSE"
echo "  Both Linux and Git are released under GPL v2."
echo "============================================================"
