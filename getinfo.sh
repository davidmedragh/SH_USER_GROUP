#! /bin/bash
########Debut du script #########
 
#debut de la fonction whats qui affiche le nature de chaque argument saisie par l'utilisateur

#############################"debut isuser###################################################################################
function isuser()
{
#test user		
		if [[ $(grep "$param" /etc/passwd|cut -d: -f1) = "$param" ]] ; then	
			echo
			echo "$param Est user"	#grep "$param" /etc/passwd:envoi 							#comme resultat au cut  la liste du 
 	 					#fichier passwd contenant le motif 							#param le cut selectionne 							#uniquement le premier champ 
		        echo "	--->Son groupe principal est:---> [[ $(groups "$param" |cut -d" " -f3) ]]"
			echo "	--->Ses groupes anexes sont: $(groups "$param" |cut -d" " -f4-)";
		fi
}
###############################################"fin is user##################################################################
classusergroup(){
	for param in "$@"; do 	
		if [[ $(groups "$param" |cut -d" " -f3) ]] ;then #[[ $(grep "$param" /etc/passwd|cut -d: -f1) = "$param" ]] ; then		#pour chaque paramètre
		echo
		fi	
	done

}
#################################################debut is group##############################################################
function isgroup()
{
#test group		
		if [[ $(grep  "$param" /etc/group|cut -d: -f1) = "$param" ]] ; then	
			#groupe=$param;#On sauvegarde le groupe dont on veut classer les user;
			#utils =	grep "$param" /etc/group|cut -d: -f1;	
			echo "$param Est Group"	;
			gidd=$(grep  "$param" /etc/group|cut -d: -f3)
			echo "Son utilisateur principal est:---> $(grep "$gidd" /etc/passwd|cut -d: -f1)"			
			echo "Ses utilisateurs secondaire sont:---->[[ $(grep "$param" /etc/group|cut -d: -f4) ]]"
		fi
}
######################################fin isgroup###########################################################################
#######################################debut whats##########################################################################n
function whats()   #cette fonction retourne la nature  des arguments recu en parametres
{
	for param in "$@"; do 			#pour chaque paramètre
		if [ -d "$param" ]; then	#Est repertoire
			echo "$param:------> Est un repertoire"
		elif [ -L "$param" ]; then	#Est ce lien symbolique
			echo "$param Est un lien symbolique"
		elif [ -b "$param" ]; then	#Est ce de type bloc
			echo "$param Est un fichier de type spécial bloc"	
		elif [ -c "$param" ]; then	#Est ce de type caractere
			echo "$param Est un fichier de type spécial caractère"				
		elif [ -f "$param" ]; then	#Est ce fichier
			echo "$param Est un fichier"		
		
		
		elif [ ! -e "$param" ]; then	#N'existe pas
			echo "$param N'existe pas"

		fi
		#test group
		isgroup $param
		#test user		
		isuser $param
	done	

}

###############################################"fin whats####################################################################
#
function lire_param()				#Cette fonction lit les parametre a analyser
{
#############Recuperation des n parametre###############
#On test si le nombre de parametre
echo -n "Veuillez saisir vos paramètres SVP ------->  :"
read param  #param va contenir nos arguments a traiter
}
###############################################fin de lire_param#############################################################

if [ $# -gt 0 ]
   then exec echo "Le traitement ne necessite aucun Argument Merci a bientot"
fi
lire_param
whats $param

#	  mise en application de l'instruction case.
#	  Pose une question et attend une réponse par [o]ui ou [n]on.
#	  La valeur retournée est 0 pour oui et 1 pour non.

retour=1
while [ "$retour" = "1" ]; do
    echo -n "On continue (O/N) ? "
    read reponse
    
    case "$reponse" in
	o | O )
	lire_param
	whats $param	
	retour=1
	;;
	[nN] )
	retour=0
	;;
	"?"* )
	echo "Il n'y a pas d'aide disponible"
	;;
	* )
	echo "Erreur : entrez  O pour [O]ui ou N pour [N]on."
	;;
    esac
    
    echo ""
done

exit $retour
