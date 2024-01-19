#!/bin/bash
bold=$(tput setaf 2)
normal=$(tput sgr0)

echo -e "\n\t${bold}################################"
echo -e "\t# Building the x86_64 Repo DB. #"
echo -e "\t################################${normal}"

cd x86_64
rm -f arschlive*

repo-add -n -R arschlive.db.tar.gz *.pkg.tar.zst &> /dev/null

rm arschlive.db
#rm arschlive.db.sig
rm arschlive.files
#rm arschlive.files.sig

mv arschlive.db.tar.gz arschlive.db
#mv arschlive.db.tar.gz.sig arschlive.db.sig
mv arschlive.files.tar.gz arschlive.files
#mv arschlive.files.tar.gz.sig arschlive.files.sig

git add .
git commit -am "Updating db"
git push

echo -e "\n\t${bold}############################################"
echo -e "\t# Packages in the x86_64 Repo are up2date! #"
echo -e "\t############################################${normal}"
