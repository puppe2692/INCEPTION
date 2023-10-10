# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nwyseur <nwyseur@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/10 11:16:29 by nwyseur           #+#    #+#              #
#    Updated: 2023/10/10 11:24:02 by nwyseur          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt update
RUN apt install nginx -y
RUN apt install vim -y
RUN apt install curl -y
# Dossier permettant de stocker le certif et la cle pour une connexion securisee
RUN mkdir -p /etc/nginx/ssl 
# Outil de gestion/creation de certificat SSL
RUN apt install openssl -y
# Openssl request certif -x509 -nodes pour sup la demande de mdp cle privee puis adresse de stockage de la dite clef et certif + remplissage de prompt
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=nwyseur.52.fr/UID=nwyseur"
# creation de dossier pour stocker les fichiers de config nginx
RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf