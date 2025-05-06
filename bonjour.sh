#!/bin/bash

# Créer une image de fond
convert -size 800x600 xc:black output.jpg

# Ajouter du texte
convert output.jpg -pointsize 40 -fill white -gravity center -annotate +0+0 "concert 1 juin 18h 'Mon Gfroupe' 'Ma Musik'" output.jpg

# Ajouter un triangle vert
convert output.jpg -fill green -draw "polygon 100,100 150,50 200,100" output.jpg

# Ajouter un carré rouge
convert output.jpg -fill red -draw "rectangle 300,100 400,200" output.jpg

# Ajouter un cercle jaune
convert output.jpg -fill yellow -draw "circle 500,150 525,175" output.jpg

# Ajouter un rectangle bleu
convert output.jpg -fill blue -draw "rectangle 600,100 700,250" output.jpg

# Ajouter une ellipse violette
convert output.jpg -fill purple -draw "ellipse 400,400 50,30 0,360" output.jpg

# Ajouter une ligne diagonale blanche
convert output.jpg -stroke white -strokewidth 5 -draw "line 50,550 750,50" output.jpg

# Ajouter un losange orange
convert output.jpg -fill orange -draw "polygon 250,300 300,250 350,300 300,350" output.jpg

echo "Image générée : output.jpg"

convert output.jpg -fill brown -draw "ellipse 150,450 40,60 0,360" \
                   -stroke white -strokewidth 5 -draw "line 150,400 150,300" output.jpg

convert output.jpg -pointsize 30 -fill white -gravity south \
                   -annotate +0+50 "Avec guitare et percussions !" output.jpg

convert output.jpg -fill black -draw "rectangle 100,500 200,550" \
                   -fill white -draw "rectangle 200,500 300,550" output.jpg

convert output.jpg -fill gold -draw "ellipse 350,350 30,10 0,360" \
                   -fill gold -draw "circle 375,300 380,305" output.jpg

convert output.jpg -fill wood -draw "ellipse 500,350 40,60 0,360" \
                   -fill wood -draw "ellipse 500,450 40,60 0,360" \
                   -stroke black -strokewidth 4 -draw "line 500,280 500,350" output.jpg

