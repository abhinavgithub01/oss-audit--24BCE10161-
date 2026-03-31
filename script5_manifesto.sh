#!/bin/bash
# =============================================================================
# Script 5: The Open Source Manifesto Generator
# Author:   :   ABHINAV KUMAR MISHRA | Roll: 24BCE10161
# Course:   Open Source Software | Chosen Software: Git
# Purpose:  Interactively ask the user three questions, compose a personalised
#           open source philosophy statement, and save it to a .txt file.
# =============================================================================

# Function as alias equivalent for 'date'
today() {
    date '+%d %B %Y'
}

# Gather input with validation
read -p "  1. Name one open-source tool you use every day: " TOOL
while [ -z "$TOOL" ]; do
    read -p "  1. Name one open-source tool you use every day: " TOOL
done

read -p "  2. In one word, what does 'freedom' mean to you in software? " FREEDOM
while [ -z "$FREEDOM" ]; do
    read -p "  2. In one word, what does 'freedom' mean to you? " FREEDOM
done

read -p "  3. Name one thing you would build and share freely: " BUILD
while [ -z "$BUILD" ]; do
    read -p "  3. Name one thing you would build and share freely: " BUILD
done

AUTHOR=$(whoami)
DATE_NOW=$(today)
OUTPUT="manifesto_${AUTHOR}.txt"

# Write manifesto to file using > (create) and >> (append)
echo "MY OPEN SOURCE MANIFESTO" > "$OUTPUT"
echo "Author : $AUTHOR  |  Date : $DATE_NOW" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Every day, I rely on $TOOL — a tool I did not build," >> "$OUTPUT"
echo "did not pay for, and yet have complete access to." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "To me, freedom in software means $FREEDOM." >> "$OUTPUT"
echo "The source code is the manual. Openness is not a feature — it is the point." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "One day, I intend to build and freely share: $BUILD." >> "$OUTPUT"
echo "Not because I must, but because that is how the commons grows." >> "$OUTPUT"

echo ""
echo "  Manifesto saved to: $OUTPUT"
cat "$OUTPUT"
