[![Build Status](https://secure.travis-ci.org/onlyuser/gnu-tools.png)](http://travis-ci.org/onlyuser/gnu-tools)

gnu-tools
=========

Copyright (C) 2011-2017 <mailto:onlyuser@gmail.com>

About:
------

gnu-tools is a collection of recipes for building gnu-tools from scratch.

Currently, only these tools & versions are supported, but you can switch versions easily:

* gcc 4.6.3
* bison 2.5

Requirements:
-------------

    bash make gcc wget curl ftp://gcc.gnu.org/pub/gcc/infrastructure http://www.mr511.de/software http://ftp.gnu.org/gnu/gcc

Installation (Debian):
----------------------

1. git clone https://github.com/onlyuser/gnu-tools.git
2. sudo aptitude install make
3. sudo aptitude install gcc
4. sudo aptitude install wget
5. sudo aptitude install curl

Usage:
------

1. If you use Ubuntu 11.04 x86_64 and wish to build gcc, you may need two extra environment variables:
    * $C_INCLUDE_PATH -- where "asm/errno.h" resides ("/usr/include/x86_64-linux-gnu" on my machine)
    * $CPLUS_INCLUDE_PATH -- where "asm/errno.h" resides ("/usr/include/x86_64-linux-gnu" on my machine)
2. Change into the directory for the tool you wish to build and enter "make".

Make targets:
-------------

<table>
    <tr><th> target </th><th> action                        </th></tr>
    <tr><td> all    </td><td> make binaries                 </th></tr>
    <tr><td> clean  </td><td> remove all intermediate files </th></tr>
</table>

References:
-----------

<dl>
    <dt>"How to install GCC from scratch with GMP, MPFR, MPC, ELF, without shared libraries?"</dt>
    <dd>http://stackoverflow.com/questions/9450394/how-to-install-gcc-from-scratch-with-gmp-mpfr-mpc-elf-without-shared-librari</dd>
    <dt>"How to build GNU Compiler Collection"</dt>
    <dd>http://www.acsu.buffalo.edu/~charngda/cc_build.html</dd>
    <dt>"Compilation cannot find file asm/errno.h"</dt>
    <dd>http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48879</dd>
</dl>

Keywords:
---------

    gnu, gcc, bison, Linux
