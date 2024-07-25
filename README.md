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


# 3.0 Stockage persistant des volumes

Afin que les machines partagent les volumes dockers, nous avons configuré un cluster glusterfs qui utilise le disque sdb de chaque machines. Ce cluster est monter sur les trois machines aux chemins /mnt/gfs/

#
