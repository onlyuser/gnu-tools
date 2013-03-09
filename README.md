gnu-tools
=========

Copyright (C) 2011-2013 Jerry Chen <mailto:onlyuser@gmail.com>

About:
------

gnu-tools is a collection of recipes for building gnu-tools from scratch.
Currently, only these tools & versions are supported, but you can switch versions quite easily:

* gcc 4.6.3
* bison 2.5

Requirements:
-------------

* bash
* make
* gcc
* wget
* ftp://gcc.gnu.org/pub/gcc/infrastructure
* http://www.mr511.de/software
* http://ftp.gnu.org/gnu/gcc

Installation (Debian):
----------------------

1. git clone https://github.com/onlyuser/gnu-tools.git
2. sudo aptitude install make
3. sudo aptitude install gcc
4. sudo aptitude install wget

Usage:
------

1. If you use Ubuntu and you wish to build gcc from scratch, you will need these two environment variables:
    C_INCLUDE_PATH=/usr/include/x86_64-linux-gnu
    CPLUS_INCLUDE_PATH=/usr/include/x86_64-linux-gnu
2. Change into the directory for the tool you wish to build from scratch, and enter "make".

References:
-----------

<dl>
    <dt>"How to install GCC from scratch with GMP, MPFR, MPC, ELF, without shared libraries?"</dt>
    <dd>http://stackoverflow.com/questions/9450394/how-to-install-gcc-from-scratch-with-gmp-mpfr-mpc-elf-without-shared-librari</dd>

    <dt>"How to build GNU Compiler Collection"</dt>
    <dd>http://www.acsu.buffalo.edu/~charngda/cc_build.html</dd>
</dl>

Keywords:
---------

    gnu, gcc, bison, Linux
