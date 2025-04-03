#!/bin/bash

colors=("blue" "red" "yellow" "green" "purple" "orange" "brown")

for color in "${colors[@]}"; do
    # Créer un arrière-plan coloré
    #convert -size 1200x1600 gradient:$color-white background_temp.png
    convert -size 1000x1 xc: +noise Random -channel G -separate +channel \
        -scale 1200x1000\!                                +write flare_1a.png \
        \( -size 1200x1000 gradient:"$color-gray(100%)-yellow" -sigmoidal-contrast 10x50% \) \
        -colorspace sRGB -compose hardlight -composite  +write flare_1b.png \
        -virtual-pixel HorizontalTileEdge -distort Polar -1 \
        background_temp.png


    
    # Ajouter une image centrale et un titre
    montage notesmusic.png -background none -gravity center -geometry +0+0 central_image.png

    
    # Ajouter des détails d'informations

    convert background_temp.png central_image.png -gravity center -composite \
        -gravity north -pointsize 100 -fill white -annotate +0+50 'Concert Unique' affiche_temp.png
    convert affiche_temp.png -background black -gravity center -pointsize 120 -fill white -annotate +0+300 \
        'Le 1er avril\nCafé Musique' info_temp.png
    
    # Incorporer une bande avec plus d'éléments visuels
    montage djembe.png guitare.png violin.png mic.png pianoelectric.png balalaika.png violin.png guitarbass.png  saxophone.png  -background none -geometry +50+50 -resize 30% -tile x5 line_elements.png
    convert -size 250x50 xc:red   -draw "font-size 52  decorate UnderLine \
                 fill dodgerblue  stroke navy  stroke-width 2 \
                 text 0,30 ' mon resto '"  monresto.gif

    convert -size 1200x1000 xc:none -pointsize 150       -fill $color -stroke white -strokewidth 3 -gravity center -draw 'rotate -15 text 200,-300 "music resto"'      texte_affiche.png 
    convert -size 200x50 xc:Skyblue   -draw "font-size 52  decorate UnderLine \
                 fill dodgerblue  stroke navy  stroke-width 2 \
                 text 0,30 ' presente '"  -rotate -15     presente.gif
    convert presente.gif -fuzz 20% -transparent white presente.gif
    convert -size 400x100 xc:SkyBlue   -draw "font-size 52  decorate UnderLine \
                 fill dodgerblue  stroke navy  stroke-width 2 \
                 text 0,60 ' à partir de 20H '"       -rotate -15    heure.gif
    convert heure.gif -fuzz 20% -transparent white heure.gif



    convert  info_temp.png line_elements.png -gravity center -geometry +0+50 -composite \
        "concert_affiche_${color}.png"
    convert "concert_affiche_${color}.png" texte_affiche.png  -gravity center -geometry +0+50 -composite \
        "concert_affiche_${color}.png"
    convert "concert_affiche_${color}.png" monresto.gif  -gravity north -geometry +0+25 -composite \
        "concert_affiche_${color}.png"
    convert "concert_affiche_${color}.png" presente.gif  -gravity north -geometry +0+75 -composite \
        "concert_affiche_${color}.png"
    convert "concert_affiche_${color}.png" heure.gif  -gravity south -geometry -400+300 -composite \
        "concert_affiche_${color}.png"





done


