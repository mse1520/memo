@ECHO OFF

ECHO MariaDB ��� ����

"C:\Program Files\MariaDB 10.4\bin\"mysqldump --routines -u root -p1234 synergy_cloud > C:\smartFinder\mariaDB_backup\"synergy_%DATE%.sql"



REM ������ ����� ����
FORFILES /P C:\smartFinder\mariaDB_backup /S /M *.sql /D -7 /C "cmd /c del @file"

ECHO ��� �Ϸ�