# Nginx Log Analyser

A simple yet powerful bash script that analyzes nginx access logs to provide insights into web traffic patterns, helping you understand your website's usage and identify potential issues.

## 📋 Overview

This script processes nginx access log files and extracts valuable information about:
- **Top IP addresses** making the most requests
- **Most requested paths/URLs** on your website
- **Response status codes** distribution

Perfect for web administrators, DevOps engineers, and anyone who needs to quickly analyze web server traffic patterns.

## 🚀 Features

- **Top IP Analysis**: Identifies the most active visitors by IP address
- **Path Analysis**: Shows which pages/endpoints are most popular
- **Status Code Analysis**: Reveals the distribution of HTTP response codes
- **Configurable Output**: Easily adjust the number of results displayed
- **Error Handling**: Gracefully handles missing log files
- **Lightweight**: Fast execution with minimal system resources

## 📋 Prerequisites

- **Operating System**: Linux, macOS, or Windows with WSL/Git Bash
- **Dependencies**: 
  - Bash shell
  - AWK (usually pre-installed)
  - Standard Unix utilities (sort, uniq, grep, head)
- **Log File**: nginx access log file in standard format

## 📁 File Structure

```
Nginx Log Analyser/
├── nginx_log_analyser.sh    # Main analysis script
├── nginx-access.log         # Sample nginx access log file
└── README.md               # This documentation
```

## 🛠️ Installation

1. **Clone or download** this repository
2. **Navigate** to the Nginx Log Analyser directory:
   ```bash
   cd "Nginx Log Analyser"
   ```
3. **Make the script executable**:
   ```bash
   chmod +x nginx_log_analyser.sh
   ```

## 📖 Usage

### Basic Usage

```bash
./nginx_log_analyser.sh
```

The script will automatically look for `nginx-access.log` in the current directory.

### Using Your Own Log File

1. **Place your log file** in the same directory as the script
2. **Rename it** to `nginx-access.log`, or
3. **Edit the script** to change the `LOG_FILE` variable:
   ```bash
   LOG_FILE="your-log-file.log"
   ```

### Example Output

```
Top 5 IP addresses with the most requests:
192.168.1.100 - 45 requests
10.0.0.50 - 32 requests
203.0.113.25 - 28 requests
198.51.100.10 - 22 requests
172.16.0.5 - 18 requests

Top 5 most requested paths:
/ - 67 requests
/api/users - 23 requests
/images/logo.png - 15 requests
/css/style.css - 12 requests
/js/app.js - 8 requests

Top 5 response status codes:
200 - 89 requests
404 - 12 requests
301 - 8 requests
500 - 3 requests
403 - 2 requests
```

## ⚙️ Configuration

### Adjusting Output Count

To change the number of results displayed, modify the `COUNTS` variable in the script:

```bash
COUNTS=10  # Show top 10 instead of top 5
```

### Log File Format

The script expects nginx access logs in the standard combined log format:
```
IP_ADDRESS - - [TIMESTAMP] "METHOD PATH HTTP_VERSION" STATUS_CODE RESPONSE_SIZE "REFERER" "USER_AGENT"
```

Example:
```
192.168.1.100 - - [25/Dec/2023:10:00:01 +0000] "GET /api/users HTTP/1.1" 200 1234 "-" "Mozilla/5.0..."
```

## 🔧 Troubleshooting

### Common Issues

**Error: nginx-access.log not found**
- **Solution**: Ensure the log file exists in the same directory as the script
- **Alternative**: Update the `LOG_FILE` variable to point to your log file

**Permission denied**
- **Solution**: Make the script executable with `chmod +x nginx_log_analyser.sh`

**Empty or no output**
- **Check**: Verify your log file has data and is in the correct format
- **Debug**: Try running `head -5 nginx-access.log` to see sample log entries

**AWK command not found**
- **Solution**: Install AWK (usually pre-installed on most systems)
- **Ubuntu/Debian**: `sudo apt-get install gawk`
- **CentOS/RHEL**: `sudo yum install gawk`

## 📊 Understanding the Output

### IP Address Analysis
- Shows which IP addresses are making the most requests
- Useful for identifying potential DDoS attacks or heavy users
- Helps with rate limiting and access control decisions

### Path Analysis
- Reveals which pages/endpoints are most popular
- Helps with performance optimization and caching strategies
- Identifies unused or broken links (if combined with status code analysis)

### Status Code Analysis
- **200**: Successful requests
- **404**: Not found (broken links)
- **301/302**: Redirects
- **500**: Server errors
- **403**: Forbidden access

## 🚀 Advanced Usage

### Analyzing Multiple Log Files

To analyze multiple log files, you can modify the script:

```bash
# Create a backup of the original
cp nginx_log_analyser.sh nginx_log_analyser_multi.sh

# Edit the script to process multiple files
for log_file in *.log; do
    echo "=== Analyzing $log_file ==="
    # ... rest of the analysis
done
```

### Adding to Cron Jobs

Schedule regular log analysis:

```bash
# Add to crontab for daily analysis at 2 AM
0 2 * * * /path/to/nginx_log_analyser.sh >> /var/log/nginx_analysis.log
```

## 🤝 Contributing

Contributions are welcome! Here are some ideas for improvements:

- Add support for different log formats
- Implement time-based filtering
- Add geolocation for IP addresses
- Create HTML report output
- Add real-time monitoring capabilities
- Implement log rotation detection

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## 🙏 Acknowledgments

- Inspired by the need for quick nginx log analysis
- Built using standard Unix tools and bash scripting
- Part of the DevOps Projects Roadmap collection

---

**Happy Analyzing! 📊**

*For more DevOps projects and scripts, check out the main [DevOps Projects Roadmap](../README.md).*
