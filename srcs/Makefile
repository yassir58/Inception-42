
services= wordpress mariadb nginx redis
volumes= wordpress-files wordpress-database
user= yelatman

all:prune dns up

up:
	docker compose up --build -d

dns:
	bash ./requirements/tools/configure.sh	$(user)

rebuild:
	docker compose build 

clean:
	docker image rm -f $(services)

down:
	docker compose down 

prune:
	@docker system prune -f

start:
	docker compose start

stop:
	docker compose stop

re:down fclean all

restart: down all

fclean:clean
	echo "Unstoppable@2020" | sudo -l -S
	@docker volume rm  -f $(volumes)
	@sudo rm -rf /home/yelatman

.PHONY: clean re stop prune down up rebuild fclean
