#!/bin/bash
bold=$(tput setaf 2)
normal=$(tput sgr0)

echo -e "\n\t${bold}################################"
echo -e "\t# Building the x86_64 Repo DB. #"
echo -e "\t################################${normal}"

cd x86_64
rm -f arschlive-repo*

repo-add -n -R arschlive-repo.db.tar.gz *.pkg.tar.zst &> /dev/null

rm arschlive-repo.db
#rm arschlive-repo.db.sig
rm arschlive-repo.files
#rm arschlive-repo.files.sig

mv arschlive-repo.db.tar.gz arschlive-repo.db
#mv arschlive-repo.db.tar.gz.sig arschlive-repo.db.sig
mv arschlive-repo.files.tar.gz arschlive-repo.files
#mv arschlive-repo.files.tar.gz.sig arschlive-repo.files.sig

git add .
git commit -am "Updating db"
git push

echo -e "\n\t${bold}############################################"
echo -e "\t# Packages in the x86_64 Repo are up2date! #"
echo -e "\t############################################${normal}"
