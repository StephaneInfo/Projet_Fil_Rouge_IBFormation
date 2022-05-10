# Projet_Fil_Rouge_IBFormation_Lyon

Déploiement d'un site WEB utilisant un pipeline (CI/CD) DevOps dans le cadre d'une formation chez IB_Groupe_Cegos Lyon, en mai 2022.
Nous avons opté pour le choix d'un serveur "Apache" et de "Vagrant" pour la création des machines vituelles qui sont au nombre de 03.

Nous avons procédé ainsi: 

- build (création de l'image) -> push (le push de l'image vers le registre privé)-> Deploy (Preprod) -> Test -> Deploy (Prod) -> Push (le push de l'image finale vers le registre privé) -> Monitor 

La création des fichiers et des scripts a été effectué dans l'ordre suivant:

## Les fichiers

### [**Vagrantfile**](https://github.com/StephaneInfo/Projet_Fil_Rouge_IBFormation/blob/main/Vagrantfile)

Le script de vagrantfile permet:
- La création de trois VM. L'une d'entre elles (la machine principale appelée "Master") aura Ansible, Jenkins et Docker installés.
- La configuration réseau des machines en IP fixe et via DNS, où chaque machine est contactée via son nom:

      - La machine virtuelle "Master" (ayant Ansible, Jenkins et Docker installés) a l'IP 192.168.99.10
      
      - La machine virtuelle "Staging", a l'IP 192.168.99.11
      
      - La machine virtuelle "Production", a l'IP 192.168.99.12


## [**install_jenkins.sh**](https://github.com/StephaneInfo/Projet_Fil_Rouge_IBFormation/blob/main/install_jenkins.sh)

Le script contenant dans ce fichier permet l'installation du serveur Jenkins. En effet, Jenkins va servir à l'automatisation du lancement des différentes parties nécessaires à l'intégration et le déploiement de notre application. De plus, jenkins va permettre la liaison entre les différentes machines du pilepeline et se charge de leurs connexion et inter-connexions via leur noms affectées au niveau du "vagrantfile". 

Après avoir installé jenkins sur la machine "Master", nous avons opté pour la création d'un registre privé (Docker Private registry). En premier, ce registre privé va protéger notre site des fausses manipulations externes et publiques. En second, il permet l'hébergement des différentes images sur la machine "Master".

### [**install_docker.sh**](https://github.com/StephaneInfo/Projet_Fil_Rouge_IBFormation/blob/main/install_docker.sh)

Dans le but de conteneuriser notre application et faciliter son déploiement, nous avons crée un script dans le fichier "install_docker.sh" qui permet d'automatiser:

    - L'installation de Docker
    
    - L'installation de Docker-Compose
    
### [**Dockerfile**](https://github.com/StephaneInfo/Projet_Fil_Rouge_IBFormation/blob/main/Dockerfile)

Ce fichier contient le script qui permet de créer l'image utilisée dans notre cas qui est "Apache".

### [**jenkinsfile**](https://github.com/StephaneInfo/Projet_Fil_Rouge_IBFormation/blob/main/jenkinsfile)

Le script contenant dans ce fichier décrit les différentes étapes du lancement du pipeline. Effectivement, il permet de piloter toute la chaine CI/CD du projet.

## Illustration


Pour lancer notre pipeline, nous avons exécuté les commandes suivantes et dans ce qui suit l'output (tiré du dossier [Images](https://github.com/StephaneInfo/Projet_Fil_Rouge_IBFormation/tree/main/Images)):

1) Cette commande permet la création des machines virtuelles définies dans le fichier "Vagrantfile"
            
            vagrant up --provision
             
         
 ![Screenshot Vagrant1](https://github.com/StephaneInfo/Projet_Fil_Rouge_IBFormation/blob/main/Images/vagrant1.png)
 










