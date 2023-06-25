dname=$(cat /etc/hosts | grep $@.42.fr)

# adding the domain name to the /etc/hosts file
if [ -z "$dname" ]; then
    echo "127.0.0.1  $@.42.fr" >> /etc/hosts 
fi

# password in the vm
echo "Unstoppable@2020" | sudo -l -S > /dev/null 2>&1

if [ -d /home/$@/data/wp-files ]; then
    echo "Wordpress directory already exists!"
else
    sudo mkdir -p /home/$@/data/wp-files
    echo "Creating wordpress directory in /home/$@/data/wp-files."
fi

if [ -d /home/$@/data/wp-database ]; then
    echo "Database directory already exists!"
else
    sudo mkdir -p  /home/$@/data/wp-database
    echo "Creating database directory in /home/$@/data/wp-database."
fi
