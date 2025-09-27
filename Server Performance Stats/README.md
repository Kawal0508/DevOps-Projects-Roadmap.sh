## Prerequisites

- Linux/Unix system
- Bash shell
- Sudo privileges (for failed login attempts check)

## Installation

1. Clone or download the project:
   ```bash
   git clone github.com/Kawal0508/DevOps-Projects-Roadmap.sh
   cd "DevOps projects/Server Performance Stats"
   ```

2. Make the script executable:
   ```bash
   chmod +x Server_Stats.sh
   ```

## Usage

### Run with sudo (Recommended)
```bash
sudo ./Server_Stats.sh
```
*This method avoids password prompts for sudo commands within the script to know about failed login attempts*

### Run as regular user
```bash
./Server_Stats.sh
```
*You'll be prompted for password when the script reaches sudo commands.*

## Output

The script displays:
- System uptime information
- Total CPU usage percentage
- Memory usage (total, used, free with percentages)
- Disk usage (total, used, free with percentages)
- Top 5 processes by memory usage
- Top 5 processes by CPU usage
- Currently logged-in user
- Operating system version
- Failed login attempts (requires sudo)

## Project Structure

```
Server Performance Stats/
├── Server_Stats.sh    # Main performance monitoring script
└── README.md         # This file
```

## Troubleshooting

### Permission Denied
If you get permission denied errors:
```bash
chmod +x Server_Stats.sh
```

### Sudo Password Prompts
To avoid repeated password prompts, run the entire script with sudo:
```bash
sudo ./Server_Stats.sh
```

### Missing Commands
Ensure your system has the required commands:
- `uptime`
- `top`
- `free`
- `df`
- `ps`
- `hostnamectl`
- `lastb`

## Project URL
This project is part of [Roadmap.sh](https://roadmap.sh/projects/server-stats) DevOps projects.
[GitHub Repository](https://github.com/yourusername/server-performance-stats)

---

**Note**: This script is designed for Linux/Unix systems. Some commands may not work on Windows without WSL or similar compatibility layers.
