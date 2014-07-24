#!/bin/bash
MODULENAME=ace
CWD=`pwd`
./generate_with_version.sh
PUBLISHDIR=${CWD}/publish
rm -rf ${PUBLISHDIR}
mkdir ${PUBLISHDIR} 
cp README.md kanso.json ace.js ${PUBLISHDIR} 
for i in ace node_modules build
do
  cp -R $i ${PUBLISHDIR} 
done
cd ${PUBLISHDIR}
kanso publish
cd ${CWD} 
rm -rf ${PUBLISHDIR} 

