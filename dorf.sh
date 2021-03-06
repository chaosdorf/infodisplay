#!/bin/sh

sleep 10

xset s off
xset -dpms

(
while true; do
wkhtmltopdf --page-size A3 --margin-top 0 --minimum-font-size 20 \
 --user-style-sheet wiki-override.css \
 'https://wiki.chaosdorf.de/Infodisplay/Infodisplay' /tmp/info.pdf
pdftoppm -png -y 140 -H 1000 -r 109 /tmp/info.pdf > /tmp/termine.png
wkhtmltopdf --page-size A3 --margin-top 0 --minimum-font-size 20 \
 --user-style-sheet blog-override.css \
 'http://chaosdorf.de/' /tmp/news.pdf
pdftoppm -png -y 50 -H 1000 -r 109 /tmp/news.pdf > /tmp/news.png
sleep 6h
done
) &

(
while true; do
feh --full-screen --slideshow-delay 25 --hide-pointer --cycle-once \
/tmp/termine.png \
'http://vrrf.finalrewind.org/Duesseldorf/Luisenstr.png?no_lines=10'
feh --full-screen --slideshow-delay 25 --hide-pointer --cycle-once \
/tmp/news.png \
'http://vrrf.finalrewind.org/Duesseldorf/Luisenstr.png?no_lines=10'
if [ -e /tmp/override.png ]; then
feh --full-screen --slideshow-delay 25 --hide-pointer --cycle-once \
/tmp/override.png
fi
done
) &
