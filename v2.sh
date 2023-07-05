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
    qemu-x86_64 $HOME/vgmstream-cli "$file" -o "output/$(basename "$file" .wem).wav"
done

echo -e "Conversion process completed. The converted files can be found in the 'output' folder."
read -p "Press Enter to exit..."
exit 0
