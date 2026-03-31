#!/bin/bash
# =============================================================================
# Script 4: Log File Analyzer
# Author:   :   ABHINAV KUMAR MISHRA | Roll: 24BCE10161
# Course:   Open Source Software | Chosen Software: Git
# Purpose:  Read a log file line by line, count keyword occurrences,
#           print matching lines, and show a summary. Supports retry
#           if the file is empty.
# Usage:    ./script4_log_analyzer.sh <logfile> [keyword]
# =============================================================================

LOGFILE=$1
KEYWORD=${2:-"error"}
MATCHING_LINES=()
COUNT=0
MAX_RETRIES=3
RETRY=0

if [ -z "$LOGFILE" ]; then
    echo "  ERROR: No log file specified."
    echo "  Usage: $0 <logfile> [keyword]"
    exit 1
fi

if [ ! -f "$LOGFILE" ]; then
    echo "  ERROR: File '$LOGFILE' not found."
    exit 1
fi

# do-while style retry loop if file is empty
while true; do
    if [ ! -s "$LOGFILE" ]; then
        RETRY=$((RETRY + 1))
        echo "  WARNING: '$LOGFILE' is empty. (Attempt $RETRY of $MAX_RETRIES)"
        if [ "$RETRY" -ge "$MAX_RETRIES" ]; then
            echo "  File still empty after $MAX_RETRIES checks. Exiting."
            exit 1
        fi
        sleep 2
    else
        break
    fi
done

# Read file line by line
while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
        MATCHING_LINES+=("$LINE")
    fi
done < "$LOGFILE"

echo "  Keyword '$KEYWORD' found: $COUNT times"

TOTAL=${#MATCHING_LINES[@]}
START=$(( TOTAL > 5 ? TOTAL - 5 : 0 ))
for (( i=START; i<TOTAL; i++ )); do
    LINE_DISPLAY="${MATCHING_LINES[$i]:0:100}"
    echo "  [$((i+1))] $LINE_DISPLAY"
done

TOTAL_LINES=$(wc -l < "$LOGFILE")
PERCENT=$(awk "BEGIN {printf \"%.2f\", ($COUNT / $TOTAL_LINES) * 100}")
echo "  Total lines: $TOTAL_LINES | Matched: $COUNT | Percentage: $PERCENT%"
