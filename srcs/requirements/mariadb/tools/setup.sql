USE mysql;
CREATE DATABASE wordpress;
CREATE USER 'yelatman'@'%' IDENTIFIED BY 'test@1234@test';
GRANT ALL PRIVILEGES ON wordpress.* TO 'yelatman'@'%';
FLUSH PRIVILEGES;