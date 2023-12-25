#!/bin/bash
echo "###########################"
echo "Building the x86_64 Repo DB."
echo "###########################"

cd x86_64
rm -f custom*

repo-add -n -R -s custom.db.tar.gz *.pkg.tar.zst

rm custom.db
rm custom.db.sig
rm custom.files
rm custom.files.sig

mv custom.db.tar.gz custom.db
mv custom.db.tar.gz.sig custom.db.sig
mv custom.files.tar.gz custom.files
mv custom.files.tar.gz.sig custom.files.sig

echo "#######################################"
echo "Packages in the x86_64 Repo are up2date!"
echo "#######################################"
