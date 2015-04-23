#!/bin/bash
MODULENAME=ace
VERSION="1.1.4"
URL="http:\/\/ace.c9.io\/"
REPONAME=ace-builds
DOWNLOAD_URL=https://github.com/ajaxorg/$REPONAME/archive/v$VERSION.zip
rm -rf node_modules
npm install git+https://github.com/kanso/kanso-utils.git 
npm install async 
curl -L -O $DOWNLOAD_URL
unzip v$VERSION.zip
rm -rf ace
mv $REPONAME-$VERSION/src-noconflict ace
rm -rf ace/snippets
mv ace/ace.js .
patch -p0 < ace.js.patch
echo $VERSION
for var in README.md kanso.json
do
  sed -e s/@VERSION@/$VERSION/g \
      -e s/@MODULENAME@/$MODULENAME/g \
      -e s/@URL@/$URL/g \
             $var.in > $var 
done
rm -rf v$VERSION.zip $REPONAME-$VERSION
