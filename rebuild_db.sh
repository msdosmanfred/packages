#!/bin/bash
echo "###########################"
echo "Building the x86_64 Repo DB."
echo "###########################"

cd x86_64
rm -f custom*

repo-add -n -R custom.db.tar.gz *.pkg.tar.zst

rm custom.db
rm custom.files

mv custom.db.tar.gz custom.db
mv custom.files.tar.gz custom.files

echo "#######################################"
echo "Packages in the x86_64 Repo are up2date!"
echo "#######################################"
