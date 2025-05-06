#!/bin/bash

# Définir le nom du fichier
image="output.jpg"

# Créer une image de fond noire
convert -size 800x600 xc:black "$image"

# Ajouter le texte du concert
convert "$image" -pointsize 40 -fill white -gravity center \
        -annotate +0+0 "Concert 1 juin 18h - Mon Groupe - Ma Musik" "$image"

# Ajouter différentes formes colorées
convert "$image" -fill green -draw "polygon 100,100 150,50 200,100" "$image"
convert "$image" -fill red -draw "rectangle 300,100 400,200" "$image"
convert "$image" -fill yellow -draw "circle 500,150 525,175" "$image"
convert "$image" -fill blue -draw "rectangle 600,100 700,250" "$image"
convert "$image" -fill purple -draw "ellipse 400,400 50,30 0,360" "$image"
convert "$image" -stroke white -strokewidth 5 -draw "line 50,550 750,50" "$image"
convert "$image" -fill orange -draw "polygon 250,300 300,250 350,300 300,350" "$image"

# 🎸 Ajout de la guitare
convert "$image" -fill brown -draw "ellipse 150,450 40,60 0,360" "$image"
convert "$image" -stroke white -strokewidth 5 -draw "line 150,400 150,300" "$image"

# 🎹 Ajout du piano
convert "$image" -fill black -draw "rectangle 100,500 200,550" "$image"
convert "$image" -fill white -draw "rectangle 200,500 300,550" "$image"

# 🎷 Ajout du saxophone
convert "$image" -fill gold -draw "ellipse 350,350 30,10 0,360" "$image"
convert "$image" -fill gold -draw "circle 375,300 380,305" "$image"

# 🎻 Ajout du violon
convert "$image" -fill wood -draw "ellipse 500,350 40,60 0,360" "$image"
convert "$image" -fill wood -draw "ellipse 500,450 40,60 0,360" "$image"
convert "$image" -stroke red -strokewidth 4 -draw "line 500,280 500,350" "$image"

# 🥁 Ajout de la batterie
# Tambour
convert "$image" -fill gray -draw "circle 250,400 280,430" "$image"
# Cymbales
convert "$image" -fill gold -draw "ellipse 200,350 50,15 0,360" "$image"
# Baguettes
convert "$image" -stroke brown -strokewidth 5 -draw "line 230,380 270,350" "$image"
convert "$image" -stroke brown -strokewidth 5 -draw "line 220,390 260,360" "$image"

# Ajouter une mention sur les instruments
convert "$image" -pointsize 30 -fill white -gravity south \
        -annotate +0+50 "Avec guitare, piano, saxophone, violon et batterie !" "$image"

echo "✅ Image générée avec succès : $image"

