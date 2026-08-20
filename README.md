# Linux Automation & Monitoring

A practical repository demonstrating foundational Linux system administration, automated monitoring, and Bash scripting. This project was built using native OS utilities (Bash, Systemd, Cron, awk, grep) to monitor system health, automatically recover crashed services, and streamline routine operational tasks. 

This repository serves as a showcase of core Linux competencies required for maintaining reliable environments.

## 📌 Project Overview
Before adopting higher-level cloud abstraction tools, it is critical to understand the underlying operating system. This project acts as a functional toolkit for:
1. **Resource Monitoring:** Tracking CPU, memory, and disk utilization.
2. **Auto-Remediation:** Detecting and restarting failed services automatically.
3. **Task Automation:** Standardizing log analysis and automated backups.
4. **System Testing:** Simulating outages to validate monitoring alerts and scripts.

---

## 📂 Repository Structure

```text
linux-automation-toolkit/
├── monitoring/
│   ├── sys_monitor.sh         # Audits disk/memory and captures state during spikes
│   └── service_healer.sh      # Restarts crashed services (e.g., Nginx) and logs recovery
├── automation/
│   ├── backup_manager.sh      # Creates tarball backups with dynamic date stamping
│   ├── log_analyzer.sh        # Greps and counts critical errors in application logs
│   └── system_audit.sh        # Script for overall server health checks (ports, disk, services)
├── tests/
│   └── outage_simulator.sh    # Safely simulates CPU loads, memory leaks, and service crashes
├── docs/
│   └── Troubleshooting_Guide.md  # Standard approach for Check->Identify->Verify->Fix->Confirm
└── README.md
