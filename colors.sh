for color in "blue" "red" "yellow" "green" "purple" "orange" "brown"
do

    convert -background white -gravity center \( -size 600x600 xc:none -stroke black -fill $color -draw "circle 300,300 600,300" -gravity center -pointsize 100  \) date_temp.png

    convert date_temp.png -gravity center -pointsize 150 -fill white -annotate 0 '1 avril \n 20h' "date.png"
    convert -background white -gravity center \( -size 600x600 xc:none -stroke black -fill $color -draw "circle 300,300 600,300" -gravity center  \) music_temp.png
    convert music_temp.png -gravity center -pointsize 150 -fill white -annotate 0 'Music\nma\nmusic' "music.png"
    montage notesmusic.png djembe.png date.png notesmusic.png balalaika.png violin.png mic1.png guitarbass.png pianoelectric.png notesmusic.png saxophone.png notesmusic.png music.png guitare.png mic.png tablemixage.png  -background white -geometry +10+10 -tile x4 flex_output_temp.png
    
    convert flex_output_temp.png -gravity center -pointsize 150 -fill black -annotate 0 'avec\nmon groupe \nde musique' "musicresto_$color.png"
done
