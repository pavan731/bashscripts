  GNU nano 6.2                                                                       node_exporter.sh                                                                                
#!/bin/bash

# Install node_exporter using wget and untar
wget https://github.com/prometheus/node_exporter/releases/download/v1.2.2/node_exporter-1.2.2.linux-amd64.tar.gz
tar xvfz node_exporter-1.2.2.linux-amd64.tar.gz

# Move node_exporter binary to /usr/local/bin
sudo mv node_exporter-1.2.2.linux-amd64/node_exporter /usr/local/bin/

# Clean up downloaded files
rm -rf node_exporter-1.2.2.linux-amd64.tar.gz node_exporter-1.2.2.linux-amd64

# Start node_exporter
nohup node_exporter &

# Show node_exporter status
node_exporter_pid=$(pgrep node_exporter)

if [ -n "$node_exporter_pid" ]; then
    echo "node_exporter is running with PID: $node_exporter_pid"
else
    echo "node_exporter is not running"
fi
