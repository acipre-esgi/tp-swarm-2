# 1. Réseau

Afin que le cluster partage une seul IP est soit tolerante aux pannes, nous avons mis en place une Virtual IP VRRP avec le service linux Keepalived. 

La VIP est la 172.20.107.105 et les nodes sont les suivants : 
- sc16 : 172.20.107.100
- sc17 : 172.20.107.101
- sc18 : 172.20.107.102

La configuration Keepelived est disponible dans le dossier keepalived/.


# 2. Cluster swarm

Le cluster swarm est composé des trois machines (sc16,sc17,sc18). sc16 et sc17 sont des managers tandis que sc18 est un worker.

Afin de ne pas rentrer en conflit avec le port Vxlan de VMware, nous avons changer le data-path-port pour l'overlay.


# 3. Stockage persistant des volumes

Afin que les machines partagent les volumes dockers, nous avons configuré un cluster glusterfs qui utilise le disque sdb de chaque machines. Ce cluster est monter sur les trois machines aux chemins /mnt/gfs/

# 4. Stacks

Le cluster swarm contient plusieurs stacks :

## 4.1. Wordpress

La stack wordpress est composé de deux microservices : 
- DB mariadb : non exposé 
- wordpress : Exposé dans le cluster sur le port 80

Wordpress se connecte a mariadb pour sa base de données. Deux volumes persistants sont présent : 
- wp_data: contient le /var/www/html de wordpress
- db_data: contient le /var/lib/mysql de mariadb

## 4.2 Microbin

Microbin est un service de partage de texte et de fichier. Ce stack n'est composé que d'un microservice exposé sur le port 8090.

Le stack utilise un volume qui est mappé sur le conteneur au /app/microbin_data.

## 4.3 Monitoring

Ce stack contient la suite prometheus / alertmanager/ cadvisor / grafana



