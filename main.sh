#!/bin/sh
echo "--- Menu général ---"
echo "Saisissez un choix,  <q> pour quitter le menu"
echo "<1> 	Apercu du site"
echo "<2> 	Publier le site"
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
            git git subtree push --prefix public/ origin gh-pages
            git push origin master
            echo "OK."
            exit;;
        q)
            break
            exit;;
        *) exit;;
    esac
done