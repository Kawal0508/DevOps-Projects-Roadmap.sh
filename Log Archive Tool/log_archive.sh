if [ -z "$1" ]; then
    echo "Usage: log-archive <log-directory>"
    exit 1
fi

Log_Directory=$1
Archive_Directory="/var/log/archive"

if [ ! -d "$Archive_Directory" ]; then
    sudo mkdir -p "$Archive_Directory"
    echo "Created directory: $Archive_Directory"
fi

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
Archive_Name="logs_archive_${TIMESTAMP}.tar.gz"
Archive_Path="${Archive_Directory}/${Archive_Name}"

sudo tar -czf "$Archive_Path" -C "$Log_Directory" .

Log_File="$Archive_Directory/archive_log.txt"

if [ $Log_Directory == /var/log ]
then
    echo "Log Archive Tool directory is valid"
fi

if [ $? -eq 0 ]; then
    echo "Logs archived successfully: $Archive_Name"
    
sudo echo "[$(date +"%Y-%m-%d %H:%M:%S")] Archived logs to $Archive_Directory/$Archive_Name" | sudo tee -a "$Log_File" >/dev/null
else
    echo "Error compressing logs."
    exit 1
fi