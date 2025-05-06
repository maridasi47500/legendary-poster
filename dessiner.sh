#!/bin/bash

# Définir le nom du fichier
image="output.jpg"

# Créer une image de fond noire
convert -size 800x600 xc:black "$image"

# Ajouter le texte du concert
convert "$image" -pointsize 40 -fill white -gravity center \
        -annotate +0+0 "Concert 1 juin 18h - Mon Groupe - Ma Musik" "$image"
# Touches blanches (en haut)
convert "$image" -fill white -draw "rectangle 100,50 140,100" "$image"
convert "$image" -fill white -draw "rectangle 140,50 180,100" "$image"
convert "$image" -fill white -draw "rectangle 180,50 220,100" "$image"

# Touches noires (plus petites et placées en hauteur)
convert "$image" -fill black -draw "rectangle 120,50 150,80" "$image"
convert "$image" -fill black -draw "rectangle 160,50 190,80" "$image"
convert "$image" -fill black -draw "rectangle 200,50 230,80" "$image"
# Corps triangulaire de la balalaïka
convert "$image" -fill orange -draw "polygon 700,50 750,20 800,50" "$image"

# Manche de la balalaïka
convert "$image" -stroke brown -strokewidth 5 -draw "line 750,50 750,150" "$image"

# Cordes de la balalaïka
convert "$image" -stroke white -strokewidth 2 -draw "line 740,50 740,150" "$image"
convert "$image" -stroke white -strokewidth 2 -draw "line 750,50 750,150" "$image"
convert "$image" -stroke white -strokewidth 2 -draw "line 760,50 760,150" "$image"



# 🎸 Ajouter une guitare
convert "$image" -fill maroon -draw "ellipse 150,450 40,60 0,360" "$image"
convert "$image" -stroke white -strokewidth 5 -draw "line 150,400 150,300" "$image"

## 🎹 Ajouter un piano (Touches noires et blanches)
#convert "$image" -fill black -draw "rectangle 100,500 200,550" "$image"
#convert "$image" -fill white -draw "rectangle 200,500 300,550" "$image"

# 🎷 Corps du saxophone (ellipse plus grande)
convert "$image" -fill gold -draw "ellipse 350,350 40,15 0,360" "$image"

# 🎷 Ajouter une courbure pour le pavillon
convert "$image" -fill gold -draw "ellipse 380,300 20,10 0,360" "$image"

# 🎷 Bout de l'embouchure
convert "$image" -fill gold -draw "circle 390,280 400,290" "$image"

# 🎷 Détails des touches (petits cercles)
convert "$image" -fill orange -draw "circle 345,360 350,365" "$image"
convert "$image" -fill orange -draw "circle 355,370 360,375" "$image"
convert "$image" -fill orange -draw "circle 365,380 370,385" "$image"


# 🎻 Ajouter un violon en bas à droite
convert "$image" -fill maroon -draw "ellipse 700,500 40,60 0,360" "$image"
convert "$image" -fill maroon -draw "ellipse 700,600 40,60 0,360" "$image"
convert "$image" -stroke red -strokewidth 4 -draw "line 700,450 700,500" "$image"


# 🥁 Ajouter une batterie
convert "$image" -fill gray -draw "circle 250,400 280,430" "$image"
convert "$image" -fill gold -draw "ellipse 200,350 50,15 0,360" "$image"
convert "$image" -stroke brown -strokewidth 5 -draw "line 230,380 270,350" "$image"
convert "$image" -stroke brown -strokewidth 5 -draw "line 220,390 260,360" "$image"
# 🎤 Corps du microphone (cercle)
convert "$image" -fill gray -draw "circle 400,50 420,70" "$image"

# 🎤 Manche du microphone (rectangle vertical)
convert "$image" -fill darkgray -draw "rectangle 395,70 425,120" "$image"

# 🎤 Grille du microphone (petites lignes pour simuler une texture)
convert "$image" -stroke white -strokewidth 2 -draw "line 400,50 420,55" "$image"
convert "$image" -stroke white -strokewidth 2 -draw "line 400,55 420,60" "$image"
convert "$image" -stroke white -strokewidth 2 -draw "line 400,60 420,65" "$image"


# Ajouter une mention sur les instruments
convert "$image" -pointsize 30 -fill white -gravity south \
        -annotate +0+50 "Avec guitare, piano, saxophone, violon et batterie !" "$image"

echo "✅ Image générée avec succès : $image"

