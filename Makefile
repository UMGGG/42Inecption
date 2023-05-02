# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaeyjeon <jaeyjeon@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/26 04:10:55 by jaeyjeon          #+#    #+#              #
#    Updated: 2023/05/03 04:31:51 by jaeyjeon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# docker-compose -f옵션을 사용해 현재의 경로가아닌 다른곳의 yml파일을 사용
all:
	mkdir -p home/jaeyjeon/data/wordpress
	mkdir -p home/jaeyjeon/data/mariadb
	docker-compose -f ./srcs/docker-compose.yml up --build

down:
	docker-compose -f ./srcs/docker-compose.yml down

up:
	docker-compose -f ./srcs/docker-compose.yml up

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

start:
	docker-compose -f ./srcs/docker-compose.yml start

status:
	docker-compose -f ./srcs/docker-compose.yml ps

# rmi all 옵션으로 모든 이미지를 삭제, volumes 옵션으로 모든 볼륨을 삭제
clean:
	docker-compose -f ./srcs/docker-compose.yml down --rmi all --volumes

fclean:
	make clean
	sudo rm -rf home/jaeyjeon/data

dangling-clean:
	docker rmi -f $(docker images -f "dangling=true" -q)
	docker rmi $(docker images -f "dangling=true" -q)

re:
	make fclean
	make all

.PHONY: all down up stop start status dangling-clean clean fclean re
