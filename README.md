# Projet_Fil_Rouge_IBFormation_Lyon

Déploiement d'un site WEB utilisant un pipeline (CI/CD) DevOps chez dans le cadre d'une formation chez IB_Groupe_Cegos en mai 2022.
Nous avons opté pour le choix d'un serveur "Apache" et de "Vagrant" pour la création des machines vituelles qui sont au nombre de 03.

Nous avons procédé ainsi: build ->  Test -> scan -> push -> Deploy (Prod and  Preprod) -> Test -> Monitor

La création des fichiers et des scripts:

# Files

## **Vagrantfile** :
Le script de vagrantfile permet:
    - La création des trois VM. L'une d'entre elles (la machine principale appelée "Jenkins") aura Ansible, Jenkins et Docker installés.
    - La configuration réseau des machines en IP fixe :
         > La machine virtuelle "Jenkins" (ayant Ansible, Jenkins et Docker installés) a l'IP 192.168.99.10
         > La machine virtuelle "Staging", a l'IP 192.168.99.11
         > La machine virtuelle "Production", a l'IP 192.168.99.12

## **install_docker.sh** :

Dans le but de conteneuriser notre application et faciliter son dépoloiement, nous avons crée un script dans le fichier "install_docker.sh" qui permet d'automatiser:
    - L'installation de Docker.
    - L'installation de Docker-Compose
- 
## **Dockerfile** :

Ce fichier contient le script qui permet de créer l'image utilisée dans notre cas qui est "Apache".

## **install_jenkins.sh** :

Le script contenant dans ce fichier permet l'installation du serveur Jenkins. En effet, Jenkins va servir à l'automatisation du lancement des différentes parties nécessaires à l'intégration et le déploiement de notre application. 

# L'installation des machines vituelles :


![Screenshot Vagrant1](https://github.com/StephaneInfo/Projet_Fil_Rouge_IBFormation/blob/main/Images/vagrant1.png)
