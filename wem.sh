#!/bin/bash

echo -e "Put your unencrypted .wem files in the 'input' folder."
read -p "Press Enter to continue..." pause

if [ ! -d "input" ]; then
    echo -e "The 'input' folder does not exist. Please create the folder and place your files in it."
    read -p "Press Enter to continue..." pause
    exit 1
fi

mkdir -p output

echo -e "Processing the files in the 'input' folder..."

for file in input/*.wem; do
    $HOME/ww2ogg "$file" --pcb $HOME/packed_codebooks_aoTuV_603.bin -o "output/$(basename "$file" .wem).ogg"
    $HOME/revorb "output/$(basename "$file" .wem).ogg"
done

echo -e "Conversion process completed. The converted files can be found in the 'output' folder."
read -p "Press Enter to exit..."
exit 0
