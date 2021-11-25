#!/bin/bash

SCRIPT_OUTPUT="/home/$USER/.local/share/nautilus/scripts"

# $1 base script name
# $2 output script name
# $3 replacers (sed sintax, line separated, ex: "s/ONE/${ONE}/g\ns/TWO/${TWO}/g")
function make_script () {
    echo "making script: $2"

    OUTPUT="$SCRIPT_OUTPUT/$2"
    
    [[ -f "$OUTPUT" ]] && rm "$OUTPUT"

    cp "src/$1" "$OUTPUT"

    echo -e "$3" | xargs -i sed -i "{}" "$OUTPUT"

    chmod +x "$OUTPUT"

    echo "done $2"
}

function sed_replace() {
    SANITIZED=$(echo $2 | sed 's/\//\\\//g')
    
    echo "s/$1/$SANITIZED/g"
}

make_script \
    "image-trim.sh" \
    "image-trim.sh" \
    "$(sed_replace "IMAGEMAGICK_CLI" "convert")"

make_script \
    "open-with.sh" \
    "open-in-gimp.sh" \
    "$(sed_replace "APP_CLI" "flatpak run org.gimp.GIMP")"

make_script \
    "open-with.sh" \
    "open-in-inkscape.sh" \
    "$(sed_replace "APP_CLI" "inkscape --pdf-poppler")"

make_script \
    "copy-to.sh" \
    "copy-to-downloads.sh" \
    "$(sed_replace "COPY_OUTPUT" "/home/$USER/Downloads")"

make_script \
    "copy-to.sh" \
    "copy-to-documents.sh" \
    "$(sed_replace "COPY_OUTPUT" "/home/$USER/Documents")"