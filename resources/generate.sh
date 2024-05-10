#!/bin/bash

./generate_config.sh

echo -e ''
./other/packages.sh

echo "Patching some libraries so you won't see warnings :D"
./patchLibs.sh

echo -e ''
echo "Processing images"
cd images/
./convertImages.sh
cd ../

echo -e ''
echo "Processing fonts"
cd fonts/
./convertFonts.sh
cd ../

echo -e ''
echo "Processing book"
cd books/
./convertBooks.py
cd ../

echo -e ''
echo "Processing vault"
cd vault/
./convertImagesVault.sh
cd ../