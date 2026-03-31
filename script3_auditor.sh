#!/bin/bash
# =============================================================================
# Script 3: Disk and Permission Auditor
# Author:   :   ABHINAV KUMAR MISHRA | Roll: 24BCE10161
# Course:   Open Source Software | Chosen Software: Git
# Purpose:  Loop through key system directories and report their size,
#           owner, group, and permissions. Then check Git's config paths.
# =============================================================================

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/var" "/usr/lib")

printf "  %-20s %-12s %-10s %-10s %-10s\n" "Directory" "Permissions" "Owner" "Group" "Size"

for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        SIZE=${SIZE:-"N/A"}
        printf "  %-20s %-12s %-10s %-10s %-10s\n" "$DIR" "$PERMS" "$OWNER" "$GROUP" "$SIZE"
    else
        printf "  %-20s %s\n" "$DIR" "[does not exist]"
    fi
done

# Git-specific paths
GIT_PATHS=(
    "/usr/bin/git"
    "/usr/lib/git-core"
    "/etc/gitconfig"
    "$HOME/.gitconfig"
    "/usr/share/doc/git"
)

for PATH_ITEM in "${GIT_PATHS[@]}"; do
    if [ -f "$PATH_ITEM" ]; then
        PERMS=$(ls -l "$PATH_ITEM" | awk '{print $1}')
        OWNER=$(ls -l "$PATH_ITEM" | awk '{print $3}')
        SIZE=$(du -sh "$PATH_ITEM" 2>/dev/null | cut -f1)
        echo "  [FILE] $PATH_ITEM"
        echo "         Permissions: $PERMS | Owner: $OWNER | Size: $SIZE"
    elif [ -d "$PATH_ITEM" ]; then
        PERMS=$(ls -ld "$PATH_ITEM" | awk '{print $1}')
        OWNER=$(ls -ld "$PATH_ITEM" | awk '{print $3}')
        SIZE=$(du -sh "$PATH_ITEM" 2>/dev/null | cut -f1)
        echo "  [DIR]  $PATH_ITEM"
        echo "         Permissions: $PERMS | Owner: $OWNER | Size: $SIZE"
    else
        echo "  [----] $PATH_ITEM — not found on this system"
    fi
done

if command -v git &>/dev/null; then
    echo "  git is executable at: $(which git)"
    echo "  Version: $(git --version)"
fi
