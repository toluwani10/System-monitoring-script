# Bash System Monitoring Tool

A lightweight Bash script for monitoring system resource usage on Linux. The tool checks CPU, memory, and disk usage against predefined thresholds and can be scheduled to run automatically using cron.

## Features

* Monitors CPU usage.
* Checks memory utilization.
* Checks disk space usage.
* Compares resource usage against predefined thresholds.
* Supports automated execution using cron.
* Can log output to a file for later review.

## Technologies Used

* **Bash** — scripting and automation
* **Ubuntu Server** — operating system
* **`top`** — CPU usage information
* **`free`** — memory usage information
* **`df`** — disk space information
* **`awk` and `sed`** — text processing
* **Cron** — task scheduling

## Project Structure

### 1. The Script
```text
system-monitor-tool/
└── systemtool.sh
```

### 2. Made the script executable

```bash
chmod +x systemtool.sh
```

### 3. Run the script

```bash
./systemtool.sh
```

The script will collect system resource usage and display or process the results according to its configuration.

## Configuration

The script uses predefined thresholds to determine when resource usage is high.

For example:

```bash
Threshold=80
```

## Automating with Cron

Cron can execute the monitoring script automatically at scheduled intervals.

To edit the user's cron jobs:

```bash
crontab -e
```

Add the following line to run the script every five minutes:

```cron
*/5 * * * * /home/okiki/system-monitor/systemtool.sh
```

Checked scheduled jobs with:

```bash
crontab -l
```


## What I Learned

* Writing Bash scripts for system administration.
* Monitoring Linux system resource utilization.
* Processing command output with `awk` and `sed`.
* Using conditional statements to evaluate resource thresholds.
* Automating recurring tasks with cron.
* Troubleshooting Linux commands and scheduled jobs.

