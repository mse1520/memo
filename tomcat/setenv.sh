DRIVE_CLASS_NAME_ENV='-DDRIVE_CLASS_NAME_ENV=org.mariadb.jdbc.Driver'
URL_ENV='-DURL_ENV="jdbc:mariadb://localhost:21400/smartfinder?useUnicode=true&amp;characterEncoding=UTF8&amp;useSSL=false&amp;"'
USER_NAME_ENV='-DUSER_NAME_ENV=synergy'
PASSWORD_ENV='-DPASSWORD_ENV=synergy1!'
export JAVA_OPTS="$JAVA_OPTS $URL_ENV $DRIVE_CLASS_NAME_ENV $USER_NAME_ENV $PASSWORD_ENV"
