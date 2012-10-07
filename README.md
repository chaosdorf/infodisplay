# Chaosdorf Infodisplay

See also: <https://wiki.chaosdorf.de/Host:Infodisplay>

Setup:

* `nodm` for automatic login
* `xfce4` (most other window managers also support startup scripts)
* `.config/autostart/Dorfderf.desktop` to start script
* `dorf.sh` to update and display data

web pages are converted into images using `wkhtmltopdf` and `pdftoppm` with
appropriate margin settings. These are displayed using feh, eliminating the
need for scripting a web browser.
