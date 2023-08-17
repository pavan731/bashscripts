#!/bin/bash

# Set the threshold for CPU usage in percentage
threshold=1

# Replace 'YOUR_SLACK_WEBHOOK_URL' with your actual Slack webhook URL
slack_webhook_url="https://hooks.slack.com/services/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"

while true; do
    # Get current CPU usage
    cpu_usage=$(top -b -n 1 | grep "Cpu(s)" | awk '{print $2}' | awk -F. '{print $1}')

    # Compare with threshold
    if [ "$cpu_usage" -gt "$threshold" ]; then
        message=":fire: CPU usage exceeded threshold! Current CPU usage: $cpu_usage%"
        payload="payload={\"text\": \"$message\"}"
        curl -X POST --data-urlencode "$payload" "$slack_webhook_url"
    fi

    # Add this line to end the while loop
    sleep 5
done


#To set the above bash script permission 
#chmod +x monitor_cpu.sh

#To run the above bash script
#./monitor_cpu.sh
