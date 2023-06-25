
services =	wordpress mariadb nginx redis ftp cadvisor adminer static-website
volumes	 =	wp-files wp-database
user   	 =	yelatman
network  =	inception-network
BLUE = \033[0;32m
RESET = \033[0m

all: configure up

up:
	@echo  "${BLUE}starting the project ...${RESET}"
	docker-compose -f ./srcs/docker-compose.yml up --build -d

configure:
	@echo  "${BLUE}configuring the project  ...${RESET}"
	@bash ./srcs/requirements/tools/configure.sh	$(user)

rebuild:
	@echo  "${BLUE}rebuilding the project ...${RESET}"
	docker-compose -f ./srcs/docker-compose.yml build 

clean:
	@echo  "${BLUE}cleaning the project ...${RESET} "
	@docker system prune -f 

down:
	@echo  "${BLUE}stopping the project ...${RESET} "
	docker-compose -f ./srcs/docker-compose.yml down 

start:
	@echo  "${BLUE}starting the project ...${RESET} "
	docker-compose -f ./srcs/docker-compose.yml start

stop:
	@echo  "${BLUE}stopping the project ...${RESET} "
	docker-compose -f ./srcs/docker-compose.yml stop

re:down fclean all
	@echo  "${BLUE}recreating the project ...${RESET} "

restart: down all

fclean:clean
	@echo  "${BLUE}removing unused resources ...${RESET}"
	@echo "Unstoppable@2020" | sudo -l -S >/dev/null 2>&1
	@sudo rm -rf /home/yelatman

.PHONY: clean re stop prune down up rebuild fclean
