#!/bin/bash
./clean_build.sh
## download new source
cd ..; makepkg -o --skipchecksums ; cd ./patch/;

## clean tmp dir 
cp -R rambox_git/* rambox_tmp/
rm -r -f rambox_tmp/.git rambox_tmp/.idea/ rambox_tmp/.gitignore rambox_tmp/build

diff -ura --exclude="resources" --exclude="packages" --exclude=".travis.yml" --exclude="ext" --exclude="node_modules" --exclude="build" rambox_AUR/ rambox_tmp/ > package.patch
mv package.patch ../src/
cd ..
makepkg -if --skipchecksums
rm -r -f patch/rambox_tmp/ ; mkdir patch/rambox_tmp/ 
