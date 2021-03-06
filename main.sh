#!/bin/sh
cd "$( dirname "${BASH_SOURCE[0]}" )"
echo "--- Menu général ---"
echo "Saisissez un choix,  <q> pour quitter le menu"
echo "<1> 	Apercu du site"
echo "<2> 	Publier le site"
echo "<3>       Recupérer"
echo "<q>   Quitter"
read choix
case $choix in

        1)
            hugo server
            exit;;
        2)
            hugo
            git add .
            git commit -m "Mise en ligne du `date`"
            git subtree push --prefix public/ origin gh-pages
            git push origin master
            echo "OK."
            exit;;

	3)
	   git pull origin master
	   echo "Ok."
	   exit;;
        q)
            break
            exit;;
        *) exit;;
    esac
done
