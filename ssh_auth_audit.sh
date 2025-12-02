#!/bin/bash
# Name: ssh_auth_audit.sh
# Description: Analyzes authentication logs to detect failed SSH login attempts.

# Log file path (Verify if your system uses auth.log or secure)
AUTH_LOG_FILE="/var/log/auth.log" 

# Check for read permissions
if [ ! -r "$AUTH_LOG_FILE" ]; then
    echo "Error: Root privileges are required to read $AUTH_LOG_FILE."
    exit 1
fi

echo "Analyzing failed login attempts..."
echo "----------------------------------------"

# Filter by 'Failed password' and count occurrences
FAILED_ATTEMPTS=$(grep "Failed password" "$AUTH_LOG_FILE" | wc -l)

echo "Total failed attempts detected: $FAILED_ATTEMPTS"

# Alert threshold
if [ "$FAILED_ATTEMPTS" -gt 10 ]; then
    echo "ALERT: High number of potential intrusion attempts detected!"
else
    echo "Status: Normal."
fi
