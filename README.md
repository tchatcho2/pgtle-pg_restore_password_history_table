# pgtle-pg_restore_password_history_table
This script restores backup data to a database, creating a new table to protect the original. Steps:  Collects database details and the backup file. Ensures pass_temp schema exists. Creates pass_temp.password_hist_temp_table. Restores data for safe testing or recovery. Purpose: Protects original data.
