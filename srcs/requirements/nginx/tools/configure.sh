#! /bin/bash


# add the hostname to /etc/hosts
ENV_PATH="/run/nginx/.env"

echo "adding hostname to /etc/hosts"
export test="01234"
echo "TLS_HOSTNAME : $1"

if [ "$(grep -m1 $1 /etc/hosts)" = "" ]; then
	 printf "::1 %s\n127.0.0.1 %s\n" "$1" "$1" >> /etc/hosts
fi


#running nginx

echo "running nginx ..."
nginx -g 'daemon off;'
