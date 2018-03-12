SET NAMES 'utf8';
SET CHARACTER SET utf8;

CREATE DATABASE IF NOT EXISTS {{ db_name }} CHARACTER SET=utf8;

-- GRANT ALL PRIVILEGES ON {{ db_name }}.* TO {{ db_user }}@localhost IDENTIFIED BY '{{ db_passwd }}';
GRANT ALL PRIVILEGES ON {{ db_name }}.* TO {{ db_user }}@localhost;

FLUSH PRIVILEGES;
