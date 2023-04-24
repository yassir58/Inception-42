dname=$(cat /etc/hosts | grep $@.42.fr)


if [ -z "$dname" ]; then
    echo "127.0.0.1  $@.42.fr" >> /etc/hosts 
fi

# password in the vm
echo "Unstoppable@2020" | sudo -l -S
sudo mkdir -p /home/$@/data/wp-files /home/$@/data/wp-database