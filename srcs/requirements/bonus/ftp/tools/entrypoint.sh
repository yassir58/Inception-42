#! /bin/bash

FTP_USER="ftp-user"
FTP_PASSWORD="test@123@test"


useradd -m "$FTP_USER" 
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd 
chown nobody:nogroup /home/$FTP_USER/ftp-files
chmod a-w /home/$FTP_USER/ftp-files
mkdir -p /home/"$FTP_USER"/ftp-files 
chown "$FTP_USER:$FTP_USER" /home/"$FTP_USER"/ftp-files 
echo "$FTP_USER" >> /etc/vsftpd.userlist 
mkdir -p /var/run/vsftpd/empty

exec "$@"