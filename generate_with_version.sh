#!/bin/bash
MODULENAME=ace
VERSION="2014.07.09"
URL="http:\/\/ace.c9.io\/"
REPONAME=ace-builds
DOWNLOAD_URL=https://github.com/ajaxorg/$REPONAME/archive/master.zip
rm -rf node_modules
npm install kanso-utils
npm install async 
curl -L -O $DOWNLOAD_URL
unzip master.zip
rm -rf ace
mv $REPONAME-master/src ace 
rm -rf ace/snippets
mv ace/ace.js .
echo $VERSION
for var in README.md kanso.json
do
  sed -e s/@VERSION@/$VERSION/g \
      -e s/@MODULENAME@/$MODULENAME/g \
      -e s/@URL@/$URL/g \
             $var.in > $var 
done
rm -rf master.zip $REPONAME-master 
