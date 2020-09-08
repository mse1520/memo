@ECHO OFF

ECHO MariaDB 백업 시작

"C:\Program Files\MariaDB 10.4\bin\"mysqldump --routines -u root -p1234 synergy_cloud > C:\smartFinder\mariaDB_backup\"synergy_%DATE%.sql"



REM 오래된 백업을 삭제
FORFILES /P C:\smartFinder\mariaDB_backup /S /M *.sql /D -7 /C "cmd /c del @file"

ECHO 백업 완료