#!/bin/bash

for file in input/*.bnk; do
    $HOME/bnkextr $file
done

echo -e "Extraction process completed."
read -p "Press Enter to exit..."
exit 0
