#!/bin/bash
# =============================================================================
# Script 2: FOSS Package Inspector
# Author:   :   ABHINAV KUMAR MISHRA | Roll: 24BCE10161
# Course:   Open Source Software | Chosen Software: Git
# Purpose:  Check if a FOSS package is installed, display its metadata,
#           and print a philosophy note about it using a case statement.
# Usage:    ./script2_package_inspector.sh [package_name]
# =============================================================================

PACKAGE=${1:-git}

echo "  Checking package: $PACKAGE"

if dpkg -s "$PACKAGE" &>/dev/null; then
    echo "  STATUS: $PACKAGE is INSTALLED"
    dpkg -s "$PACKAGE" | grep -E "^(Version|Maintainer|Installed-Size|Homepage|Description):"
    which "$PACKAGE" 2>/dev/null || echo "  (no binary in PATH named $PACKAGE)"
    dpkg -L "$PACKAGE" 2>/dev/null | wc -l | xargs -I{} echo "  {} files installed"
else
    echo "  STATUS: $PACKAGE is NOT installed."
    case "$PACKAGE" in
        git)        echo "  Install with: sudo apt install git" ;;
        apache2)    echo "  Install with: sudo apt install apache2" ;;
        mysql-server) echo "  Install with: sudo apt install mysql-server" ;;
        *)          echo "  Install with: sudo apt install $PACKAGE" ;;
    esac
fi

# Philosophy note via case statement
case "$PACKAGE" in
    git)
        echo "  Git (GPL v2): Born from a crisis — BitKeeper revoked in 2005."
        echo "  Linus built Git in 10 days. Open source doesn't need proprietary tools."
        ;;
    apache2|httpd)
        echo "  Apache (Apache 2.0): Powers ~30% of websites. Permissive license"
        echo "  lets companies use it commercially — open source as infrastructure."
        ;;
    *)
        echo "  Every open-source package carries a license — a statement of values."
        ;;
esac
