#!/bin/bash

colors=("blue" "red" "yellow" "green" "purple" "orange" "brown")

for color in "${colors[@]}"; do
    # Créer un arrière-plan coloré
    #convert -size 1200x1600 gradient:$color-white background_temp.png
    convert -size 1200x1000 xc: +noise Random -channel R -threshold .2% \
        -negate -channel RG -separate +channel \
        \( +clone \) -compose multiply -flatten \
        -virtual-pixel tile  -blur 0x.3 \
        \( -clone 0  -motion-blur 0x10+15  -motion-blur 0x10+195 \) \
        \( -clone 0  -motion-blur 0x10+75  -motion-blur 0x10+255 \) \
        \( -clone 0  -motion-blur 0x10-45  -motion-blur 0x10+135 \) \
        -compose screen -background black -flatten  -normalize \
        background_temp.png

    
    # Ajouter une image centrale et un titre
    montage notesmusic.png -background none -gravity center -geometry +0+0 central_image.png
    convert background_temp.png central_image.png -gravity center -composite \
        -gravity north -pointsize 100 -fill white -annotate +0+50 'Concert Unique' affiche_temp.png
    
    # Ajouter des détails d'informations
    convert affiche_temp.png -gravity center -pointsize 150 -fill white -annotate +0+300 \
        'Le 1er avril à 20h\nCafé Musique' info_temp.png
    
    # Incorporer une bande avec plus d'éléments visuels
    montage djembe.png guitare.png violin.png mic.png balalaika.png violin.png guitarbass.png pianoelectric.png  saxophone.png  -background none -geometry +10+10 -resize 50% -tile x5 line_elements.png

    convert -size 1200x1000 xc:none -pointsize 150       -fill $color -stroke white -strokewidth 3 -gravity center -draw 'text 0,-300 "music resto"'      texte_affiche.png 


    convert info_temp.png line_elements.png -gravity center -geometry +0+50 -composite \
        "concert_affiche_${color}.png"
    convert "concert_affiche_${color}.png" texte_affiche.png  -gravity center -geometry +0+50 -composite \
        "concert_affiche_${color}.png"



done


