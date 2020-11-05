# Create backup file
/usr/bin/mysqldump --routines -u root -p'1234' smartfinder > /mariaDB_backup/'synergy_'$(date +%Y_%m_%d)'.sql'

# Remove backup files older than 7 days
rm -Rf /mariaDB_backup/'synergy_'$(date --date '7 days ago' +%Y_%m_%d)'.sql'