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

echo "Image générée : output.jpg"

