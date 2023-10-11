#!/bin/sh

service mysql start;
# create database
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
# create user to manipulate
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
# Give full permission to user
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
# modification de lutilisateur roots
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
# on rafraichit
mysql -e "FLUSH PRIVILEGES;"
# reboot of MySQL
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
exec mysqld_safe