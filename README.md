# 1. Réseau

Afin que le cluster partage une seul IP est soit tolerante aux pannes, nous avons mis en place une Virtual IP VRRP avec le service linux Keepalived. 

La VIP est la 172.20.107.105 et les nodes sont les suivants : 
- sc16 : 172.20.107.100
- sc17 : 172.20.107.101
- sc18 : 172.20.107.102

La configuration Keepelived est disponible dans le dossier keepalived/.


# 2. Cluster swarm


# 3.0 Stockage persistant des volumes


#
