# nginx dockerfile
FROM debian:buster

ENV DEFAULT_CONF="./conf/default"
ENV DEFAULT_CONF_PATH="/etc/nginx/sites-enabled/default"
RUN apt-get update && apt-get install openssl curl gnupg2  nginx -y
COPY ${DEFAULT_CONF} ${DEFAULT_CONF_PATH}
ADD ./tools/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon  off;"]
