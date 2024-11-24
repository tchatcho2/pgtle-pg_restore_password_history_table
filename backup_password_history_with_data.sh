#!/bin/bash

# Script to backup the password_check.password_history table with data

# Function to display usage
usage() {
    echo "Usage: $0 -H <host> -P <port> -U <user> -D <database> [-F <directory>]"
    echo "  -H  PostgreSQL host"
    echo "  -P  PostgreSQL port"
    echo "  -U  PostgreSQL username"
    echo "  -D  PostgreSQL database name"
    echo "  -F  Output directory (optional; defaults to ./)"
    exit 1
}

# Default output directory
OUTPUT_DIR="./"

# Parse command-line arguments
while getopts "H:P:U:D:F:" opt; do
    case $opt in
        H) HOST="$OPTARG" ;;
        P) PORT="$OPTARG" ;;
        U) USER="$OPTARG" ;;
        D) DATABASE="$OPTARG" ;;
        F) OUTPUT_DIR="$OPTARG" ;;
        *) usage ;;
    esac
done

# Validate required arguments
if [[ -z "$HOST" || -z "$PORT" || -z "$USER" || -z "$DATABASE" ]]; then
    usage
fi

# Fixed table name
TABLE="password_check.password_history"

# Ensure the output directory ends with a slash
OUTPUT_DIR="${OUTPUT_DIR%/}/"

# Construct the dump file name dynamically
DUMP_FILE="${OUTPUT_DIR}${DATABASE}_password_history.sql"

echo "Starting backup for table '$TABLE' in database '$DATABASE' on host '$HOST'..."
echo "Dump file will be saved to '$DUMP_FILE'."

# Perform the table dump with data
pg_dump -h "$HOST" -U "$USER" -d "$DATABASE" -t "$TABLE" -p "$PORT" -F c -f "$DUMP_FILE"
if [ $? -ne 0 ]; then
    echo "Error during pg_dump. Exiting."
    exit 1
fi

echo "Backup completed successfully. Dump file saved to '$DUMP_FILE'."