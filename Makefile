# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nwyseur <nwyseur@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/28 21:18:35 by nwyseur           #+#    #+#              #
#    Updated: 2023/09/29 16:14:49 by nwyseur          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COMPOSE_FILE = srcs/docker-compose.yml

.PHONY: all re clean stop

all: up

up:
	docker-compose -f $(COMPOSE_FILE) up -d --build

re: down up

down:
	docker-compose -f $(COMPOSE_FILE) down

clean: stop
	docker-compose -f $(COMPOSE_FILE) rm -f
	docker-compose -f $(COMPOSE_FILE) down --rmi all --remove-orphans

stop:
	docker-compose -f $(COMPOSE_FILE) stop