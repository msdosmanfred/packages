#!/bin/bash
echo "###########################"
echo "Building the x86_64 Repo DB."
echo "###########################"

cd x86_64
rm -f custom*

repo-add -n -R custom.db.tar.gz *.pkg.tar.zst

rm custom.db
#rm custom.db.sig
rm custom.files
#rm custom.files.sig

mv custom.db.tar.gz custom.db
#mv custom.db.tar.gz.sig custom.db.sig
mv custom.files.tar.gz custom.files
#mv custom.files.tar.gz.sig custom.files.sig

git add .
git commit -am "Updating db"
git push

bold=$(tput setaf 2)
normal=$(tput sgr0)

echo -e "\n\t${bold}############################################"
echo -e "\t# Packages in the x86_64 Repo are up2date! #"
echo -e "\t############################################${normal}"
