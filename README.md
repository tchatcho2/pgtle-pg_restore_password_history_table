# pgtle-pg_restore_password_history_table

This script performs a backup of the password_check.password_history table from a PostgreSQL database. It creates a backup file containing the table's data, allowing you to easily store and restore it later.

Features
Backs up the password_check.password_history table.
Customizable PostgreSQL connection details (host, port, username, and database).
Option to specify a directory for saving the backup file (defaults to the current directory).
Uses pg_dump to create a compressed backup file in the custom format.
Requirements
PostgreSQL installed and running.
pg_dump command-line utility available.
Access to the password_check.password_history table in the target database.
Usage
Command Line
bash
Copy code
./backup_password_history.sh -H <host> -P <port> -U <user> -D <database> [-F <directory>]
Options
-H: PostgreSQL host (required).
-P: PostgreSQL port (required).
-U: PostgreSQL username (required).
-D: PostgreSQL database name (required).
-F: Output directory (optional, defaults to ./).
Example
bash
Copy code
./backup_password_history.sh -H localhost -P 5432 -U myuser -D mydatabase -F /backups/
This command will create a backup of the password_check.password_history table from the mydatabase database and save the dump file to the /backups/ directory.

Script Details
Usage Function: Displays how to use the script with the required parameters.
Command-line Parsing: Collects the PostgreSQL host, port, username, database name, and an optional directory for the backup file.
Backup Process:
Ensures the output directory ends with a /.
Creates a dynamic filename for the backup.
Uses pg_dump to back up the password_check.password_history table from the specified database and saves it in the specified directory.
Error Handling: If pg_dump fails, an error message will be displayed, and the script will exit.
License
This script is open-source and released under the MIT License.

Troubleshooting
Ensure that the PostgreSQL server is running and that the connection details (host, port, username, password) are correct.
Make sure that pg_dump is installed and accessible from your command line.
Notes
The backup file is created in the specified directory (default: current directory).
The script uses the custom format for pg_dump, which can later be restored using the pg_restore utility.

