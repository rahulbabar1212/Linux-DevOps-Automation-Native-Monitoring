# Standard Operating Procedure: Incident Triage Workflow

A structured 5-step methodology for diagnosing and resolving Linux production incidents.

---

### Step 1: Check System Vitals
Establish the scope of the problem by verifying basic OS metrics:
* **System Load:** `uptime` / `top`
* **Memory Utilization:** `free -m`
* **Storage Space:** `df -h`
* **Disk I/O Latency:** `iostat -xz 1 5`

---

### Step 2: Identify the Bottleneck
Isolate whether the bottleneck is process, network, or storage-bound:
* **Process Level:** Sort high resource usage with `ps aux --sort=-%cpu` or `ps aux --sort=-%mem`.
* **Network Level:** Inspect listening ports and socket states using `ss -tulnp` or `ss -s`.
* **File Descriptors:** Identify open file locks via `lsof -i :<port>` or `lsof -p <PID>`.

---

### Step 3: Inspect Event Logs
Gather context surrounding the incident:
* **System Logs:** Review kernel ring buffer via `dmesg -T | tail -n 50`.
* **Service Logs:** Query target unit logs using `journalctl -u <service_name> -n 50 --no-pager`.
* **Application Logs:** Search for critical failures using `grep -i "error" /var/log/syslog`.

---

### Step 4: Execute Fix
Apply targeted remediation:
* **Service Failures:** Restart or reload configuration with `systemctl restart <service_name>`.
* **Hung Processes:** Terminate misbehaving processes safely with `kill -15 <PID>` (escalating to `kill -9` if unresponsive).
* **Storage Pressure:** Truncate large unneeded log files: `> /var/log/large_file.log`.

---

### Step 5: Confirm Recovery
Verify service stability and document the fix:
* Ensure unit status reports active: `systemctl status <service_name>`.
* Validate network bindings: `ss -tulnp | grep <port>`.
* Log post-incident diagnostics in the central audit history.
