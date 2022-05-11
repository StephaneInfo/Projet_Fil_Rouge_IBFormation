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

Le script contenant dans ce fichier permet l'installation du serveur Jenkins. En effet, Jenkins va servir à l'automatisation du lancement des différentes parties nécessaires à l'intégration et le déploiement de notre application. De plus, ce script va permettre la liaison entre les différentes machines du pilepeline et se charge de leurs connexion via leur noms affectées au niveau du "vagrantfile".
De plus, il y a l'automatisation de la copie de la clé publique de jenkins sur la machine "production" et "staging". 

Après avoir installé jenkins sur la machine "Master", nous avons opté pour la création d'un registre privé (Docker Private registry). En premier, ce registre privé va protéger notre site des fausses manipulations externes et publiques. En second, il permet l'hébergement des différentes images sur la machine "Master".

### [**install_docker.sh**](https://github.com/StephaneInfo/Projet_Fil_Rouge_IBFormation/blob/main/install_docker.sh)

Dans le but de conteneuriser notre application et faciliter son déploiement, nous avons crée un script dans le fichier "install_docker.sh" qui permet d'automatiser:

    - L'installation de Docker
    
    - L'installation de Docker-Compose
    
### [**Dockerfile**](https://github.com/StephaneInfo/Projet_Fil_Rouge_IBFormation/blob/main/Dockerfile)

Ce fichier contient le script qui permet de créer l'image utilisée dans notre cas qui est "Apache".

### [**jenkinsfile**](https://github.com/StephaneInfo/Projet_Fil_Rouge_IBFormation/blob/main/jenkinsfile)

Le script contenant dans ce fichier décrit les différentes étapes du lancement du pipeline. Effectivement, il permet de piloter toute la chaine CI/CD du projet.

Le pipeline est composé des étapes suivantes:
1) Build image and push Image on private docker registry
2) Run container based on builded image
3) Test image
4) Clean Container
5) Prepare ansible environment
6) Push image in staging and deploy it
7) Push Image on private docker registry_latest
8) Push image in production and deploy it 


## Marche à suivre

Pour lancer notre pipeline, nous avons exécuté les commandes suivantes et dans ce qui suit l'output (tiré du dossier [Images](https://github.com/StephaneInfo/Projet_Fil_Rouge_IBFormation/tree/main/Images)):

1) Cette commande permet la création des machines virtuelles définies dans le fichier "Vagrantfile"
            
            vagrant up --provision

2) Il est nécéssaire de récupérer la clé privée de jenkins pour l'enregistrer dans l'application jenkins :

            sudo cat /var/lib/jenkins/.ssh/id_rsa

3) Nous avons fait le choix de copier le contenu du résultat de la commande dans un fichier que nous avons enregistré sur l'ordinateur
 
4) Après l'installation de jenkins sur la machine master, on lance jenkins via un navigateur à l'adresse :

            192.168.99.10:8080

5) Il faut maintenant récupérer le mot de passe de jenkins et l'insérer dans le formulaire :

        sudo cat /var/lib/jenkins/secrets/initialAdminPassword

6) Dans le partie Adminsitrer jenkins, Gestion des plugins disponibles, on cherche docker-builder-step afin de l'installer

7)  Toujours dans la partie Adminsitrer jenkins, Manage credentials, Stores scoped to Jenkins, cliquer sur jenkins puis sur Identifiants globaux (illimité)

8)  Cliquer sur Ajouter des identifiants, choisir le type Secret file, cliquer sur Parcourir et prendre le fihier enregistré avec la clé privée de jenkins

9) En ID, on a choisi private_keys_jenkins qui est utilisé dans le jenkinfile  

 










