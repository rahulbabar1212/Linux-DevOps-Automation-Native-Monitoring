#!/bin/bash
# Description: Interactively simulates outages to test monitoring and healer scripts.

echo "Select an outage scenario to simulate:"
echo "1) Simulate Nginx Service Crash"
echo "2) Simulate Memory Load Spike"
echo "3) Simulate Disk Exhaustion"
read -p "Enter choice [1-3]: " choice

case $choice in
    1)
        echo "Stopping Nginx..."
        sudo systemctl stop nginx
        echo "Nginx stopped. Run service_healer.sh or check logs to verify auto-healing."
        ;;
    2)
        echo "Simulating temporary memory load..."
        tail /dev/zero | head -c 300M > /dev/null &
        PID=$!
        echo "Memory load active (PID $PID). Cleaning up in 15s..."
        sleep 15
        kill -9 $PID 2>/dev/null
        echo "Memory load cleared."
        ;;
    3)
        echo "Creating a 2GB test file in /tmp..."
        dd if=/dev/zero of=/tmp/test_largefile bs=1M count=2000
        echo "File created. Run sys_monitor.sh to verify threshold logging."
        read -p "Press Enter to remove test file..."
        rm -f /tmp/test_largefile
        echo "Cleanup complete."
        ;;
    *)
        echo "Invalid option."
        ;;
esac
