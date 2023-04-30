# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaeyjeon <jaeyjeon@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/26 04:10:55 by jaeyjeon          #+#    #+#              #
#    Updated: 2023/05/01 03:25:51 by jaeyjeon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# f옵션을 사용해 현재의 경로가아닌 다른곳의 yml파일을 사용
all:
	mkdir -p home/jaeyjeon/data/wordpress
	mkdir -p home/jaeyjeon/data/mariadb
	sudo echo "127.0.0.1 jaeyjeon.42.fr" >> /etc/hosts
	docker-compose -f ./srcs/docker-compose.yml up --build

down:
	docker-compose -f ./srcs/docker-compose.yml down

up:
	docker-compose -f ./srcs/docker-compose.yml up

# rmi all 옵션으로 모든 이미지를 삭제, volumes 옵션으로 모든 볼륨을 삭제
clean:
	docker-compose -f ./srcs/docker-compose.yml down --rmi all --volumes

fclean:
	make clean
	sudo rm -rf home/jaeyjeon/data

re:
	make fclean
	make all

.PHONY: all down up clean fclean re
