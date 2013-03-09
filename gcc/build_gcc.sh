#!/bin/bash

#VERSION INFO
GMP=gmp-4.3.2
MPFR=mpfr-2.4.2
MPC=mpc-0.8.1
ELF=libelf-0.8.13
GCC=gcc-4.6.3

#SOURCE URLS
GCC_INFRA_URL=ftp://gcc.gnu.org/pub/gcc/infrastructure
ELF_URL=http://www.mr511.de/software
GCC_URL=http://ftp.gnu.org/gnu/gcc #http://www.netgull.com/gcc/releases/

#LOCAL PATHS
GCC_INFRA_PREFIX=/tmp/gcc
GCC_PREFIX=/tmp/gcc

#UBUNTU 11.04 + DISABLE MULTILIB WORKAROUND
export C_INCLUDE_PATH=/usr/include/x86_64-linux-gnu
export CPLUS_INCLUDE_PATH=/usr/include/x86_64-linux-gnu

#CLEANUP
rm -rf $GMP
rm -rf $MPFR
rm -rf $MPC
rm -rf $ELF
rm -rf $GCC
rm -rf $GCC_INFRA_PREFIX
rm -rf $GCC_PREFIX

#INIT
mkdir -p $GCC_INFRA_PREFIX
mkdir -p $GCC_PREFIX

#GMP
echo "installing GMP.."
wget $GCC_INFRA_URL/$GMP.tar.bz2
bunzip2 $GMP.tar.bz2
tar xvf $GMP.tar
rm $GMP.tar
cd $GMP
./configure --disable-shared --enable-static --prefix=$GCC_INFRA_PREFIX
make && make check && make install
cd ..

#MPFR
echo "installing MPFR.."
wget $GCC_INFRA_URL/$MPFR.tar.bz2
bunzip2 $MPFR.tar.bz2
tar xvf $MPFR.tar
rm $MPFR.tar
cd $MPFR
./configure --disable-shared --enable-static --prefix=$GCC_INFRA_PREFIX --with-gmp=$GCC_INFRA_PREFIX
make && make check && make install
cd ..

#MPC
echo "installing MPC.."
wget $GCC_INFRA_URL/$MPC.tar.gz
tar zxvf $MPC.tar.gz
rm $MPC.tar.gz
cd $MPC
./configure --disable-shared --enable-static --prefix=$GCC_INFRA_PREFIX --with-gmp=$GCC_INFRA_PREFIX --with-mpfr=$GCC_INFRA_PREFIX
make && make check && make install
cd ..

#ELF
echo "installing ELF.."
wget $ELF_URL/$ELF.tar.gz
tar zxvf $ELF.tar.gz
rm $ELF.tar.gz
cd $ELF
./configure --disable-shared --enable-static --prefix=$GCC_INFRA_PREFIX
make && make check && make install
cd ..

#GCC
echo "installing GCC.."
wget $GCC_URL/$GCC/$GCC.tar.gz
tar zxvf $GCC.tar.gz
rm $GCC.tar.gz
cd $GCC
./configure --disable-shared --prefix=$GCC_PREFIX \
    --disable-bootstrap \
    --disable-libstdcxx-pch \
    --disable-multilib \
    --enable-languages=c,c++ \
    --enable-lto \
    --enable-threads=posix \
    --with-gmp=$GCC_INFRA_PREFIX \
    --with-mpfr=$GCC_INFRA_PREFIX \
    --with-mpc=$GCC_INFRA_PREFIX \
    --with-libelf=$GCC_INFRA_PREFIX \
    --with-fpmath=sse
make && make install
cd ..

echo "Done!"
