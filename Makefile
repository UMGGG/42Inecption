# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaeyjeon <jaeyjeon@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/26 04:10:55 by jaeyjeon          #+#    #+#              #
#    Updated: 2023/04/28 22:09:34 by jaeyjeon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# f옵션을 사용해 현재의 경로가아닌 다른곳의 yml파일을 사용
all:
	mkdir -p home/jaeyjeon/data/wordpress --build
	mkdir -p home/jaeyjeon/data/mariadb
	docker-compose -f ./srcs/docker-compose.yml up

down:
	docker-compose -f ./srcs/docker-compose.yml down

up:
	docker-compose -f ./srcs/docker-compose.yml up --build -d

# rmi all 옵션으로 모든 이미지를 삭제, volumes 옵션으로 모든 볼륨을 삭제
clean:
	docker-compose -f ./srcs/docker-compose.yml down --rmi all --volumes

fclean:
	make clean
	rm -rf home/jaeyjeon/data

re:
	make fclean
	make all

.PHONY: all down up clean fclean re
