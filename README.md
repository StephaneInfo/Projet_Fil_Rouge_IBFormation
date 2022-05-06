# Projet_Fil_Rouge_IBFormation
Déploiement d'un site WEB utilisant un pipeline DevOps chez IB formation en 2022. 
Le choix du serveur s'est porté sur appache et pour la création des machines vituelles, nous avons utilisé Vagrant

# Files

## **Vagrantfile** :

- Lancement de la création des VM. L'une d'entre elles aura Ansible, Jenkins et Docker installés.
- Configuration réseau en IP fixe :
  > - La machine virtuelle, jenkins, ayant Ansible, Jenkins et Docker installés a l'IP 192.168.99.10
  > - La machine virtuelle, staging,  a l'IP 192.168.99.11
  > - La machine virtuelle, production,  a l'IP 192.168.99.12
 
- Lancement d'un script install_docker.sh pour automatiser l'installation de Docker.

## **install_docker.sh** :

## **Dockerfile** :

