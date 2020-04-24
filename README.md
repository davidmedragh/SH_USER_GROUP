# SH_USER_GROUP
La base de données utilisateurs d'un système UNIX

#La base de données utilisateurs d'un système UNIX est le fichier texte /etc/#passwd (appelé le fichier password)
#Ce fichier possède une ligne par username, divisée en sept champs délimités par le caractère `:' :

#1.
    Username. 
#2.
    Mot de passe, encrypté. 
#3.
    user id numérique. 
#4.
    group id numérique. 
#5.
    Nom complet ou autre description du compte. 
#6.
    Répertoire d'accueil. 
#7.
    Shell de login (programme lancé au login). 


Le numéro de groupe est le numéro qui fait le lien entre les fichiers /etc/group et /etc/passwd
GROUP(5)                  Manuel du programmeur Linux                 GROUP(5)

NOM
       group - Fichier des groupes d’utilisateurs.

DESCRIPTION
       /etc/group est un fichier ASCII qui définit les groupes auxquels appar‐
       tient chaque utilisateur. Il y a une entrée par ligne, et chaque  ligne
       a le format :

             nom_du_groupe:mot_de_passe:GID:liste_utilisateurs

 #      Descriptions des champs :

1  #     nom_du_groupe
              nom du groupe.
2#
       mot_de_passe
              mot  de passe chiffré du groupe. Si ce champ est vide, aucun mot
              de passe n’est nécessaire.

 3#      GID    identifiant numérique du groupe.
 liste_utilisateurs
 4
             tous les noms des membres du groupe, séparés par des virgules.


-----------------------------------------------------------
on cherche a classer les membre principale et secondaire on va raisoner comme suit:
si groupe du user du groupe est groupe alors membre principale
sinon membre secondaire







