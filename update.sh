#!/bin/bash
set -e

if [[ -z "$1" ]]
then
	echo 'Usage: ./update.sh VERSION' >&2
	exit 1
fi

rm -r *
git checkout -- update.sh CNAME

curl -o update.zip -L "https://github.com/mayswind/AriaNg/releases/download/$1/AriaNg-$1.zip"
unzip update.zip
rm update.zip

git add -A
git commit -m "Import v$1"
git tag "v$1"
