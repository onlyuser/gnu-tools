#!/bin/bash

#VERSION INFO
BISON=bison-2.5

#SOURCE URLS
BISON_URL=http://ftp.gnu.org/gnu/bison/

#LOCAL PATHS
BISON_PREFIX=/tmp/bison

#CLEANUP
rm -rf $BISON
rm -rf $BISON_PREFIX

#INIT
mkdir -p $BISON_PREFIX

#BISON
echo "installing BISON.."
wget $BISON_URL/$BISON.tar.gz
tar zxvf $BISON.tar.gz
rm $BISON.tar.gz
#find $BISON -name "*" | xargs -I@ sudo chown $USER:$USER @
cd $BISON
./configure --prefix=$BISON_PREFIX
make && make install
cd ..

echo "Done!"
